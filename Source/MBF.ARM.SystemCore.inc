{$IF NOT DEFINED(INTERFACE) AND NOT DEFINED(IMPLEMENTATION)}
unit MBF.SystemCore;
{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  Copyright (c) 2018 -  Alfred Glänzer

  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}
{
  Related Reference Manuals

  STM32F0x1STM32F0x2STM32F0x8 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00031936.pdf

  STM32F030x4x6x8xC and STM32F070x6xB advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00091010.pdf
}

interface

{$INCLUDE MBF.Config.inc}
{$ENDIF}
{$IF DEFINED(INTERFACE)}
type
  { Special unsigned integer that is used to represent ticks in microseconds. }
  TTickCounter = longWord;
  TMilliSeconds = longWord;
  TMicroSeconds = longWord;

type
  { System core of the board, which provides high-performance utility functions for accurate timing and delays. }
  TSystemCore = record
  const
    TimerResolutionMask = $0fffffff;

  var
  private
    function convertMicrosecondsToCoreTicks(MicroSeconds : TMicroSeconds) : TTickCounter;
    procedure setCoreTimerValue(value : longWord);
    procedure setCoreTimerReloadCompare(value : longWord);
    function getCoreTimerReloadCompare : longWord;
    function getCoreTimerValue: longWord;
  public
    procedure Configure;
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

    { Forward Declaration for a system bependant routine that evaluates the clock speed of the SysTick Timer }
    function GetSysTickClockFrequency: longWord;

  end;
{$ENDIF}
{$IF NOT DEFINED(INTERFACE) AND NOT DEFINED(IMPLEMENTATION)}
implementation
{$ENDIF}
{$IF DEFINED(IMPLEMENTATION)}
var
  SysTickCounter: TTickCounter = 0;
  TicksPerMillisecond : TTickCounter = 4000;
  SysTickOverflow : TTickCounter = 0;

procedure TSystemCore.setCoreTimerReloadCompare(value : longWord);
  begin
    SysTick.LOAD := value;
  end;

  function TSystemCore.getCoreTimerReloadCompare : longWord;
  begin
    Result := SysTick.Load;
  end;

  procedure TSystemCore.setCoreTimerValue(value : longWord);
  begin
    Systick.VAL := value;
    SysTickOverflow := 0;
  end;

  function TSystemCore.getCoreTimerValue: longWord;
  begin
    //Create a full 32 Bit Countervalue on Arm to make it behave the same as MIPS for Microsecond Delays
    Result := SysTickOverflow + (TicksPerMillisecond-SysTick.VAL);
  end;

procedure SysTick_interrupt; interrupt; [public, alias: 'SysTick_Handler'];
begin
  Inc(SysTickCounter);
  Inc(SysTickOverflow,TicksPerMilliSecond);
end;

{$REGION 'TSystemCore'}

procedure TSystemCore.Configure;
begin
  ConfigureTimer;
  ConfigureInterrupts;
end;

function TSystemCore.ConvertMicrosecondsToCoreTicks(MicroSeconds : TMicroSeconds) : TTickCounter;
begin
  Result := Int64(Microseconds) * getSysTickClockFrequency div 1000000;
end;

procedure TSystemCore.RegUnlock;
begin

end;

procedure TSystemCore.Reglock;
begin

end;

procedure TSystemCore.ConfigureTimer;
begin
  SysTick.CTRL := 0;
  TicksPerMillisecond := GetSysTickClockFrequency div 1000;
  if (TicksPerMillisecond>$FFFFFF) then
  begin
    //Slow Down Systick by Value of 8
    SetBit(Systick.CTRL,2);
    TicksPerMillisecond := GetSysTickClockFrequency div 1000;
  end;
  if (TicksPerMillisecond>$FFFFFF) then
    TicksPerMillisecond:=$FFFFFF;
  if (TicksPerMillisecond<70) then TicksPerMillisecond:=70;

  setCoreTimerReloadCompare(TicksPerMillisecond - 1);
  setCoreTimerValue(0);
  SetCrumb(SysTick.CTRL,%11,0);
end;

procedure TSystemCore.ConfigureInterrupts;
begin
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
begin
  StartTicks := GetCoreTimerValue;
  TickCount := convertMicroSecondsToCoreTicks(Microseconds);
  if (TickCount=0) then exit;
  while TicksInBetween(StartTicks,GetCoreTimerValue) < TickCount do
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
      wfi // wait for interrupt
    end;
  end;
end;

function TSystemCore.GetSysTickClockFrequency: longWord; external name 'MBF_GetSysTickClockFrequency';

{$ENDREGION}
{$ENDIF}
{$IF NOT DEFINED(INTERFACE) AND NOT DEFINED(IMPLEMENTATION)}
begin
end.
{$ENDIF}
