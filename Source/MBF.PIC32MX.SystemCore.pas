unit MBF.PIC32MX.SystemCore;
{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}
{< PIC32MXxxx board series functions. }
interface

{$INCLUDE MBF.Config.inc}

uses
  MBF.SystemCore;

{$if defined(PIC32MX1) or defined(PIC32MX2)}
const
  MaxCPUFrequency=48000000;
{$else}
  {$error Unknown Chip series, please define maximum CPU Frequency}
{$endif}

const
  FRCClockFrequency = 8000000;
  SlowRCClockFreq = 32768;
var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;
  XTALFrequency : longWord = 0;

type
  TOSCParameters = record
    FREQUENCY : longWord;
    PLLMULT   : longWord;
    PLLODIV   : longWord;
  end;


  TPIC32MXSystemCore = record helper for TSystemCore
  private
    //procedure ConfigureSystem;
    function GetSysTickClockFrequency : Cardinal;
    function getFrequencyParameters(aFrequency : longWord; aXTALFrequency : longWord = 0; aSYSCLOCK_MAX : longWord = MaxCPUFrequency):TOSCParameters;
  public
    procedure Initialize;
    procedure DisableJTAGInterface;
    procedure EnableJTAGInterface;
    function GetSYSCLKFrequency: Cardinal;
    function GetPBCLKFrequency: Cardinal;
    function GetCPUFrequency: Cardinal;
    procedure setCPUFrequency(const Value: Cardinal;XTALFrequency : longWord = 0);
    function getMaxCPUFrequency : Cardinal;
  end;

var
  SystemCore : TSystemCore;

implementation

{$REGION 'TSystemCore'}

const
  PLLODIV : array[0..7] of word = (1,2,4,8,16,32,64,256);
  FRCDIV : array[0..7] of word = (1,2,4,8,16,32,64,256);
  PLLMULT : array[0..7] of byte = (15,16,17,18,19,20,21,24);
  FPLLIDIV : array[0..7] of byte = (1,2,3,4,5,6,10,12);

procedure TPIC32MXSystemCore.Initialize;
begin
  DisableJTAGInterface;
  ConfigureTimer;
  ConfigureInterrupts;
end;

function TPIC32MXSystemCore.GetSysTickClockFrequency : Cardinal; [public, alias: 'MBF_GetSysTickClockFrequency'];
begin
  Result := GetSysClkFrequency div 2;
end;

procedure TPIC32MXSystemCore.DisableJTAGInterface;
begin
  //CFG.CFGCON := CFG.CFGCON and (not (%1 shl 3));
end;

procedure TPIC32MXSystemCore.EnableJTAGInterface;
begin
  //CFG.CFGCON := CFG.CFGCON or (%1 shl 3);
end;

//procedure TPIC32MXSystemCore.ConfigureSystem;
//begin
//  DisableJTAGInterface;
//  ConfigureInterrupts;
//end;

function TPIC32MXSystemCore.GetCPUFrequency : longWord;
begin
  Result := getSYSCLKFrequency;
end;

function TPIC32MXSystemCore.GetSYSCLKFrequency : longWord;
begin
  case (OSC.OSCCON shr 12) and %111 of
   0:   //Internal FRC Oscillator
        Result := FRCClockFrequency;
   1:   //Internal FRC Oscillator with PLL
        begin
          Result := FRCClockFrequency div 2;
          Result := Result * PLLMULT[(OSC.OSCCON shr 16) and %111] div PLLODIV[(OSC.OSCCON shr 27) and %111]
        end;
   2:   //External Oscillator
          Result := HSEClockFrequency;
   3:   //External Oscillator with PLL
        begin
          Result := HSEClockFrequency div FPLLIDIV[DEVCFG.DEVCFG2 and %111];
          Result := Result * PLLMULT[(OSC.OSCCON shr 16) and %111] div PLLODIV[(OSC.OSCCON shr 27) and %111]
        end;
   4:   //SOSC
          Result := 32768;
   5:   //LPRC
          Result := 31250;
   6:   //Internal FRC Oscillator div 16
        Result := FRCClockFrequency div 16;
   7:   //Internal FRC Oscillator divided by FRC Bits
        Result := FRCClockFrequency div FRCDIV[(OSC.OSCCON shr 24) and %111];
  end;
end;

function TPIC32MXSystemCore.GetPBCLKFrequency : longWord;
begin
  Result := GetSysCLKFrequency shr ((OSC.OSCCON shr 19) and %11)
end;

function TPIC32MXSystemCore.getFrequencyParameters(aFrequency : longWord; aXTALFrequency : longWord = 0;aSYSCLOCK_MAX : longWord = MaxCPUFrequency):TOSCParameters;
const
  PLLFREQMAX = 120000000;
var
  _FPLLIDIV,_PLLMULT,_PLLODIV,PLLFREQ,FREQ : longWord;
  PLLInputFrequency : longWord;
begin
  result.FREQUENCY := 0;
  if aXTALFrequency <> 0 then
    PLLInputFrequency := aXTALFrequency div FPLLIDIV[DEVCFG.DEVCFG2 and %111]
  else
    PLLInputFrequency := FRCClockFrequency div 2;

  for _PLLMULT := 0 to 7 do
  begin
    PLLFREQ := PLLInputFrequency * PLLMULT[_PLLMult];
    if PLLFREQ <= PLLFREQMAX then
    begin
      // Make sure we do not go above max. PLL Output Frequency
      for _PLLODIV := 0 to 7 do
      begin
        FREQ := PLLFREQ div PLLODIV[_PLLODIV];
        if (FREQ > result.FREQUENCY) and (FREQ <= afrequency) then
        begin
          result.FREQUENCY := FREQ;
          result.PLLMULT := _PLLMULT;
          result.PLLODIV := _PLLODIV;
          if FREQ = afrequency then
            exit;
        end;
      end;
    end;
  end;
end;

procedure TPIC32MXSystemCore.setCPUFrequency(const Value : Cardinal;XtalFrequency : longWord = 0);
var
  Params : TOSCParameters;
  i : longWord;
begin
  RegUnlock;
  //Switch to FRC Oscillator as a save starting point
  OSC.OSCCONCLR := %111 shl 8;
  //Enable Switching
  OSC.OSCCONSET := %1 shl 0;
  //Wait for Clock Switch complete
  repeat
  until (OSC.OSCCON and %1) = 0;

  //Clear all relevant Fields
  //PLLODIV
  OSC.OSCCONCLR := %111 shl 27;
  //FRCDIV
  OSC.OSCCONCLR := %111 shl 24;
  //PBDIV
  OSC.OSCCONCLR := %111 shl 24;
  //PLLMULT
  OSC.OSCCONCLR := %111 shl 16;
  //PBDIV
  OSC.OSCCONCLR := %111 shl 8;

  if XtalFrequency <> 0 then
  begin
    if XtalFrequency = Value then
    begin
      OSC.OSCCONSET := %010 shl 8;
    end
    else
    begin
      Params := getFrequencyParameters(Value,HSEClockFrequency);
      OSC.OSCCONSET := %011 shl 8;
      OSC.OSCCONSET := Params.PLLODIV shl 27 + Params.PLLMULT shl 16;
    end;
  end
  else
  begin
    if Value <= FRCClockFrequency then
    begin
      if Value = FRCClockFrequency then
      begin
        OSC.OSCCONSET := %000 shl 8;
      end
      else
      begin
        for i := 0 to 7 do
          if FRCClockFrequency div FRCDIV[i] <= Value then
          begin
            OSC.OSCCONSET := i shl 24;
            OSC.OSCCONSET := %111 shl 8;
          end;
      end;
    end
    else
    begin
      Params := getFrequencyParameters(Value);
      OSC.OSCCONSET := Params.PLLODIV shl 27 + Params.PLLMULT shl 16;
      OSC.OSCCONSET := %001 shl 8;
    end;
  end;

  //Enable Switching
  OSC.OSCCONSET := %1 shl 0;
  //Wait for Clock Switch complete
  repeat
  until (OSC.OSCCON and %1) = 0;
  RegLock;
  ConfigureTimer;
end;

function TPIC32MXSystemCore.getMaxCPUFrequency : Cardinal;
begin
  Result := MaxCPUFrequency;
end;

{$ENDREGION}

begin
end.
