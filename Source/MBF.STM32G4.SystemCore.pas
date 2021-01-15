unit mbf.stm32g4.systemcore;
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

  STM32G4 Series advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00355726.pdf
}
interface

{$INCLUDE MBF.Config.inc}

{$DEFINE INTERFACE}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF INTERFACE}

{$if defined(stm32g4) }
// All g4 chips have 170MHz
const
  MaxCPUFrequency=170000000;
{$else}
  {$error Unknown Chip, please check mbf.boards.stm32g0.inc and then define maximum CPU Frequency here}
{$endif}

const
  HSIClockFrequency = 16000000;
  LSIClockFreq = 32768;

var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;

type
  TClockType = (None=0,HSI,HSE,PLLHSI,PLLHSE);

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
    end;
  private
    procedure ConfigureSystem;
    function GetFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
    function GetSysTickClockFrequency : longWord;
    function GetHCLKFrequency : longWord;
  public
    procedure Initialize;
    function GetSYSCLKFrequency: longWord;
    function GetAPB1PeripheralClockFrequency : longWord;
    function GetAPB1TimerClockFrequency : longWord;
    function GetAPB2PeripheralClockFrequency : longWord;
    function GetAPB2TimerClockFrequency : longWord;
    procedure SetCPUFrequency(const Value: longWord; aClockType : TClockType = TClockType.PLLHSI);
    function GetCPUFrequency : longWord;
    function getMaxCPUFrequency : longWord;
  end;

var
  SystemCore : TSystemCore;

implementation

uses
  cortexm4,MBF.BitHelpers;

{$DEFINE IMPLEMENTATION}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF IMPLEMENTATION}

{$REGION 'TSystemCore'}

const
  AHBDividers : array[0..15] of word =(1,1,1,1,1,1,1,1,2,4,8,16,64,128,256,512);
  APBDividers : array[0..7] of byte = (1,1,1,1,2,4,8,16);

function TSTM32SystemCore.GetSYSCLKFrequency : longWord;
var
  temp : int64;
begin
  case getCrumb(RCC.CFGR,2) of
    1:  //HSI used as system clock
        Result := HSIClockFrequency;
    2:  //HSE used as system clock
        Result := HSEClockFrequency;
    3:  //PLL used as system clock;
        begin
          case getCrumb(RCC.PLLCFGR,0) of
            0: Result := 0;
            1: Result := 0; //Reserved
            2: Result := HSIClockFrequency;
            3: Result := HSEClockFrequency;
          end;
          // Divide by PLLM
          temp := Result div getNibble(RCC.PLLCFGR,4);
          // Multiply by PLLN
          temp := temp * getBitsMasked(RCC.PLLCFGR,%1111111 shl 8,8);
          // Divide by PLLR
          // TODO Include Bit 17
          Result := temp div ((getCrumb(RCC.PLLCFGR,25)+1)shl 1);
        end;
  else
    Result := 0;
  end;
end;

function TSTM32SystemCore.GetHCLKFrequency : longWord;
begin
  Result := getSYSCLKFrequency div AHBDividers[getNibble(RCC.CFGR,4)];
end;

function TSTM32SystemCore.GetSysTickClockFrequency : longWord; [public, alias: 'MBF_GetSysTickClockFrequency'];
begin
  Result := GetHCLKFrequency;
  if GetBit(SysTick.CTRL,2) = 0 then
    Result := Result div 8;
end;

function TSTM32SystemCore.GetAPB1PeripheralClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDividers[getBitsMasked(RCC.CFGR,%111 shl 8,8)];
end;

function TSTM32SystemCore.GetAPB1TimerClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDividers[getBitsMasked(RCC.CFGR,%111 shl 8,8)];
end;

function TSTM32SystemCore.GetAPB2PeripheralClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDividers[getBitsMasked(RCC.CFGR,%111 shl 11,11)];
end;

function TSTM32SystemCore.GetAPB2TimerClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDividers[getBitsMasked(RCC.CFGR,%111 shl 11,11)];
end;

procedure TSTM32SystemCore.Initialize;
begin
  ConfigureSystem;
  ConfigureTimer;
end;

procedure TSTM32SystemCore.ConfigureSystem;
begin
  //PWR Enable PWR Subsystem Clock
  setBit(RCC.APB1ENR1,28);
  //Read back value for a short delay
  getBit(RCC.APB1ENR1,28);
  //Set High Voltage to enable all CPU Frequencies
  setCrumb(PWR.CR1,%01,9);
  //Read back value for a short delay
  repeat
  until getCrumb(PWR.CR1,9) = %01;
end;

function TSTM32SystemCore.getFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
var
  AHBPRE : byte;
  PLLM : byte;
  PLLN : byte;
  PLLR : byte;
  LastError : longWord;
  PLLOutFrequency : Int64;
  MaxVCOFrequency,PLLInFrequency,SysClockFrequency,HCLKFrequency : longWord;
begin
  Result.Frequency := 0;
  MaxVCOFrequency := 344000000;

  if GetCrumb(PWR.CR1,9) = 2 then
  begin
    //In low Voltage Mode max Frequency is reduced
    if aHCLKFrequency > 16000000 then
      aHCLKFrequency := 16000000;
  end;

  LastError := aHCLKFrequency;

  case aClockType of
    TClockType.HSI:
    begin
      SysClockFrequency := HSIClockFrequency;
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
        if (PLLInFrequency >=2660000) and (PLLInFrequency <=8000000) then
        begin
          for PLLN := 8 to 127 do
          begin
            {$PUSH}
            {$WARN 4081 off : Converting the operands to "$1" before doing the multiply could prevent overflow errors.}
            PLLOUTFrequency := PLLInFrequency * PLLN;
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
  if GetCrumb(RCC.CFGR,2) <> 1 then
    SetCrumb(RCC.CFGR,1,0);

  //Wait until HSI Clock is activated
  repeat
  until getCrumb(RCC.CFGR,2) = 1;

  //PLLON Disable PLL if active
  if GetBit(RCC.CR,24) = 1 then
  begin
    clearBit(RCC.CR,24);
    //PLLRDY Wait for PLL to shut down
    WaitBitIsCleared(RCC.CR,25);
  end;

  Params := getFrequencyParameters(Value,aClockType);

  //Set Flash Waitstates
  if GetCrumb(PWR.CR1,9) = 1 then
  begin
    WaitStates := (Params.Frequency div 20) - 1
  end
  else
  begin
    if Params.Frequency > 16000000 then
      WaitStates := 2
    else if Params.Frequency > 8000000 then
      WaitStates := 1
    else
      WaitStates := 0;
  end;

  SetNibble(FLASH.ACR,WaitStates,0);
  // Wait until Waitstates are set
  repeat
  until getNibble(FLASH.ACR,0) = WaitStates;

  case aClockType of
    TClockType.HSI :
    begin
      // Set AHB Prescaler
      SetNibble(RCC.CFGR,Params.AHBPRE,4);
      repeat
      until GetNibble(RCC.CFGR,4) = Params.AHBPRE;

      // Set APB1 Prescaler
      SetBitsMasked(RCC.CFGR,1,%111 shl 8,8);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = 1;

      // Set APB2 Prescaler
      SetBitsMasked(RCC.CFGR,1,%111 shl 11,11);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 11,11) = 1;

      SetCrumb(RCC.CFGR,byte(TClockType.HSI),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSI);

      //Save some Power
      SetCrumb(RCC.PLLCFGR,0,0);
    end;
    TClockType.HSE :
    begin
      // Set AHB Prescaler
      SetNibble(RCC.CFGR,Params.AHBPRE,4);
      repeat
      until GetNibble(RCC.CFGR,4) = Params.AHBPRE;

      // Set APB1 Prescaler
      SetBitsMasked(RCC.CFGR,1,%111 shl 8,8);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = 1;

      // Set APB2 Prescaler
      SetBitsMasked(RCC.CFGR,1,%111 shl 11,11);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 11,11) = 1;

      SetCrumb(RCC.CFGR,byte(TClockType.HSE),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSE);
      //Save some Power
      SetCrumb(RCC.PLLCFGR,0,0);
    end;
    TClockType.PLLHSI,TClockType.PLLHSE:
    begin
      if aClockType = TClockType.PLLHSI then
        SetCrumb(RCC.PLLCFGR,2,0)
      else
        SetCrumb(RCC.PLLCFGR,3,0);
      // Set AHB Prescaler
      SetNibble(RCC.CFGR,Params.AHBPRE,4);
      repeat
      until GetNibble(RCC.CFGR,4) = Params.AHBPRE;

      // Set APB1 Prescaler
      SetBitsMasked(RCC.CFGR,0,%111 shl 8,8);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = 0;

      // Set APB2 Prescaler
      SetBitsMasked(RCC.CFGR,0,%111 shl 11,11);
      repeat
      until GetBitsMasked(RCC.CFGR,%111 shl 11,11) = 0;

      // PLLM
      SetNibble(RCC.PLLCFGR,Params.PLLM,4);
      // PLLN
      SetBitsMasked(RCC.PLLCFGR,Params.PLLN,%1111111 shl 8,8);
      // TODO Handle Case when PLLN = 0
      // PLLP
      {$PUSH}
      {$WARN 4110 off : Range check error while evaluating constants ($1 must be between $2 and $3)}
      SetBitsMasked(RCC.PLLCFGR,Params.PLLP,%11111 shl 27,27);
      {$POP}
      SetBit(RCC.PLLCFGR,16);
      // PLLQ
      SetCrumb(RCC.PLLCFGR,Params.PLLQ,21);
      SetBit(RCC.PLLCFGR,20);
      // PLLR
      SetBitsMasked(RCC.PLLCFGR,Params.PLLR,%111 shl 25,25);
      SetBit(RCC.PLLCFGR,24);


      //PLLON Enable PLL
      setBit(RCC.CR,24);

      //PLLRDY Wait for PLL to lock
      WaitBitIsSet(RCC.CR,25);

      //Enable PLL
      setCrumb(RCC.CFGR,byte(TClockType.PLLHSI),0);

      //Wait for PLL Switch
      repeat
      until getCrumb(RCC.CFGR,2) = byte(TClockType.PLLHSI);
    end
    else
      ;
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
