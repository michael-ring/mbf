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
{< Basic types and components commonly used on microcontrollers and compact singleboard devices. }
interface

{$INCLUDE MBF.Config.inc}

type
  { Special unsigned integer that is used to represent ticks in microseconds. }
  TTickCounter = longWord;
  TMilliSeconds = longWord;
  TMicroSeconds = longWord;

type
  { System core of the board, which provides high-performance utility functions for accurate timing and delays. }
  TSystemCore = record
  const
    {$IF DEFINED(CPUARM)}
    TimerResolutionMask = $0fffffff;
    {$ELSEIF DEFINED(CPUMIPS)}
    TimerResolutionMask = $ffffffff;
    {$ELSE}
      {$ERROR Unsupported CPU Architecture}
    {$ENDIF}

  var
  private
    function convertMicrosecondsToCoreTicks(MicroSeconds : TMicroSeconds) : TTickCounter;
    procedure setCoreTimerValue(value : longWord);
    procedure setCoreTimerComp(value : longWord);
    function getCoreTimerComp : longWord;
    function getCoreTimerValue: longWord;
  public
    {$IF DEFINED(CPUARM)}
      {$if not defined(cortexm0)}
      function udiv(Divisor,Dividend : longWord) : longWord;
      function sdiv(Divisor,Dividend : integer) : integer;
      {$endif}
    {$endif}
    procedure Configure;
    procedure RegUnlock;
    procedure RegLock;
    procedure Teardown;
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
    function GetSysTickClockFrequency: Cardinal;

  end;

implementation
{$IF DEFINED(CortexM0)}
uses
  cortexm0;
{$ELSEIF DEFINED(CortexM3)}
uses
  cortexm3;
{$ELSEIF DEFINED(CortexM4)}
uses
  cortexm4;
{$ELSEIF DEFINED(CortexM7)}
uses
  cortexm7;
{$ELSEIF DEFINED(Pic32)}
{$ELSE}
  {$ERROR Cortex Type not defined}
{$ENDIF}
var
  SysTickCounter: TTickCounter = 0;
  TicksPerMillisecond : TTickCounter = 4000;
  {$if defined(CPUARM)}
  SysTickOverflow : TTickCounter = 0;
  InternalSysTickOverflow : longWord;
  {$endif}

  {$if defined(CPUARM)}
  procedure TSystemCore.setCoreTimerComp(value : longWord);
  begin
    SysTick.LOAD := value;
  end;

  function TSystemCore.getCoreTimerComp : longWord;
  begin
    Result := SysTick.Load;
  end;

  procedure TSystemCore.setCoreTimerValue(value : longWord);
  begin
    Systick.VAL := value;
    InternalSysTickOverflow := 0;
  end;

  function TSystemCore.getCoreTimerValue: longWord;
  begin
    //Create a full 32 Bit Countervalue on Arm to make it behave the same as MIPS for Microsecond Delays
    Result := InternalSysTickOverflow + (not (SysTick.VAL) and $0fffffff);
  end;

  {$elseif defined(CPUMIPS)}
  procedure TSystemCore.setCoreTimerComp(value : longWord); //assembler; nostackframe;
  begin
    asm
      mtc0 $a1,$11,0
      ehb
    end ['a1'];
  end;

  function TSystemCore.getCoreTimerComp : longWord; //assembler; nostackframe;
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

  {$else}
    {$ERROR Not Platform timer interrupt available}
  {$endif}



{$if defined(CPUARM)}
procedure SysTick_interrupt; [public, alias: 'SysTick_interrupt'];
begin
  Inc(SysTickCounter);
  Inc(SysTickOverflow,TicksPerMilliSecond);
end;
{$elseif defined(CPUMIPS)}
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
{$else}
  {$ERROR No Platform timer interrupt available}
{$endif}

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

{$if defined(CPUARM)}
procedure TSystemCore.RegUnlock;
begin

end;

procedure TSystemCore.Reglock;
begin

end;

{$elseif defined(CPUMIPS)}

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
{$else}
  {$ERROR No RegLock/RegUnlock available}
{$endif}

procedure TSystemCore.ConfigureTimer;
begin
  TicksPerMillisecond := GetSysTickClockFrequency div 1000;
{$if defined(CPUARM)}

  if (TicksPerMillisecond>$FFFFFF) then TicksPerMillisecond:=$FFFFFF;
  if (TicksPerMillisecond<70) then TicksPerMillisecond:=70;

  SysTick.CTRL := 0;
  setCoreTimerComp(TicksPerMillisecond - 1);
  setCoreTimerValue(0);
  SysTick.CTRL := %0111;
{$elseif defined(CPUMIPS)}
  //Coretimer was set on Startup Code
  SetCoreTimerValue(0);
  SetCoreTimerComp(TicksPerMilliSecond);

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

{$else}
  {$ERROR No Platform timer interrupt available}
{$endif}
end;

{$if defined(CPUARM)}
procedure TSystemCore.ConfigureInterrupts;
begin
end;
{$elseif defined(CPUMIPS)}

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
{$else}
  {$ERROR No Platform timer interrupt available}
{$endif}

procedure TSystemCore.TearDown;
begin
//  SysTick.CTRL := $00;
end;


function TSystemCore.GetTickCount: TTickCounter;
begin
  Result := SysTickCounter;
end;


function TSystemCore.TicksInBetween(const InitTicks, EndTicks: TTickCounter): TTickCounter;
begin
  Result := EndTicks - InitTicks;
  if (not Result) < Result then
    Result := not Result;
end;

procedure TSystemCore.MicroDelay(const Microseconds: TMicroseconds);
var
  StartTicks : TTickCounter;
  TickCount : TTickCounter;
begin
  StartTicks := GetCoreTimerValue;
  TickCount := convertMicroSecondsToCoreTicks(Microseconds);
  if (TickCount=0) then exit;
  while TicksInBetween(StartTicks, GetCoreTimerValue) < TickCount do ;
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
    {$IF DEFINED(CPUARM)}
    asm
      wfi // wait for interrupt
    end;
    {$ELSEIF DEFINED(CPUMIPS)}
    asm
      nop
      wait // wait for interrupt
      nop
    end;
    {$ELSE}
     {$ERROR No Wait instruction defined for Platform}
    {$ENDIF}
  end;
end;

function TSystemCore.GetSysTickClockFrequency: Cardinal; external name 'MBF_GetSysTickClockFrequency';

{$IF DEFINED(CPUARM)}
{$If not defined(CortexM0)}
function TSystemCore.udiv(Divisor,Dividend : longWord):longWord; assembler; nostackframe;
asm
  udiv R0,R1
end;

function TSystemCore.sdiv(Divisor,Dividend : integer):integer; assembler; nostackframe;
asm
  sdiv R0,R1
end;
{$endif}
{$endif}

{$ENDREGION}

begin
end.
