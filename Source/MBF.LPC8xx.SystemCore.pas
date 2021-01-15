unit MBF.LPC8xx.SystemCore;
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
{< ST Micro Nucleo F4xx board series functions. }
interface

{$INCLUDE MBF.Config.inc}

uses
  MBF.SystemCore;

{$if defined(lpc81x) or defined(lpc82x)}
const
  MaxCPUFrequency=30000000;
{$else}
  {$error Unknown Chip series, please define maximum CPU Frequency}
{$endif}

var
  XTAL0Freq : longWord = 0;
  XTALRTCFreq : longword = 32768;
  XTAL1Freq : longWord = 0;

type
  TLPC8xxSystemCore = record helper for TSystemCore
  private const
    IRCClockFrequency = 12000000;
  private
    procedure ConfigureSystem;
    function GetCPUFrequency: longWord;
    procedure SetCPUFrequency(const Value: longWord);
    function GetSysTickClockFrequency : longWord;
    function GetWatchdogClockFrequency : longWord;
  public
    procedure Initialize;
    function getMainClockFrequency : longWord;
    function GetSystemClockFrequency: longWord;
    property CPUFrequency: longWord read GetCPUFrequency write SetCPUFrequency;
    function getI2CDriverPointer : pointer;
    function getSPIDriverPointer : pointer;
    function getADCDriverPointer : pointer;
    function getUARTDriverPointer : pointer;
    {$if defined(cortexm0)}
    function udiv(Divisor,Dividend : longWord) : longWord;
    function sdiv(Divisor,Dividend : integer) : integer;
    {$endif}

  end;

var
  SystemCore : TSystemCore;
  XTAL0Frequency : longWord = 0;
  CLKINFrequency : longWord = 0;

implementation

type
  set_pll_proc = procedure(const command : array of longWord;var result : array of longWord); cdecl;
  set_power_proc = procedure(const command : array of longWord;var result : array of longWord); cdecl;
  sdiv_proc = function(const numerator,denominator : longInt) : longInt;
  udiv_proc = function(const numerator,denominator : longWord) : longWord;
  tsdivmod = record
    quotient,
    remainder : longInt;
  end;

  tudivmod = record
    quotient,
    remainder : longWord;
  end;

  sdivmod_proc = function(const numerator,denominator : longInt) : Tsdivmod;
  udivmod_proc = function(const numerator,denominator : longWord) : Tudivmod;

type
  TLPC82xPowerProfiles = record
    set_pll : set_pll_proc;
    set_power : set_power_proc;
  end;

  TLPC82xIntegerDivide = record
    sdiv : sdiv_proc;
    udiv : udiv_proc;
    sdivmod : sdiv_proc;
    udivmod : udiv_proc;
  end;

  TLPC82xRomTable = record
    Reserved0 : array[0..2] of longWord;
    pPowerProfiles : ^TLPC82xPowerProfiles;
    pIntegerDivide : ^TLPC82xIntegerDivide;
    pI2CDriver : pointer;
    Reserved1 : longWord;
    pSPIDriver : pointer;
    pADCDriver : pointer;
    pUARTDriver : pointer;
  end;

var
  pROMTable : ^TLPC82xRomTable;

{$REGION 'TSystemCore'}

function TLPC8xxSystemCore.getI2CDriverPointer : pointer;
begin
  Result := pRomTable^.pI2CDriver;
end;

function TLPC8xxSystemCore.getSPIDriverPointer : pointer;
begin
  Result := pRomTable^.pSPIDriver;
end;

function TLPC8xxSystemCore.getADCDriverPointer : pointer;
begin
  Result := pRomTable^.pADCDriver;
end;

function TLPC8xxSystemCore.getUARTDriverPointer : pointer;
begin
  Result := pRomTable^.pUARTDriver;
end;


function TLPC8xxSystemCore.GetSystemClockFrequency: longWord;
begin
  if SysCon.SYSAHBCLKDIV and %11111111 <> 0 then
    Result := GetMainClockFrequency div (SysCon.SYSAHBCLKDIV and %11111111)
  else
    Result := 0;
end;

function TLPC8xxSystemCore.GetWatchdogClockFrequency : longWord;
const
  WatchdogPresets : array[0..15] of longword = (0,600000,1050000,1400000,1750000,2100000,2400000,2700000,
                                                3000000,3250000,3500000,3750000,4000000,4200000,4400000,4600000);
begin
  Result := WatchdogPresets[(SYSCON.WDTOSCCTRL shr 5) and %1111];
  Result := Result div (1+(SYSCON.WDTOSCCTRL and %11111) shl 1);
end;

function TLPC8xxSystemCore.GetMainClockFrequency: longWord;
begin
  case SYSCON.MAINCLKSEL and %11 of
    0 : Result := IRCClockFrequency;
    1 : begin
          case SYSCON.SYSPLLCLKSEL and %11 of
            0 : Result := IRCClockFrequency;
            1 : Result := XTAL0Frequency;
            3 : Result := CLKINFrequency;
          end;
        end;
    2 : Result := getWatchdogClockFrequency;
    3 : begin
          case SYSCON.SYSPLLCLKSEL and %11 of
            0 : Result := IRCClockFrequency;
            1 : Result := XTAL0Frequency;
            3 : Result := CLKINFrequency;
          end;
          Result := Result * ((SYSCON.SYSPLLCTRL and %11111)+1);
        end;
  end;
end;

procedure TLPC8xxSystemCore.Initialize;
begin
  FCPUFrequency := GetSystemClockFrequency;
  FTimerNormalize := 1;
  ConfigureSystem;
  ConfigureTimer;
  pRomTable := pointer(pointer($1fff1ff8)^);
end;

function TLPC8xxSystemCore.GetSysTickClockFrequency : longWord; [public, alias: 'MBF_GetSysTickClockFrequency'];
begin
    Result := GetSystemClockFrequency;
end;

procedure TLPC8xxSystemCore.ConfigureSystem;
begin
end;


function TLPC8xxSystemCore.GetCPUFrequency: longWord;
begin
  Result := GetSystemClockFrequency;
end;

procedure TLPC8xxSystemCore.SetCPUFrequency(const Value: longWord);
const
  CPU_FREQ_EQU=0; CPU_FREQ_LTE=1; CPU_FREQ_GTE=2; CPU_FREQ_APPROX=3;
  PLL_CMD_SUCCESS=0; PLL_INVALID_FREQ=1; PLL_INVALID_MODE=2; PLL_FREQ_NOT_FOUND=3; PLL_NOT_LOCKED=4;
var
  Result : array[0..1] of longWord;
  InputFrequency,OutputFrequency : longWord;
  Temp : longWord;
begin
  InputFrequency := 12000000;
  InputFrequency := InputFrequency div 1000;
  OutputFrequency := Value div 1000;
  pRomTable^.pPowerProfiles^.set_pll([InputFrequency,OutputFrequency,CPU_FREQ_EQU,0],Result);
  if Result[0] <> PLL_CMD_SUCCESS then
    if OutputFrequency > 4000 then
      pRomTable^.pPowerProfiles^.set_pll([InputFrequency,OutputFrequency,CPU_FREQ_GTE,0],Result)
    else
      pRomTable^.pPowerProfiles^.set_pll([InputFrequency,OutputFrequency,CPU_FREQ_LTE,0],Result);
  temp := Result[0];
  temp := Result[1];
  ConfigureTimer;
end;

{$If defined(CortexM0)}
function TLPC8xxSystemCore.udiv(Divisor,Dividend : longWord):longWord; inline;
begin
  Result := pRomTable^.pIntegerDivide^.udiv(Divisor,Dividend);
end;

function TLPC8xxSystemCore.sdiv(Divisor,Dividend : longInt):longInt; inline;
begin
  Result := pRomTable^.pIntegerDivide^.sdiv(Divisor,Dividend);
end;
{$endif}

{$ENDREGION}

end.
