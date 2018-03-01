unit MBF.Kinetis.SystemCore;
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

{$if defined(mk20dx5)}
const
  MaxCPUFrequency=50000000;
{$elseif defined(mk20dx7)}
const
  MaxCPUFrequency=72000000;
{$elseif defined(mk22fn12)}
const
  MaxCPUFrequency=120000000;
{$else}
  {$error Unknown Chip series, please define maximum CPU Frequency}
{$endif}

var
  XTAL0Freq : longWord = 0;
  XTALRTCFreq : longword = 32768;
  XTAL1Freq : longWord = 0;

type
  TKinetisSystemCore = record helper for TSystemCore
  private const
    FastRCClockFreq = 4000000;
    SlowRCClockFreq = 32768;
  private
    procedure ConfigureSystem;
    function GetBusClockFrequency: Cardinal;
    function GetFlexbusClockFrequency: Cardinal;
    function GetFlashClockFrequency: Cardinal;
    function GetMCGOUTCLKFrequency: Cardinal;
    function GetCPUFrequency: Cardinal;
    procedure SetCPUFrequency(const Value: Cardinal);
    function GetSysTickClockFrequency : Cardinal;
  public
    procedure Initialize;
    function GetSystemClockFrequency: Cardinal;
    property CPUFrequency: Cardinal read GetCPUFrequency write SetCPUFrequency;

  end;

var
  SystemCore : TSystemCore;

implementation

{$REGION 'TSystemCore'}

function TKinetisSystemCore.GetSystemClockFrequency: Cardinal;
begin
  Result := GetMCGOUTCLKFrequency div (((SIM.CLKDIV1 shr 28) and %1111) +1);
end;

function TKinetisSystemCore.GetBusClockFrequency: Cardinal;
begin
  Result := GetMCGOUTCLKFrequency div (((SIM.CLKDIV1 shr 24) and %1111) +1);
end;

function TKinetisSystemCore.GetFlexBusClockFrequency: Cardinal;
begin
  Result := GetMCGOUTCLKFrequency div (((SIM.CLKDIV1 shr 20) and %1111) +1);
end;

function TKinetisSystemCore.GetFlashClockFrequency: Cardinal;
begin
  Result := GetMCGOUTCLKFrequency div (((SIM.CLKDIV1 shr 16) and %1111) +1);
end;

function TKinetisSystemCore.GetMCGOUTCLKFrequency: Cardinal;
var
  OSCSELCLK : longword;
  multiplier,divider : longWord;
begin
  Result := 0;

  case (MCG.C7 and %11) of
    0:   OSCSELCLK := XTal0Freq; //external Crystal
    1:   OSCSELCLK := XTALRTCFreq;  //32kHz external Crystal
  else
         OSCSELCLK := XTAL1Freq;
  end;

  //MCG.C1.CLKS
  case ((MCG.C1 shr 6) and %11) of
    0:   begin //FLL or PLL
           if ((MCG.C6  shr 6) and %1) = 1 then
           begin //PLL
             divider := (MCG.C5 and %11111)+1;
             Result := OSCSELCLK div divider;
             multiplier := (MCG.C6 and $11111)+24;
             Result := Result * Multiplier;
           end
           else
           begin //FLL
             if ((MCG.C1 shr 2) and %1) = 1 then
               result := SlowRCClockFreq
             else
             begin
               if (((MCG.C2 shr 4) and %11) = 0) or ((MCG.C7 and %11) = 1) then
                 divider := 1 shl ((MCG.C1 shr 3) and %111)
               else
                 divider := 32 shl ((MCG.C1 shr 3) and %111);
               if divider = 2048 then
                 divider := 1280;
               if divider = 4096 then
                 divider := 1536;
               Result := OSCSELCLK div Divider;
             end;
             case ((MCG.C4 shr 7) and %1) + (((MCG.C4 shr 5) and %11) shl 1) of
               0: result := result * 640;
               1: result := result * 732;
               2: result := result * 1280;
               3: result := result * 1464;
               4: result := result * 1920;
               5: result := result * 2197;
               6: result := result * 2560;
               7: result := result * 2929;
             end;
           end;
         end;
    1:   begin //Internal Clock
           if MCG.C2 and %1 = 0 then
             Result := SlowRCClockFreq
           else
             Result := FastRCClockFreq div ( 1 shl ((MCG.SC shr 1) and %111));
         end;
    2:   begin //External Clock
           Result := OSCSELCLK;
         end;
  end;
end;

procedure TKinetisSystemCore.Initialize;
begin
  ConfigureSystem;
  ConfigureTimer;
end;

function TKinetisSystemCore.GetSysTickClockFrequency : Cardinal; [public, alias: 'MBF_GetSysTickClockFrequency'];
begin
    Result := GetSystemClockFrequency;
end;

procedure TKinetisSystemCore.ConfigureSystem;
begin
end;

function TKinetisSystemCore.GetCPUFrequency: Cardinal;
begin
  //TODO, for now always take Bootup Frequency
  Result := $1400000;
end;

procedure TKinetisSystemCore.SetCPUFrequency(const Value: Cardinal);
begin
  //TODO, for now always take Bootup Frequency
  ConfigureTimer;
end;

{$ENDREGION}

end.
