unit mbf.megaavr0.systemcore;
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
{< Atmel ATmega x8 board series functions. }
interface

{$INCLUDE MBF.Config.inc}

//uses
//  MBF.SystemCore;

type
  { Special unsigned integer that is used to represent ticks in microseconds. }
  TTickCounter = longWord;
  TMilliSeconds = word;
  TMicroSeconds = word;

const
  HSIClockFrequency = 8000000;
  LSIClockFrequency = 128000;
  SlowRCClockFreq = 32768;
var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;

type
TSystemCore = record
const
  TimerResolutionMask = $000000ff;
private

  { Calculates the difference between two system timer values with proper handling of overflows. }
  function TicksInBetween(const InitTicks, EndTicks: TTickCounter): TTickCounter;

  function GetSysTickClockFrequency : longWord;
  function ReadFuseLow : byte;
  function ReadFuseHigh : byte;
  function ReadFuseExtended : byte;
public
  procedure Initialize;
  function  GetCPUFrequency: longWord;
  procedure SetCPUFrequency(const Value: longWord);
  function  getMaxCPUFrequency : longWord;
  property  CPUFrequency: longWord read GetCPUFrequency write SetCPUFrequency;
  procedure ConfigureSystem;
  procedure ConfigureTimer;
  procedure ConfigureInterrupts;
  procedure EnableInterrupts;
  procedure DisableInterrupts;

  { Returns the current value of system timer, in microseconds. }
  function GetTickCount: TTickCounter;
  { Delays the execution for the specified amount of microseconds. }
  procedure MicroDelay(const Microseconds: TMicroseconds);
  { Waits the specified amount of milliseconds accurately by continuously polling the timer.
    This is useful for accurate timing but may result in high CPU usage. }
  procedure BusyWait(const Milliseconds: TMilliseconds);
  { Delays the execution for the specified amount of milliseconds. CPU is put to sleep when milliseconds > 10}
  procedure Delay(const Milliseconds: TMilliseconds);
end;

const
{$if defined(atmega4809curiositynano)}
  MaxCPUFrequency = 20000000;
//{$elseif defined(ATMEGA328P)}
//  MaxCPUFrequency=20000000;
{$else}
  {$error Unknown Chip, please define maximum CPU Frequency}
{$endif}

var
  SystemCore : TSystemCore;

implementation
uses Intrinsics;
var
  SysTickCounter: TTickCounter = 0;
  TicksPerMillisecond : TTickCounter = 4000;

procedure SysTick_interrupt; interrupt; [public, alias: 'RTC_PIT_ISR'];
begin
  Inc(SysTickCounter);
end;

{$REGION 'TSystemCore'}

function TSystemCore.ReadFuseLow : byte; assembler ; nostackframe;
asm
  IN R0, 0x3f     //Save Status Register
  CLI             //Clear Interrupts to ensure timing after STS command
  LDS R30,SPMCSR
  ORI R30,9
  STS SPMCSR,R30
  LDI R30,0
  LDI R31,0
  LPM R24,Z
  OUT 0x3f,r0     //Restore Status Register
end;

function TSystemCore.ReadFuseHigh : byte; assembler ; nostackframe;
asm
  IN R0, 0x3f     //Save Status Register
  CLI             //Clear Interrupts to ensure timing after STS command
  LDS R30,SPMCSR
  ORI R30,9
  STS SPMCSR,R30
  LDI R30,3
  LDI R31,0
  LPM R24,Z
  OUT 0x3f,r0     //Restore Status Register
end;

function TSystemCore.ReadFuseExtended : byte; assembler ; nostackframe;
asm
  IN R0, 0x3f     //Save Status Register
  CLI             //Clear Interrupts to ensure timing after STS command
  LDS R30,SPMCSR
  ORI R30,9
  STS SPMCSR,R30
  LDI R30,2
  LDI R31,0
  LPM R24,Z
  OUT 0x3f,r0     //Restore Status Register
end;

procedure TSystemCore.Initialize;
begin
  SystickCounter := 0;
  ConfigureSystem;
  ConfigureInterrupts;
  ConfigureTimer;
end;

procedure TSystemCore.ConfigureTimer;
begin
  TicksPerMillisecond := GetSysTickClockFrequency div 1024;
  DisableInterrupts;
  // Start with default for highest possible Clockspeed
  TCCR0B := %101;
  OCR0A := TicksPerMillisecond div 1024;
  if (TicksPerMillisecond < 256*256) then
  begin
    TCCR0B := %100;
    OCR0A := TicksPerMillisecond div 256;
  end;
  if (TicksPerMillisecond < 64*256) then
  begin
    TCCR0B := %011;
    OCR0A := TicksPerMillisecond div 64;
  end;
  if (TicksPerMillisecond < 8*256) then
  begin
    TCCR0B := %010;
    OCR0A := TicksPerMillisecond div 8;
  end;
  if (TicksPerMillisecond < 256) then
  begin
    TCCR0B := %001;
    OCR0A := TicksPerMillisecond div 8;
  end;
  // Set comparator to at least 1 cycle
  // Todo make this better for very low frequencies
  if OCR0A = 0 then
    OCR0A := 1;
  TIMSK0 := %010;
  EnableInterrupts;
end;

procedure TSystemCore.ConfigureSystem;
begin
end;

procedure TSystemCore.ConfigureInterrupts;
begin
end;

procedure TSystemCore.EnableInterrupts; inline;
begin
  avr_sei;
end;

procedure TSystemCore.DisableInterrupts; inline;
begin
  avr_cli;
end;

function TSystemCore.GetTickCount: TTickCounter; inline;
begin
  //Make access to the TickCount atomic
  avr_cli;
  Result := SysTickCounter;
  avr_sei
end;

function TSystemCore.TicksInBetween(const InitTicks, EndTicks: TTickCounter): TTickCounter;
begin
  Result := EndTicks - InitTicks;
  if longWord(not Result) < Result then
    Result := longWord(not Result);
end;

procedure TSystemCore.MicroDelay(const Microseconds: TMicroseconds);
begin
end;

procedure TSystemCore.BusyWait(const MilliSeconds: TMilliSeconds);
var
  StartTicks: TMilliSeconds;
begin
  //To keep error below 10% do MicroDelay for short times
  //if MilliSeconds < 10 then
  //  MicroDelay(MilliSeconds*1000)
  //else
  //begin
    StartTicks := GetTickCount;
    while TicksInBetween(StartTicks, GetTickCount) < Milliseconds do ;
  //end;
end;

procedure TSystemCore.Delay(const MilliSeconds: TMilliseconds);
var
  StartTicks : TTickCounter;
begin
  //To keep error below 10% do busywait for short times
  //if MilliSeconds < 10 then
  //  MicroDelay(MilliSeconds*1000)
  //else
  //begin
    StartTicks := GetTickCount;
    while TicksInBetween(StartTicks, GetTickCount) < Milliseconds do ;
//    asm
//      ldi r16,1 // Enable idle mode
//      out SMCR, r16
//      sleep // Put MCU in sleep mode
//    end;
  //end;
end;

function TSystemCore.GetSysTickClockFrequency : longWord;
begin
  Result := 16000000;
end;

function TSystemCore.GetCPUFrequency : longWord;
var
  ClockSource : byte;
begin
  Result := 0;
  ClockSource := ReadFuseLow and %1111;
  // External Clock
  if ClockSource = %0000 then
    Result :=  HSEClockFrequency
  // Internal High Speed RC (8 MHz)
  else if ClockSource = %0010 then
    Result :=  HSIClockFrequency
  // Internal 128kHZ
  else if ClockSource = %0011 then
    Result := LSIClockFrequency
  // Low Frequency Crystal
  else if (ClockSource = %0100) or (ClockSource = %0101) then
  begin
    Result := HSEClockFrequency;
    if Result = 0 then
      Result :=   XTALRTCFreq;
  end
  // Full Swing Crystal
  else if (ClockSource = %0110) or (ClockSource = %0111) then
  begin
    Result := HSEClockFrequency;
    if Result = 0 then
      Result := MaxCPUFrequency;
  end
  // all following are for Low Power Crystal
  else if (ClockSource = %1000) or (ClockSource = %1001) then
  begin
    Result := HSEClockFrequency;
    if Result = 0 then
      Result := 900000 //Maximum allowed Frequency for CLKSEL3..1=100
  end
  else if (ClockSource = %1010) or (ClockSource = %1011) then
  begin
    Result := HSEClockFrequency;
    if Result = 0 then
      Result := 3000000 //Maximum allowed Frequency for CLKSEL3..1=101
  end
  else if (ClockSource = %1100) or (ClockSource = %1101) then
  begin
    Result := HSEClockFrequency;
    if Result = 0 then
      Result := 8000000 //Maximum allowed Frequency for CLKSEL3..1=110
  end
  else if (ClockSource = %1110) or (ClockSource = %1111) then
  begin
    Result := HSEClockFrequency;
    if Result = 0 then
      Result := 16000000 //Maximum allowed Frequency for CLKSEL3..1=111
  end;

  if Result = 0 then
    Result := MaxCPUFrequency;

  if (ReadFuseLow and %10000000) = 0 then
    Result := Result div 8;
  Result := Result shr (CLKPR and %111);
end;

procedure TSystemCore.SetCPUFrequency(const Value: longWord);
var
  CurrentCPUFrequency : longWord;
  i,NewCLKPR : byte;
begin
  CurrentCPUFrequency := GetCPUFrequency shl (CLKPR and %111);
  NewCLKPR := 7;
  for i := 0 to 7 do
  begin
    if Value >= CurrentCPUFrequency shr i then
    NewCLKPR := i;
    break;
  end;
  asm
    //CLKPR := $80
    //CLKPR := NewCLKPR
  end;
end;

function TSystemCore.GetMaxCPUFrequency : longWord;
begin
  Result := MaxCPUFrequency;
end;
{$ENDREGION}

begin
end.
