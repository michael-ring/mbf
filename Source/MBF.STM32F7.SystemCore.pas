unit mbf.stm32f7.systemcore;
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

  STM32F75xxx and STM32F74xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00124865.pdf

  STM32F76xxx and STM32F77xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00224583.pdf

  STM32F72xxx and STM32F73xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00305990.pdf
}

interface

{$INCLUDE MBF.Config.inc}

{$DEFINE INTERFACE}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF INTERFACE}

{$if defined(STM32F7)}
const
  MaxCPUFrequency=216000000;
  MinVCOInFrequency=1000000;
  MaxVCOInFrequency=2000000;
  MinVCOFrequency=100000000;
  MaxAPB1Frequency= 54000000;
  MaxAPB2Frequency=108000000;
  MaxVCOFrequency=432000000;
  PLLNMIN=50;
  PLLNMAX=432;
{$else}
  {$error Unknown Chip series, please define maximum CPU Frequency}
{$endif}

const
  HSIClockFrequency = 16000000;
  LSIClockFreq = 32768;

var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;

type
  TClockType = (HSI,HSE,PLLHSI,PLLHSE);

type
  TSTM32SystemCore = record helper for TSystemCore
  type
    TOSCParameters = record
      FREQUENCY : longWord;
      PLLM : byte;
      PLLN : word;
      PLLP : byte;
      PLLQ : byte;
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
    function GetCPUFrequency: longWord;
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
begin
  case GetCrumb(RCC.CFGR,2) of
    0:  //HSI used as system clock
        Result := HSIClockFrequency;
    1:  //HSE used as system clock
        Result := HSEClockFrequency;
    2:  //PLL used as system clock;
        begin
          case GetBit(RCC.PLLCFGR,22) of
            0: Result := HSIClockFrequency;
            1: Result := HSEClockFrequency;
          end;
          Result := Result div getBitsMasked(RCC.PLLCFGR,%111111 shl 0,0); //PLLM
          Result := Result * getBitsMasked(RCC.PLLCFGR,%111111111 shl 6,6);//PLLN;
          Result := Result div ((getCrumb(RCC.PLLCFGR,16) shl 1)+2);
        end;
    else
      Result := 0;
  end;
end;

function TSTM32SystemCore.GetHCLKFrequency : longWord;
var
  temp : longWord;
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
  Result := GetHCLKFrequency div APBDividers[getBitsMasked(RCC.CFGR,%111 shl 10,10)];
end;

function TSTM32SystemCore.GetAPB1TimerClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDividers[getBitsMasked(RCC.CFGR,%111 shl 10,10)];
  if APBDividers[getBitsMasked(RCC.CFGR,%111 shl 10,10)] >1 then
    Result := Result shl 1;
end;

function TSTM32SystemCore.GetAPB2PeripheralClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDividers[getBitsMasked(RCC.CFGR,%111 shl 13,13)];
end;

function TSTM32SystemCore.GetAPB2TimerClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDividers[getBitsMasked(RCC.CFGR,%111 shl 13,13)];
  if APBDividers[getBitsMasked(RCC.CFGR,%111 shl 13,13)] >1 then
    Result := Result shl 1;
end;

procedure TSTM32SystemCore.Initialize;
begin
  ConfigureSystem;
  ConfigureTimer;
end;

procedure TSTM32SystemCore.ConfigureSystem;
var
  temp : longWord;
begin
  //PWR Enable PWR Subsystem Clock
  setBit(RCC.APB1ENR,28);
  //Read back value for a short delay
  getBit(RCC.APB1ENR,28);
end;

function TSTM32SystemCore.getFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
var
  AHBPRE : byte;
  PLLM : byte;
  PLLN : word;
  PLLP : byte;
  LastError : longWord;
  PLLOutFrequency : longWord;
  MinVCOFrequency,MaxVCOFrequency,PLLInFrequency,SysClockFrequency,HCLKFrequency : longWord;
begin
  Result.Frequency := 0;
  //TODO Implement Overdrive Mode
  if aHCLKFrequency > MaxCPUFrequency then
    aHCLKFrequency := MaxCPUFrequency;
  if (getCrumb(PWR.CR1,14) = %01) and (aHCLKFrequency > 144000000) then
    aHCLKFrequency := 144000000;
  if (getCrumb(PWR.CR1,14) = %10) and (aHCLKFrequency > 168000000) then
    aHCLKFrequency := 168000000;
  if (getCrumb(PWR.CR1,14) = %11) and (aHCLKFrequency > 180000000) then
    aHCLKFrequency := 180000000;

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

      for PLLM := 2 to 63 do
      begin
        PLLInFrequency := SysClockFrequency div PLLM;
        if (PLLInFrequency >=MinVCOInFrequency) and (PLLInFrequency <=MaxVCOInFrequency) then
        begin
          for PLLN := PLLNMIN to PLLNMAX do
          begin
            PLLOUTFrequency := PLLInFrequency * PLLN;
            if (PLLOUTFrequency < MinVCOFrequency) or (PLLOUTFrequency > MaxVCOFrequency) then
              continue;
            for PLLP := 0 to 3 do
            begin
              for AHBPRE := 0 to 7 do
              begin
                HCLKFrequency := PLLOutFrequency div ((PLLP shl 1)+2) div AHBDividers[AHBPRE];
                if HCLKFrequency > MaxCPUFrequency then
                  continue;
                // Only replace Parameters when Results are actually better to make sure in VCO In-Frequency is as high as possible
                if LastError > Abs(aHCLKFrequency-HCLKFrequency) then
                begin
                  LastError := Abs(aHCLKFrequency-HCLKFrequency);
                  Result.Frequency := HCLKFrequency;
                  Result.AHBPRE := AHBPRE;
                  Result.PLLM := PLLM;
                  Result.PLLN := PLLN;
                  Result.PLLP := PLLP; //Main
                  Result.PLLQ := 2; //USB
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
  if GetBit(RCC.CR,0) = 0 then
    SetBit(RCC.CR,0);

  //Wait for HSI Clock to be stable
  WaitBitIsSet(RCC.CR,1);

  // Switch to HSI Clock
  if GetCrumb(RCC.CFGR,2) <> byte(TClockType.HSI) then
    SetCrumb(RCC.CFGR,byte(TClockType.HSI),0);

  //Wait until HSI Clock is activated
  repeat
  until getCrumb(RCC.CFGR,2) = byte(TClockType.HSI);

  //PLLON Disable PLL if active
  if GetBit(RCC.CR,24) = 1 then
  begin
    clearBit(RCC.CR,24);
    //PLLRDY Wait for PLL to shut down
    WaitBitIsCleared(RCC.CR,25);
  end;

  Params := getFrequencyParameters(Value,aClockType);

  //Set Flash Waitstates
  //TODO Set Waitstates depending on Supply Voltage
    WaitStates := Params.FREQUENCY div 30000000;

  SetNibble(FLASH.ACR,WaitStates,0);

  // Wait until Waitstates are set
  repeat
  until getNibble(FLASH.ACR,0) = WaitStates;

  //Enable Prefetch when > 0WS
  if WaitStates = 0 then
    Clearbit(FLASH.ACR,8)
  else
    SetBit(FLASH.ACR,8);

  //Enable ART when > 0WS
  if WaitStates = 0 then
    Clearbit(FLASH.ACR,9)
  else
      SetBit(FLASH.ACR,9);

  // Set AHB Prescaler
  SetNibble(RCC.CFGR,Params.AHBPRE,4);
  repeat
  until GetNibble(RCC.CFGR,4) = Params.AHBPRE;

  // Set APB1 Prescaler
  SetBitsMasked(RCC.CFGR,1,%111 shl 10,10);
  repeat
  until GetBitsMasked(RCC.CFGR,%111 shl 10,10) = 1;

  // Set APB2 Prescaler
  SetBitsMasked(RCC.CFGR,1,%111 shl 13,13);
  repeat
  until GetBitsMasked(RCC.CFGR,%111 shl 13,13) = 1;

  case aClockType of
    TClockType.HSI :
    begin
      SetCrumb(RCC.CFGR,byte(TClockType.HSI),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSI);
    end;
    TClockType.HSE :
    begin
      // Turn on HSE
      setBit(RCC.CR,16);
      WaitBitIsSet(RCC.CR,17);
      // Switch to HSE
      SetCrumb(RCC.CFGR,byte(TClockType.HSE),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSE);
    end;
    TClockType.PLLHSI,TClockType.PLLHSE:
    begin
      if aClockType = TClockType.PLLHSI then
        ClearBit(RCC.PLLCFGR,22)
      else
      begin
        // Turn on HSE
        setBit(RCC.CR,16);
        WaitBitIsSet(RCC.CR,17);
        SetBit(RCC.PLLCFGR,22);
      end;

      // PLLM
      SetBitsMasked(RCC.PLLCFGR,Params.PLLM,%111111,0);
      // PLLN
      SetBitsMasked(RCC.PLLCFGR,Params.PLLN,%111111111 shl 6,6);
      // TODO Handle Case when PLLN = 0
      // PLLP
      SetCrumb(RCC.PLLCFGR,Params.PLLP,16);
      // PLLQ
      SetNibble(RCC.PLLCFGR,Params.PLLQ,24);

      //PLLON Enable PLL
      setBit(RCC.CR,24);

      //PLLRDY Wait for PLL to lock
      WaitBitIsSet(RCC.CR,25);

      //Enable PLL
      setCrumb(RCC.CFGR,byte(TClockType.PLLHSI),0);

      //Wait for PLL Switch
      repeat
      until getCrumb(RCC.CFGR,2) = byte(TClockType.PLLHSI);
    end;
  end;
  ConfigureTimer;
end;

function TSTM32SystemCore.GetCPUFrequency : longWord;
begin
  Result := getHCLKFrequency;
end;

function TSTM32SystemCore.GetMaxCPUFrequency : longWord;
begin
  Result := MaxCPUFrequency;
end;

{$ENDREGION}

begin
end.
