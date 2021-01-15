unit mbf.stm32g0.systemcore;
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
{
  Related Reference Manuals

  STM32G0x1 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00371828.pdf

  STM32G0x0 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00463896.pdf
}
interface

{$INCLUDE MBF.Config.inc}

{$DEFINE INTERFACE}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF INTERFACE}

{$if defined(stm32g0) }
// All g0 chips have 64MHz
const
  MaxCPUFrequency=64000000;
{$else}
  {$error Unknown Chip, please check mbf.boards.stm32g0.inc and then define maximum CPU Frequency here}
{$endif}

const
  HSIClockFrequency = 16000000;
  LSIClockFreq = 32768;
  LSEClockFreq = 32768;

var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;

type
  TClockType = (HSI=0,HSE,PLLHSI,LSI,LSE,PLLHSE);

  TSTM32SystemCore = record helper for TSystemCore
  type
    TOSCParameters = record
    FREQUENCY : longWord;
    PLLM : byte;
    PLLN : byte;
    PLLP : byte;
    PLLQ : byte;
    PLLR : byte;
    AHBPRE : byte;
    HSIPRE : byte;
  end;
  private
    procedure ConfigureSystem;
    function GetFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
    function GetSysTickClockFrequency : longWord;
    function GetHCLKFrequency : longWord;
  public
    procedure Initialize;
    function GetSYSCLKFrequency: longWord;
    function GetAPBPeripheralClockFrequency : longWord;
    function GetAPBTimerClockFrequency : longWord;
    procedure SetCPUFrequency(const Value: longWord; aClockType : TClockType = TClockType.PLLHSI);
    function GetCPUFrequency : longWord;
    function getMaxCPUFrequency : longWord;
  end;

var
  SystemCore : TSystemCore;

implementation

{$IF DEFINED(CortexM0)}
uses
  cortexm0,MBF.BitHelpers;
{$ELSEIF DEFINED(CortexM3)}
uses
  cortexm3;
{$ELSEIF DEFINED(CortexM4)}
uses
  cortexm4;
{$ELSEIF DEFINED(CortexM7)}
uses
  cortexm7;
{$ENDIF}

{$DEFINE IMPLEMENTATION}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF IMPLEMENTATION}

{$REGION 'TSystemCore'}

const
  AHBDividers : array[0..15] of word =(1,1,1,1,1,1,1,1,2,4,8,16,64,128,256,512);
  APBDidiers : array[0..7] of byte = (1,1,1,1,2,4,8,16);

function TSTM32SystemCore.GetSYSCLKFrequency : longWord;
var
  temp : int64;
begin
  case getBitsMasked(RCC.CFGR,%111 shl 3,3) of
    0:  //HSI used as system clock
        Result := HSIClockFrequency div (1 shl getBitsMasked(RCC.CR,%111 shl 11,11));
    1:  //HSE used as system clock
        Result := HSEClockFrequency;
    2:  //PLL used as system clock;
        begin
          case getBitsMasked(RCC.PLLCFGR,%11 shl 0,0) of
            0: Result := 0;
            1: Result := 0; //Reserved
            2: Result := HSIClockFrequency;
            3: Result := HSEClockFrequency;
          end;
          // Divide by PLLM
          temp := Result div (getBitsMasked(RCC.PLLCFGR,%111 shl 4,4)+1);
          // Multiply by PLLN
          temp := temp * getBitsMasked(RCC.PLLCFGR,%1111111 shl 8,8);
          // Divide by PLLR
          {$PUSH}
          {$WARN 4079 off : Converting the operands to "$1" before doing the add could prevent overflow errors.}
          Result := temp div (getBitsMasked(RCC.PLLCFGR,%111 shl 29,29)+1);
          {$POP}
        end;
     3: Result := LSIClockFreq;
     4: Result := LSEClockFreq;
  else
    ;
  end;
end;

function TSTM32SystemCore.GetHCLKFrequency : longWord;
begin
  Result := getSYSCLKFrequency div AHBDividers[getBitsMasked(RCC.CFGR,%111 shl 8,8)];
end;

function TSTM32SystemCore.GetSysTickClockFrequency : longWord; [public, alias: 'MBF_GetSysTickClockFrequency'];
begin
  Result := GetHCLKFrequency;
  if GetBit(SysTick.CTRL,2) = 0 then
    Result := Result div 8;
end;

function TSTM32SystemCore.GetAPBPeripheralClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDidiers[getBitsMasked(RCC.CFGR,%111 shl 12,12)];
end;

function TSTM32SystemCore.GetAPBTimerClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDidiers[getBitsMasked(RCC.CFGR,%111 shl 12,12)];
end;

procedure TSTM32SystemCore.Initialize;
begin
  ConfigureSystem;
  ConfigureTimer;
end;

procedure TSTM32SystemCore.ConfigureSystem;
begin
  //PWR Enable PWR Subsystem Clock
  setBit(RCC.APBENR1,28);
  //Read back value for a short delay
  getBit(RCC.APBENR1,28);
  //Set High Voltage to enable all CPU Frequencies
  setBitsMasked(PWR.CR1,1,%11 shl 9,9);
end;

function TSTM32SystemCore.getFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
var
  AHBPRE : byte;
  HSIPRE : byte;
  PLLM : byte;
  PLLN : byte;
  PLLR : byte;
  LastError : longWord;
  PLLOutFrequency : Int64;
  MaxVCOFrequency,PLLInFrequency,SysClockFrequency,HCLKFrequency : longWord;
begin
  Result.Frequency := 0;
  if GetBitsMasked(PWR.CR1,%11 shl 9,9) = 2 then
  begin
    //In low Voltage Mode max Frequency is reduced
    MaxVCOFrequency := 128000000;
    if aHCLKFrequency > 16000000 then
      aHCLKFrequency := 16000000;
  end
  else
    MaxVCOFrequency := 344000000;

  LastError := aHCLKFrequency;

  case aClockType of
    TClockType.HSI:
    begin
      Result.HSIPre := 7;
      for HSIPRE := 0 to 7 do
      begin
        SysClockFrequency := HSIClockFrequency div (1 shl HSIPRE);
        if SysClockFrequency <= aHCLKFrequency then
        begin
          Result.HSIPre := HSIPRE;
          break;
        end;
      end;
      Result.AHBPRE := 15;
      for AHBPRE := 7 to 15 do
      begin
        HCLKFrequency := SysClockFrequency div AHBDividers[AHBPRE];
        if HCLKFrequency <= aHCLKFrequency then
        begin
          Result.AHBPRE := AHBPRE;
          break;
        end;
      end;
      Result.Frequency := SysClockFrequency div AHBDividers[AHBPRE];
    end;
    TClockType.HSE:
    begin
      Result.AHBPRE := 15;
      for AHBPRE := 7 to 15 do
      begin
        SysClockFrequency := HSEClockFrequency;
        HCLKFrequency := SysClockFrequency div AHBDividers[AHBPRE];
        if HCLKFrequency <= aHCLKFrequency then
        begin
          Result.AHBPRE := AHBPRE;
          break;
        end;
      end;
      Result.Frequency := SysClockFrequency div AHBDividers[AHBPRE];
    end
  else
    begin
      if aClockType = TClockType.PLLHSI then
        SysClockFrequency := HSIClockFrequency
      else
        SysClockFrequency := HSEClockFrequency;

      for PLLM := 0 to 7 do
      begin
        PLLInFrequency := SysClockFrequency div longWord(PLLM+1);
        if (PLLInFrequency >=4000000) and (PLLInFrequency <=16000000) then
        begin
          for PLLN := 8 to 86 do
          begin
            {$PUSH}
            {$WARN 4081 off : Converting the operands to "$1" before doing the multiply could prevent overflow errors.}
            PLLOUTFrequency := PLLInFrequency * (PLLN);
            {$POP}
            if (PLLOUTFrequency < 64000000) or (PLLOUTFrequency > MaxVCOFrequency) then
              continue;
            for PLLR := 1 to 7 do
            begin
              for AHBPRE := 0 to 7 do
              begin
                {$PUSH}
                {$WARN 4079 off : Converting the operands to "$1" before doing the add could prevent overflow errors.}
                HCLKFrequency := PLLOutFrequency div (PLLR+1) div AHBDividers[AHBPRE];
                {$POP}
                if HCLKFrequency > MaxCPUFrequency then
                  continue;
                if LastError >= Abs(aHCLKFrequency-HCLKFrequency) then
                begin
                  LastError := Abs(aHCLKFrequency-HCLKFrequency);
                  Result.Frequency := HCLKFrequency;
                  Result.AHBPRE := AHBPRE;
                  Result.PLLM := PLLM;
                  Result.PLLN := PLLN;
                  Result.PLLP := PLLR;
                  Result.PLLQ := PLLR;
                  Result.PLLR := PLLR;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if Result.AHBPRE = 7 then
    Result.AHBPRE := 0;
end;

procedure TSTM32SystemCore.SetCPUFrequency(const Value: longWord; aClockType : TClockType = TClockType.PLLHSI);
var
  WaitStates : byte;
  Params : TOscParameters;
begin
  //Make sure that HSI Clock is enabled
  if GetBit(RCC.CR,8) = 0 then
    SetBit(RCC.CR,8);

  //Wait for HSI Clock to be stable
  WaitBitIsSet(RCC.CR,10);

  // Switch to HSI Clock
  if GetBitsMasked(RCC.CFGR,%111 shl 3,3) <> 0 then
    SetBitsMasked(RCC.CFGR,0,%111 shl 0,0);

  //Wait until HSI Clock is activated
  repeat
  until getBitsMasked(RCC.CFGR,%111 shl 3,3) = 0;

  //PLLON Disable PLL if active
  if GetBit(RCC.CR,24) = 1 then
  begin
    clearBit(RCC.CR,24);
    //PLLRDY Wait for PLL to shut down
    WaitBitIsCleared(RCC.CR,25);
  end;

  Params := getFrequencyParameters(Value,aClockType);

  //Set Flash Waitstates
  if GetBitsMasked(PWR.CR1,%11 shl 9,9) = 1 then
  begin
    if Params.Frequency >= 48000000 then
      WaitStates := 2
    else if Params.Frequency >= 24000000 then
      WaitStates := 1
    else
      WaitStates := 0;
  end
  else
  begin
    if Params.Frequency >= 16000000 then
      WaitStates := 2
    else if Params.Frequency >= 8000000 then
      WaitStates := 1
    else
      WaitStates := 0;
  end;

  SetBitsMasked(FLASH.ACR,WaitStates,%111 shl 0,0);
  // Wait until Waitstates are set
  repeat
  until getBitsMasked(FLASH.ACR,%111 shl 0,0) = WaitStates;

  case aClockType of
    TClockType.HSI :
    begin
      // Set HSI Prescaler
      SetBitsMasked(RCC.CR,Params.HSIPRE,%111 shl 11,11);
      repeat
      until GetBitsMasked(RCC.CR,%111 shl 11,11) = Params.HSIPRE;
      // Set AHB Prescaler
      SetBitsMasked(RCC.CFGR,Params.AHBPRE,%111 shl 8,8);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = Params.AHBPRE;

      // Set APB Prescaler
      SetBitsMasked(RCC.CFGR,1,%111 shl 12,12);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 12,12) = 1;

      SetBitsMasked(RCC.CFGR,byte(TClockType.HSI),%111 shl 0,0);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 3,3) = byte(TClockType.HSI);
      //Save some Power
      SetBitsMasked(RCC.PLLCFGR,0,%11 shl 0,0);
    end;
    TClockType.HSE :
    begin
      // Set AHB Prescaler
      SetBitsMasked(RCC.CFGR,Params.AHBPRE,%111 shl 8,8);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = Params.AHBPRE;

      // Set APB Prescaler
      SetBitsMasked(RCC.CFGR,1,%111 shl 12,12);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 12,12) = 1;

      SetBitsMasked(RCC.CFGR,byte(TClockType.HSE),%111 shl 0,0);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 3,3) = byte(TClockType.HSE);
      //Save some Power
      SetBitsMasked(RCC.PLLCFGR,0,%11 shl 0,0);
    end;
    TClockType.PLLHSI,TClockType.PLLHSE:
    begin
      if aClockType = TClockType.PLLHSI then
        SetBitsMasked(RCC.PLLCFGR,2,%11 shl 0,0)
      else
        SetBitsMasked(RCC.PLLCFGR,3,%11 shl 0,0);
      // Set AHB Prescaler
      SetBitsMasked(RCC.CFGR,Params.AHBPRE,%111 shl 8,8);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = Params.AHBPRE;

      // Set APB Prescaler
      SetBitsMasked(RCC.CFGR,0,%111 shl 12,12);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 12,12) = 0;


      ClearBit(RCC.PLLCFGR,16);
      ClearBit(RCC.PLLCFGR,24);
      ClearBit(RCC.PLLCFGR,28);

      // PLLM
      SetBitsMasked(RCC.PLLCFGR,Params.PLLM,%111 shl 4,4);
      // PLLN
      SetBitsMasked(RCC.PLLCFGR,Params.PLLN,%1111111 shl 8,8);
      // PLLP
      SetBitsMasked(RCC.PLLCFGR,Params.PLLP,%111 shl 17,17);
      // PLLQ
      SetBitsMasked(RCC.PLLCFGR,Params.PLLQ,%111 shl 25,25);
      // PLLR
      {$PUSH}
      {$WARN 4110 off : Range check error while evaluating constants ($1 must be between $2 and $3)}
      SetBitsMasked(RCC.PLLCFGR,Params.PLLR,%111 shl 29,29);
      {$POP}
      SetBit(RCC.PLLCFGR,28);

      //PLLON Enable PLL
      setBit(RCC.CR,24);

      //PLLRDY Wait for PLL to lock
      WaitBitIsSet(RCC.CR,25);

      //Enable PLL
      setBitsMasked(RCC.CFGR,byte(TClockType.PLLHSI),%111 shl 0,0);

      //Wait for PLL Switch
      repeat
      until getBitsMasked(RCC.CFGR,%111 shl 3,3) = byte(TClockType.PLLHSI);
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
