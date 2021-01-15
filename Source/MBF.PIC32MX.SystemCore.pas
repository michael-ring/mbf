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

type
  { Special unsigned integer that is used to represent ticks in microseconds. }
  TTickCounter = longWord;
  TMilliSeconds = longWord;
  TMicroSeconds = longWord;

{$if defined(PIC32MX1) or defined(PIC32MX2)}
const
  MaxCPUFrequency=48000000;
{$else}
  {$error Unknown Chip series, please define maximum CPU Frequency}
{$endif}

const
  FRCClockFrequency:longword = 8000000;
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

  TSystemCore = record
  const
    TimerResolutionMask = $ffffffff;
  var
  private
    function convertMicrosecondsToCoreTicks(MicroSeconds : TMicroSeconds) : TTickCounter;
    procedure setCoreTimerValue(value : longWord);
    procedure setCoreTimerReloadCompare(value : longWord);
    function getCoreTimerReloadCompare : longWord;
    function getCoreTimerValue: longWord;
    function GetSysTickClockFrequency : longWord;
    function getFrequencyParameters(aFrequency : longWord; aXTALFrequency : longWord = 0; aSYSCLOCK_MAX : longWord = MaxCPUFrequency):TOSCParameters;
  public
    procedure Initialize;
    function GetSYSCLKFrequency: longWord;
    function GetPBCLKFrequency: longWord;
    function GetCPUFrequency: longWord;
    procedure setCPUFrequency(const Value: longWord;XTALFrequency : longWord = 0);
    function getMaxCPUFrequency : longWord;
    procedure RegUnlock;
    procedure RegLock;
    procedure ConfigureTimer;
    procedure ConfigureInterrupts;
    { Returns the current value of system timer, in microseconds. }
    function GetTickCount: TMilliSeconds;

    { Calculates the difference between two system timer values with proper handling of overflows. }
    function TicksInBetween(const InitTicks, EndTicks: TTickCounter): TTickCounter;

    { Waits the specified amount of milliseconds accurately by continuously polling the timer.
      This is useful for accurate timing but may result in high CPU usage. }
    procedure BusyWait(const Milliseconds: TMilliseconds);

    { Delays the execution for the specified amount of microseconds. }
    procedure MicroDelay(const Microseconds: TMicroseconds);

    { Delays the execution for the specified amount of milliseconds. CPU is put to sleep when milliseconds > 10}
    procedure Delay(const Milliseconds: TMilliseconds);

  public
  end;

var
  SystemCore : TSystemCore;

implementation
uses
  MBF.BitHelpers;

{$REGION 'TSystemCore'}

const
  PLLODIV : array[0..7] of word = (1,2,4,8,16,32,64,256);
  FRCDIV : array[0..7] of word = (1,2,4,8,16,32,64,256);
  PLLMULT : array[0..7] of byte = (15,16,17,18,19,20,21,24);
  FPLLIDIV : array[0..7] of byte = (1,2,3,4,5,6,10,12);

var
  SysTickCounter: TTickCounter = 0;
  TicksPerMillisecond : TTickCounter = 4000;

procedure TSystemCore.setCoreTimerReloadCompare(value : longWord); //assembler; nostackframe;
  begin
    asm
      mtc0 $a1,$11,0
      ehb
    end ['a1'];
  end;

  function TSystemCore.getCoreTimerReloadCompare : longWord; //assembler; nostackframe;
  begin
    asm
      mfc0 $v0,$11,0
    end ['v0'];
  end;

  procedure TSystemCore.setCoreTimerValue(value : longWord); //assembler; nostackframe;
  begin
    asm
      mtc0 $a1,$9,0
      ehb
    end ['a1'];
  end;

  function TSystemCore.getCoreTimerValue: longWord; //assembler; nostackframe;
  begin
    asm
      mfc0 $v0,$9,0
    end ['v0'];
  end;

procedure SysTick_interrupt; interrupt; [public, alias: 'CORE_TIMER_interrupt'];
begin
  asm
    mfc0 $v1,$9,0
    lw   $v0,TicksPerMillisecond
    addu $v1,$v0
    mtc0 $v1,$11,0
    ehb
  end ['v0','v1'];

  Inc(SysTickCounter);
  INT.IFS0CLR := %1 shl 0;
end;

{$REGION 'TSystemCore'}

function TSystemCore.ConvertMicrosecondsToCoreTicks(MicroSeconds : TMicroSeconds) : TTickCounter;
begin
  Result := Int64(Microseconds) * getSysTickClockFrequency div 1000000;
end;

procedure TSystemCore.RegUnlock;
begin
  asm
    di
  end;
  CFG.SYSKEY := $12345678;
  CFG.SYSKEY := $AA996655;
  CFG.SYSKEY := $556699AA;
  asm
    ei
  end;
end;

procedure TSystemCore.Reglock;
begin
  CFG.SYSKEY := $00000000;
end;

procedure TSystemCore.ConfigureTimer;
begin
  TicksPerMillisecond := GetSysTickClockFrequency div 1000;
  //Coretimer was set on Startup Code
  SetCoreTimerValue(0);
  SetCoreTimerReloadCompare(TicksPerMilliSecond);

  // Clear pending Interrupt
  INT.IFS0CLR := %1;
  // Activate Interrupt
  INT.IEC0SET := %1;

  // Set the Core-Timer Interrupt to priority 1
  INT.IPC0CLR :=%111 <<2;
  INT.IPC0SET :=%001 <<2;
  // Set the Core-Timer Interrupt to sub-priority 0
  INT.IPC0CLR :=%11 <<0;
  INT.IPC0SET :=%00 <<0;
end;

procedure TSystemCore.ConfigureInterrupts;
begin
  INT.INTCONSET := %1 shl 12;
  asm
    mfc0 $v0,$12,0
    ori $v0,$v0,1
    mtc0 $v0,$12,0
    ehb
    //ei
  end;
end;

function TSystemCore.GetTickCount: TTickCounter;
begin
  Result := SysTickCounter;
end;


function TSystemCore.TicksInBetween(const InitTicks, EndTicks: TTickCounter): TTickCounter;
begin
  Result := EndTicks - InitTicks;
  if longWord(not Result) < Result then
    Result := longWord(not Result);
end;

procedure TSystemCore.MicroDelay(const Microseconds: TMicroseconds);
var
  StartTicks : TTickCounter;
  TickCount : TTickCounter;
  //TickDiff : TTickCounter;
begin
  StartTicks := GetCoreTimerValue;
  TickCount := convertMicroSecondsToCoreTicks(Microseconds);
  if (TickCount=0) then exit;
  while TicksInBetween(StartTicks,GetCoreTimerValue) < TickCount do
    //TickDiff := TicksInBetween(StartTicks,GetCoreTimerValue);
  ;
end;

procedure TSystemCore.BusyWait(const MilliSeconds: TMilliSeconds);
var
  StartTicks: TMilliSeconds;
begin
  //To keep error below 10% do MicroDelay for short times
  if MilliSeconds < 10 then
    MicroDelay(MilliSeconds*1000)
  else
  begin
    StartTicks := GetTickCount;
    while TicksInBetween(StartTicks, GetTickCount) < Milliseconds do ;
  end;
end;

procedure TSystemCore.Delay(const MilliSeconds: TMilliseconds);
var
  StartTicks : TTickCounter;
begin
  //To keep error below 10% do busywait for short times
  if MilliSeconds < 10 then
    MicroDelay(MilliSeconds*1000)
  else
  begin
    StartTicks := GetTickCount;
    while TicksInBetween(StartTicks, GetTickCount) < Milliseconds do
    asm
      nop
      wait // wait for interrupt
      nop
    end;
  end;
end;

procedure TSystemCore.Initialize;
begin
  RegUnlock;
  if GetCPUFrequency <= 24000000 then
    SetBitsMasked(OSC.OSCCON,%00,%11 shl 19,19)
  else
    SetBitsMasked(OSC.OSCCON,%01,%11 shl 19,19);
  RegLock;
  ConfigureTimer;
  ConfigureInterrupts;
end;

function TSystemCore.GetSysTickClockFrequency : longWord; [public, alias: 'MBF_GetSysTickClockFrequency'];
begin
  Result := GetSysClkFrequency div 2;
end;

function TSystemCore.GetCPUFrequency : longWord;
begin
  Result := getSYSCLKFrequency;
end;

function TSystemCore.GetSYSCLKFrequency : longWord;
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

function TSystemCore.GetPBCLKFrequency : longWord;
begin
  Result := GetSysCLKFrequency shr ((OSC.OSCCON shr 19) and %11)
end;

function TSystemCore.getFrequencyParameters(aFrequency : longWord; aXTALFrequency : longWord = 0;aSYSCLOCK_MAX : longWord = MaxCPUFrequency):TOSCParameters;
const
  PLLFREQMAX = 120000000;
var
  _PLLMULT,_PLLODIV,PLLFREQ,FREQ : longWord;
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

procedure TSystemCore.setCPUFrequency(const Value : longWord;XtalFrequency : longWord = 0);
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

  //Set some same defaults for Peripherals Clock
  if Value <= 24000000 then
    SetBitsMasked(OSC.OSCCON,%00,%11 shl 19,19)
  else
    SetBitsMasked(OSC.OSCCON,%01,%11 shl 19,19);

  //Enable Switching
  OSC.OSCCONSET := %1 shl 0;
  //Wait for Clock Switch complete
  repeat
  until (OSC.OSCCON and %1) = 0;
  RegLock;
  ConfigureTimer;
end;

function TSystemCore.getMaxCPUFrequency : longWord;
begin
  Result := MaxCPUFrequency;
end;

{$ENDREGION}

begin
end.
