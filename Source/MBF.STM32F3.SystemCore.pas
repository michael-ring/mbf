unit mbf.stm32f3.systemcore;
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
{< ST Micro F3xx board series functions. }
interface

{$INCLUDE MBF.Config.inc}

uses
  MBF.SystemCore;

{$if defined(stm32f3) }
// All f3 chips have 72MHz
const
  MaxCPUFrequency=72000000;
{$else}
  {$error Unknown Chip, please check mbf.boards.stm32f3.inc and then define maximum CPU Frequency here}
{$endif}

const
  HSIClockFrequency = 8000000;
  LSIClockFreq = 40000;
  LSEClockFreq = 32768;

var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;

type
  TClockType = (HSI,HSE,PLLHSI,PLLHSE);

  TSTM32SystemCore = record helper for TSystemCore
  type
    TOSCParameters = record
    FREQUENCY : longWord;
    USBPRE : integer;
    PREDIV : byte;
    PLLMUL : byte;
    AHBPRE : byte;
  end;
  private
    procedure ConfigureSystem;
    function GetFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
    function GetSysTickClockFrequency : Cardinal;
    function GetHCLKFrequency : Cardinal;
  public
    procedure Initialize;
    function GetSYSCLKFrequency: Cardinal;
    function GetAPB1PeripheralClockFrequency : Cardinal;
    function GetAPB1TimerClockFrequency : Cardinal;
    function GetAPB2PeripheralClockFrequency : Cardinal;
    function GetAPB2TimerClockFrequency : Cardinal;
    procedure SetCPUFrequency(const Value: Cardinal; aClockType : TClockType = TClockType.PLLHSI);
    function GetCPUFrequency : Cardinal;
    function getMaxCPUFrequency : Cardinal;
  end;

var
  SystemCore : TSystemCore;

implementation

{$REGION 'TSystemCore'}

procedure TSTM32SystemCore.Initialize;
begin
  ConfigureSystem;
  ConfigureTimer;
end;

function TSTM32SystemCore.GetSysTickClockFrequency : Cardinal; [public, alias: 'MBF_GetSysTickClockFrequency'];
begin
  Result := GetHCLKFrequency;
end;

function TSTM32SystemCore.GetAPB1PeripheralClockFrequency : Cardinal;
var
  divider : byte;
begin
  divider := (RCC.CFGR shr 8) and $07;
  if Divider < 4 then
    Result := GetHCLKFrequency
  else
    Result := GetHCLKFrequency div longWord(2 shl (divider and $03));
end;

function TSTM32SystemCore.GetAPB1TimerClockFrequency : Cardinal;
begin
    if ((RCC.CFGR shr 8) and $07) < 4 then
      Result := GetAPB1PeripheralClockFrequency
    else
      Result := GetAPB1PeripheralClockFrequency shl 1;
end;

function TSTM32SystemCore.GetAPB2PeripheralClockFrequency : Cardinal;
var
  Divider : byte;
begin
  divider := (RCC.CFGR shr 11) and $07;
  if Divider < 4 then
    Result := GetCPUFrequency
  else
    Result := GetCPUFrequency div longWord(2 shl (divider and $03));
end;

function TSTM32SystemCore.GetAPB2TimerClockFrequency : Cardinal;
begin
  if (RCC.CFGR shr 11) and $07 < 4 then
    Result := GetAPB2PeripheralClockFrequency
  else
    Result := GetAPB2PeripheralClockFrequency*2;
end;

procedure TSTM32SystemCore.ConfigureSystem;
var
  dummy : longWord;
begin
  //PWR Enable PWR Subsystem Clock
  RCC.APB1ENR := RCC.APB1ENR or (1 shl 28);
  //Read back value for a short delay
  dummy := RCC.APB1ENR and (1 shl 28);
  //Seems nothing to do here...
end;

function TSTM32SystemCore.getFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
var
  PREDIV : byte;
  PLLMUL : byte;
  AHBPRE : byte;
  LastError : longWord;
  PREDIVMin,PREDIVMax,OSCCLOCK,PLLInFrequency,PLLOutFrequency,HCLKFrequency : longWord;
begin
  Result.Frequency := 0;
  Result.USBPre := -1;
  LastError := aHCLKFrequency;

  if (aClockType = TClockType.HSI) or (aClockType = TClockType.PLLHSI) then
    OSCCLOCK := HSIClockFrequency
  else
    OSCCLOCK := HSEClockFrequency;

  case aClockType of
    TClockType.HSI,
    TClockType.HSE:
    begin
      Result.AHBPRE := 7;
      for AHBPRE := 0 to 7 do
      begin
        HCLKFrequency := OSCCLOCK div longWord(1 shl AHBPRE);
        if HCLKFrequency <= aHCLKFrequency then
        begin
          Result.AHBPRE := AHBPRE;
          break;
        end;
      end;
      Result.Frequency := OSCCLOCK div longWord(1 shl Result.AHBPRE);
      Result.PREDIV := 1;
    end
  else
    begin
      if aClockType = TClockType.PLLHSI then
      begin
        {$if defined(has_pllprediv)}
          PREDIVMin := 0;
          PREDIVMax := 1;
        {$else}
          PREDIVMin := 1;
          PREDIVMax := 1;
        {$endif}
      end
      else
      begin
        PREDIVMin := 0;
        PREDIVMax := 15;
      end;

      for PREDIV := PREDIVMin to PREDIVMax do
      begin
        PLLInFrequency := OSCCLOCK div longWord(PREDIV+1);
        if (PLLInFrequency >=4000000) and (PLLInFrequency <=24000000) then
        begin
          for PLLMUL := 2 to 16 do
          begin
            PLLOUTFrequency := PLLInFrequency * PLLMUL;
            if PLLOUTFrequency <= MaxCPUFrequency then
            begin
              for AHBPRE := 0 to 7 do
              begin
                HCLKFrequency := PLLOutFrequency div longWord(1 shl AHBPRE);
                if LastError >= Abs(aHCLKFrequency-HCLKFrequency) then
                begin
                  // Do not overwrite a match that gives USB Datarate with another
                  if (LastError = Abs(aHCLKFrequency-HCLKFrequency)) and (Result.USBPre >=0) then
                    continue;
                  LastError := Abs(aHCLKFrequency-HCLKFrequency);
                  Result.Frequency := HCLKFrequency;
                  Result.PREDIV := PREDIV;
                  Result.PLLMUL := PLLMUL-1;
                  Result.AHBPRE := AHBPRE;
                  Result.USBPRE := -1;
                  if (PLLOUTFrequency = 48000000) then
                    Result.USBPRE := 0;
                  if (PLLOUTFrequency = 72000000) then
                    Result.USBPRE := 1;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TSTM32SystemCore.GetHCLKFrequency : longWord;
var
  temp : longWord;
begin
  temp := (RCC.CFGR shr 4) and %1111;
  if temp < 8 then
    temp := 0
  else
    temp := temp - 7;

  if temp > 4 then
    inc(temp);

  Result := getSYSCLKFrequency div longWord(1 shl temp);
end;

function TSTM32SystemCore.GetSYSCLKFrequency : longWord;
var
  temp : longWord;
begin
  case (RCC.CFGR shr 2) and %11 of
    0:  //HSI used as system clock
        Result := HSIClockFrequency;
    1:  //HSE used as system clock
        Result := HSEClockFrequency;
    2:  //PLL used as system clock;
        begin
          case (RCC.CFGR shr 16) and %1 of
            0: Result := HSIClockFrequency div 2;
            1: Result := HSEClockFrequency div ((RCC.CFGR2 and %1111)+1);
          end;
          temp := (RCC.CFGR shr 18) and %1111 + 2;
          if temp > 16 then temp := 16;
          Result := Result * temp;
        end;
  end;
end;

procedure TSTM32SystemCore.SetCPUFrequency(const Value: Cardinal; aClockType : TClockType = TClockType.PLLHSI);
var
  dummy : longWord;
  Params : TOscParameters;
begin
  //Make sure that HSI Clock is enabled
  if RCC.CR and (1 shl 0) = 0 then
    RCC.CR := RCC.CR or (1 shl 0);

  //Wait for HSI Clock to be stable
  while (RCC.CR and (1 shl 1)) = 0 do
    ;

  // Switch to HSI Clock
  if (RCC.CFGR and (%11 shl 2)) <> 0 then
    RCC.CFGR := RCC.CFGR and not (%11 shl 0);

  //Wait until HSI Clock is activated
  while (RCC.CFGR  and (%11 shl 2)) <> 0 do
    ;

  //PLLON Disable PLL if active
  if RCC.CR and (1 shl 24) = 1 then
  begin
    RCC.CR := RCC.CR and (not (1 shl 24));

    //PLLRDY Wait for PLL to shut down
    while (RCC.CR and (1 shl 25)) <> 0 do
      ;
  end;

  Params := getFrequencyParameters(Value,aClockType);

  //Set Flash Waitstates
  if Params.Frequency >= 48000000 then
    //Two Waitstates Prefetch Buffer enabled
    FLASH.ACR := (1 shl 5) or (1 shl 4) or %010
  else if Params.Frequency >= 24000000 then
  //One Waitstate Prefetch Buffer enabled
    FLASH.ACR := (1 shl 5) or (1 shl 4) or %001
  else
    //Zero Waitstates Prefetch Buffer enabled
    FLASH.ACR := (1 shl 5) or (1 shl 4);

  //Read Register to activate
  dummy := FLASH.ACR;

  case aClockType of
    TClockType.HSI :
    begin
      RCC.CFGR2 := (RCC.CFGR2 and (not %1111)) or Params.PREDIV;
      RCC.CFGR := (RCC.CFGR and (not (%1111 shl 4))) or (Params.AHBPRE shl 4);
    end;
    TClockType.HSE :
    begin
      RCC.CR := RCC.CR or (1 shl 16);
      while RCC.CR and (1 shl 17) = 0 do
        ;
      RCC.CFGR2 := (RCC.CFGR2 and (not %1111)) or Params.PREDIV;
      RCC.CFGR := (RCC.CFGR and (not (%1111 shl 4))) or (Params.AHBPRE shl 4);
      RCC.CFGR := (RCC.CFGR and (not (%11 shl 0))) or %01;
    end
    else
    begin
      RCC.CFGR := (RCC.CFGR and not (%1111 shl 18)) or (Params.PLLMUL shl 18);
      //Set PLL Source
      if aClockType = TClockType.PLLHSI then
        RCC.CFGR := RCC.CFGR and not (%1 shl 16)
      else
        RCC.CFGR := (RCC.CFGR and not (%1 shl 16)) or (1 shl 16);

      //Set Prescaler
      RCC.CFGR := (RCC.CFGR and not (%1111 shl 4)) or (Params.AHBPRE shl 4);

      //Configure APB1 (slow) clock
      if Params.FREQUENCY >= 36000000 then
        RCC.CFGR := (RCC.CFGR and not (%111 shl 8)) or (%100 shl 8)
      else
        RCC.CFGR := (RCC.CFGR and not (%111 shl 8)) or (%000 shl 8);

      //Configure APB2 (fast) clock
      RCC.CFGR := (RCC.CFGR and not (%111 shl 11)) or (%000 shl 11);

      //PLLON Enable PLL
      RCC.CR := RCC.CR or (1 shl 24);

      //PLLRDY Wait for PLL to lock
      while (RCC.CR and (1 shl 25)) = 0 do
        ;

      //Enable PLL
      RCC.CFGR := RCC.CFGR and (not (%11)) or %10;

      //Wait for PLL Switch
      while RCC.CFGR and (%11 shl 2) <> (%10 shl 2) do
        ;
    end;
  end;
  ConfigureTimer;
end;

function TSTM32SystemCore.GetCPUFrequency : longWord;
begin
  Result := GetHCLKFrequency;
end;

function TSTM32SystemCore.GetMaxCPUFrequency : longWord;
begin
  Result := MaxCPUFrequency;
end;

{$ENDREGION}

begin
end.
