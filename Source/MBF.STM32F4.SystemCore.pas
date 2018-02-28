unit mbf.stm32f4.systemcore;
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
{< ST Micro F4xx board series functions. }
interface

{$INCLUDE MBF.Config.inc}



uses
  MBF.SystemCore;

{$if defined(STM32F401)}
const
  MaxCPUFrequency=84000000;
  PLLN_MIN=192;
  PLLN_MAX=432;
{$elseif defined(STM32F410) or defined(STM32F411)}
const
  MaxCPUFrequency=100000000;
  PLLN_MIN=100;
  PLLN_MAX=432;
{$elseif defined(STM32F405_415) or defined(STM32F407_417)}
const
  MaxCPUFrequency=168000000;
  PLLN_MIN=100;
  PLLN_MAX=432;
{$elseif defined(STM32F427_437) or defined(STM32F429_439)
      or defined(STM32F446) or defined(STM32F469_479)}
const
  MaxCPUFrequency=180000000;
  PLLN_MIN=100;
  PLLN_MAX=432;
{$else}
  {$error Unknown Chip series, please define maximum CPU Frequency}
{$endif}

const
  HSIClockFrequency = 16000000;
  FastRCClockFreq = 4000000;
  SlowRCClockFreq = 32768;
var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;

type
  TSTM32SystemCore = record helper for TSystemCore
  type
    TOSCParameters = record
      FREQUENCY : longWord;
      PLLM : byte;
      PLLN : word;
      PLLP : byte;
      PLLQ : byte;
      HPRE : byte;
    end;
  private
    procedure ConfigureSystem;
    function getFrequencyParameters(aFrequency,aOSCCLOCK,aSYSCLOCK_MAX,aPLLN_MIN,aPLLN_MAX : longWord):TOSCParameters;
    function GetSysTickClockFrequency : Cardinal;
    function GetSYSCLKFrequency: Cardinal;
    function GetHCLKFrequency : Cardinal;
    function GetFCLKFrequency : Cardinal;
  public
    procedure Initialize;
    function GetAPB1PeripheralClockFrequency : Cardinal;
    function GetAPB1TimerClockFrequency : Cardinal;
    function GetAPB2PeripheralClockFrequency : Cardinal;
    function GetAPB2TimerClockFrequency : Cardinal;
    function GetCPUFrequency: Cardinal;
    procedure SetCPUFrequency(const Value: Cardinal);
    function getMaxCPUFrequency : Cardinal;

    property CPUFrequency: Cardinal read GetCPUFrequency write SetCPUFrequency;

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
  //if (SysTick.Ctrl and (1 shl 2)) = 0 then
    //External Clock is always CPUFrequency / 8
    //Result := GetCPUFrequency div 8
  //else
    Result := GetHCLKFrequency;
end;

function TSTM32SystemCore.GetAPB1PeripheralClockFrequency : Cardinal;
var
  divider : byte;
begin
  divider := (RCC.CFGR shr 10) and $07;
  if Divider < 4 then
    Result := GetHCLKFrequency
  else
    Result := GetHCLKFrequency div longWord(2 shl (divider and $03));
end;

function TSTM32SystemCore.GetAPB1TimerClockFrequency : Cardinal;
begin
  if RCC.DCKCFGR and (1 shl 24)  = 0 then
  begin
    if ((RCC.CFGR shr 13) and $07) < 4 then
      Result := GetAPB2PeripheralClockFrequency
    else
      Result := GetAPB2PeripheralClockFrequency*2;
  end
  else
    if ((RCC.CFGR shr 10) and $07) < 5 then
      Result := GetAPB2PeripheralClockFrequency
    else
      Result := GetAPB2PeripheralClockFrequency*4;
end;

function TSTM32SystemCore.GetAPB2PeripheralClockFrequency : Cardinal;
var
  Divider : byte;
begin
  divider := (RCC.CFGR shr 13) and $07;
  if Divider < 4 then
    Result := GetHCLKFrequency
  else
    Result := GetHCLKFrequency div longWord(2 shl (divider and $03));
end;

function TSTM32SystemCore.GetAPB2TimerClockFrequency : Cardinal;
begin
  if (RCC.DCKCFGR and (1 shl 24)) = 0 then
  begin
    if (RCC.CFGR shr 13) and $07 < 4 then
      Result := GetAPB2PeripheralClockFrequency
    else
      Result := GetAPB2PeripheralClockFrequency*2;
  end
  else
    if (RCC.CFGR shr 13) and $07 < 5 then
      Result := GetAPB2PeripheralClockFrequency
    else
      Result := GetAPB2PeripheralClockFrequency*4;
end;

function TSTM32SystemCore.GetHCLKFrequency : Cardinal;
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

function TSTM32SystemCore.GetFCLKFrequency : Cardinal;
begin
  Result := GetHCLKFrequency;
end;

procedure TSTM32SystemCore.ConfigureSystem;
var
  temp : longWord;
begin
  //PWR Enable PWR Subsystem Clock
  RCC.APB1ENR := RCC.APB1ENR or (1 shl 28);
  //Read back value for a short delay
  temp := RCC.APB1ENR and (1 shl 28);
  //Set Regulator to full power
  PWR.CR := PWR.CR or  (%11 shl 14);
  //Read back value for a short delay
  temp := PWR.CR and (%11 shl 14);
end;

function TSTM32SystemCore.getFrequencyParameters(aFrequency,aOSCCLOCK,aSYSCLOCK_MAX,aPLLN_MIN,aPLLN_MAX : longWord):TOSCParameters;
const
  HPRE_VALS : array[7..15] of word = (1,2,4,8,16,64,128,256,512);
var
  PLLQ,PLLP,HPRE,VCOFREQ,SYSCLOCK : longWord;
  //PLLM 2..63
  //PLLN 192..432
  //PLLP 2 4 6 8
  //PLLQ 2..15
  //HPRE 2 4 8 16 64 128 256 512
  //SYSCLOCK MAX 84

begin
  result.FREQUENCY := 0;
  result.PLLM := aOSCCLOCK div 1000000;
  for PLLQ := 2 to 15 do
  begin
    VCOFREQ := PLLQ*48000000;
    if (VCOFREQ >= aPLLN_MIN*1000000) and  (VCOFREQ <= aPLLN_MAX*1000000) then
    begin
      // We are now in the Valid Frequency Range of the VCO
      result.PLLN := VCOFREQ div 1000000;
      for PLLP  := 0 to 3 do
      begin
        SYSCLOCK := VCOFREQ div ((PLLP+1) shl 1);
        if SYSCLOCK <= aSYSCLOCK_MAX then
        begin
          for HPRE := 7 to 15 do
            if SYSCLOCK div HPRE_VALS[HPRE] = aFrequency then
            begin
              result.FREQUENCY := SYSCLOCK div HPRE_VALS[HPRE];
              result.PLLQ := PLLQ;
              result.PLLP := PLLP;
              result.HPRE := HPRE;
              exit;
            end;
        end;
      end;
    end;
  end;
end;

function TSTM32SystemCore.GetCPUFrequency : longWord;
begin
  Result := getSYSCLKFrequency;
end;

function TSTM32SystemCore.GetSYSCLKFrequency : longWord;
begin
  case (RCC.CFGR shr 2) and %11 of
    0:  //HSI used as system clock
        Result := HSIClockFrequency;
    1:  //HSE used as system clock
        Result := HSEClockFrequency;
    2:  //PLL used as system clock;
        begin
          case (RCC.PLLCFGR shr 22) and %1 of
            0: Result := HSIClockFrequency;
            1: Result := HSEClockFrequency;
          end;
          Result := Result div (RCC.PLLCFGR and $3f); //PLLM
          Result := Result * ((RCC.PLLCFGR shr 6) and $1ff);//PLLN;
          Result := Result div byte((((RCC.PLLCFGR shr 16) and %11) shl 1)+2);
        end;
  end;
end;

procedure TSTM32SystemCore.SetCPUFrequency(const Value: Cardinal);
var
  dummy : longWord;
  value2 : longWord;
  Params : TOscParameters;
begin
  Value2 := (Value div 1000000) * 1000000;
    if GetHCLKFrequency <> Value2 then
    begin
      //Set Flash Waitstates
      if Value2 >= 150000000 then
        FLASH.ACR := 5
      else if Value2 >= 120000000 then
        FLASH.ACR := 4
      else if Value2 >= 90000000 then
        FLASH.ACR := 3
      else if Value2 >= 60000000 then
        FLASH.ACR := 2
      else if Value2 >= 30000000 then
        FLASH.ACR := 1
      else
        FLASH.ACR := 0;
      //Read Register to activate
      dummy := FLASH.ACR;
      //Make sure that HSI Clock is enabled
      if RCC.CR and (1 shl 0) = 0 then
        RCC.CR := RCC.CR or (1 shl 0);

      //Wait for HSI Clock to be stable
      while (RCC.CR and (1 shl 1)) = 0 do
        ;

      if (RCC.CFGR and (%11 shl 2)) <> 0 then
         RCC.CFGR := RCC.CFGR and not (%11 shl 0);

      //Wait until HSI Clock is activated
      while (RCC.CFGR  and (%11 shl 2)) <> 0 do
        ;

      //PLLON Disable PLL if active
      if RCC.CR and (1 shl 24) = 1 then
        RCC.CR := RCC.CR and (not (1 shl 24));

      //PLLRDY Wait for PLL to shut down
      while (RCC.CR and (1 shl 25)) <> 0 do
        ;
        Params := getFrequencyParameters(Value2,HSICLOCKFrequency,MaxCPUFrequency,PLLN_MIN,PLLN_MAX);
        while Params.Frequency = 0 do
        begin
          Value2 := Value2 - 1000000;
          Params := getFrequencyParameters(Value2,HSICLOCKFrequency,MaxCPUFrequency,PLLN_MIN,PLLN_MAX);
        end;

        RCC.PLLCFGR := (%111 shl 28) or (Params.PLLQ shl 24) or (0 shl 22) or (Params.PLLP shl 16) or (Params.PLLN shl 6)
                       or Params.PLLM;

        RCC.CFGR := (0 shl 13) or (%100 shl 10) or (Params.HPRE shl 4);

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

        if Params.Frequency > 100000000 then
        begin
          //For fast Chips we must divide both PCLK1 and PCLK2
          RCC.CFGR := RCC.CFGR and not (%111 shl 13) or (%100 shl 13);
          RCC.CFGR := RCC.CFGR and not (%111 shl 10) or (%101 shl 10);
        end
        else if Params.Frequency > MaxCPUFrequency div 2 then
        begin
          //For <100 MHZ it is good enough to change PCLK1
          RCC.CFGR := RCC.CFGR and not (%111 shl 13);
          RCC.CFGR := RCC.CFGR and not (%111 shl 10) or (%100 shl 10);
        end
        else
        begin
          // For < 50MHz we can run both busses with full speed
          RCC.CFGR := RCC.CFGR and not (%111 shl 13);
          RCC.CFGR := RCC.CFGR and not (%111 shl 10);
        end;

        ConfigureTimer;
      end;
  end;

  function TSTM32SystemCore.GetMaxCPUFrequency : longWord;
  begin
    Result := MaxCPUFrequency;
  end;


{$ENDREGION}

begin
end.
