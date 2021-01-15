unit mbf.stm32f0.systemcore;
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

  STM32F0x1STM32F0x2STM32F0x8 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00031936.pdf

  STM32F030x4x6x8xC and STM32F070x6xB advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00091010.pdf
}

interface

{$INCLUDE MBF.Config.inc}

{$DEFINE INTERFACE}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF INTERFACE}

{$if defined(stm32f04x) or defined(stm32f07x) or defined(stm32f09x)}
  {$define has_hsi48}
  {$define has_prediv}
{$endif}

{$if defined(STM32F070C6) or defined(STM32F070F6) or defined(STM32F070CB)
  or defined(STM32F070RB) or defined(STM32F030CC) or defined(STM32F030RC)}
  {$undefine has_hsi48}
  {$define has_prediv}
{$endif}

{$if defined(stm32f0) }
// All f0 chips have 48MHz
const
  MaxCPUFrequency=48000000;
{$else}
  {$error Unknown Chip, please check mbf.boards.stm32f0.inc and then define maximum CPU Frequency here}
{$endif}

const
  HSIClockFrequency = 8000000;
  HSI48ClockFrequency = 48000000;
  LSIClockFreq = 40000;
  LSEClockFreq = 32768;

var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;

type
  TClockType = (HSI,HSE,PLLHSI,{$if defined(has_hsi48)}HSI48,PLLHSI48,{$endif}PLLHSE);

  TSTM32SystemCore = record helper for TSystemCore
  type
    TOSCParameters = record
    FREQUENCY : longWord;
    USBPRE : integer;
    PREDIV : byte;
    PLLN : byte;
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
    procedure SetCPUFrequency(const Value: longWord; aClockType : TClockType = TClockType.PLLHSI);
    function GetCPUFrequency : longWord;
    function getMaxCPUFrequency : longWord;
  end;

var
  SystemCore : TSystemCore;

implementation

uses
  cortexm0,MBF.BitHelpers;

{$DEFINE IMPLEMENTATION}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF IMPLEMENTATION}

{$REGION 'TSystemCore'}

const
  AHBDividers : array[0..15] of word =(1,1,1,1,1,1,1,1,2,4,8,16,64,128,256,512);
  APBDividers : array[0..7] of byte = (1,1,1,1,2,4,8,16);

function TSTM32SystemCore.GetSYSCLKFrequency : longWord;
var
  temp : longWord;
begin
  case getCrumb(RCC.CFGR,2) of
    %00:  //HSI used as system clock
        Result := HSIClockFrequency;
    %01:  //HSI used as system clock
        Result := HSEClockFrequency;
    %10:  //PLL used as system clock;
        begin
          case getCrumb(RCC.CFGR,15) of
            %00: Result := HSIClockFrequency div 2;
            %01: Result := HSIClockFrequency div (getNibble(RCC.CFGR2,0)+1);
            %10: Result := HSEClockFrequency div longWord(getNibble(RCC.CFGR2,0)+1);
            %11: Result := HSI48ClockFrequency div (getNibble(RCC.CFGR2,0)+1);
          end;
          temp := getNibble(RCC.CFGR,18) + 2;
          if temp > 16 then
            temp := 16;
          Result := Result * temp;
        end;
    %11:  //HSI48 used as system clock
        Result := HSI48ClockFrequency;
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
  if APBDividers[getBitsMasked(RCC.CFGR,%111 shl 8,8)] = 1 then
    Result := GetAPB1PeripheralClockFrequency
  else
    Result := GetAPB1PeripheralClockFrequency shl 1;
end;

procedure TSTM32SystemCore.Initialize;
begin
  ConfigureSystem;
  ConfigureTimer;
end;

procedure TSTM32SystemCore.ConfigureSystem;
begin
  //PWR Enable PWR Subsystem Clock
  setBit(RCC.APB1ENR,28);
  //Read back value for a short delay
  getBit(RCC.APB1ENR,28);
end;

function TSTM32SystemCore.getFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
var
  PREDIV : byte;
  PLLN : byte;
  AHBPRE : byte;
  LastError : longWord;
  PREDIVMin,PREDIVMax,MaxVCOFrequency,SysClockFrequency,PLLInFrequency,PLLOutFrequency,HCLKFrequency : longWord;
begin
  Result.Frequency := 0;
  MaxVCOFrequency := 48000000;
  Result.USBPre := -1;
  LastError := aHCLKFrequency;

  case aClockType of
    TClockType.HSI,
    {$if defined(has_hsi48)}
    TClockType.HSI48,
    {$endif}
    TClockType.HSE:
    begin
      if (aClockType = TClockType.HSI) then
        SysClockFrequency := HSIClockFrequency
      {$if defined(has_hsi48)}
      else if aClockType = TClockType.HSI48 then
        SysClockFrequency := HSI48ClockFrequency
      {$endif}
      else
        SysClockFrequency := HSEClockFrequency;

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
    end
  else
    begin
      if aClockType = TClockType.PLLHSI then
      begin
        {$if not defined(has_prediv)}
        SysClockFrequency := HSIClockFrequency div 2;
        PREDIVMin := 1;
        PREDIVMax := 1;
        {$else}
        PREDIVMin := 0;
        PREDIVMax := 15;
        SysClockFrequency := HSIClockFrequency;
        {$endif}
      end
      {$if defined(has_hsi48)}
      else if aClockType = TClockType.PLLHSI48 then
      begin
        SysClockFrequency := HSI48ClockFrequency;
        PREDIVMin := 0;
        PREDIVMax := 15;
      end
      {$endif}
      else
      begin
        SysClockFrequency := HSEClockFrequency;
        PREDIVMin := 0;
        PREDIVMax := 15;
      end;

      for PREDIV := PREDIVMin to PREDIVMax do
      begin
        PLLInFrequency := SysClockFrequency div longWord(PREDIV+1);
        if (PLLInFrequency >=1000000) and (PLLInFrequency <=24000000) then
        begin
          for PLLN := 2 to 16 do
          begin
            PLLOUTFrequency := PLLInFrequency * PLLN;
            if (PLLOUTFrequency >= 16000000) and (PLLOUTFrequency <= MaxCPUFrequency) then
            begin
              for AHBPRE := 7 to 15 do
              begin
                HCLKFrequency := PLLOutFrequency div AHBDividers[AHBPRE];
                if LastError >= Abs(aHCLKFrequency-HCLKFrequency) then
                begin
                  // Do not overwrite a match that gives USB Datarate with another
                  if (LastError = Abs(aHCLKFrequency-HCLKFrequency)) and (Result.USBPre >=0) then
                    continue;
                  LastError := Abs(aHCLKFrequency-HCLKFrequency);
                  Result.Frequency := HCLKFrequency;
                  Result.PREDIV := PREDIV;
                  Result.PLLN := PLLN-2;
                  Result.AHBPRE := AHBPRE;
                  Result.USBPRE := -1;
                  if (PLLOUTFrequency = 48000000) then
                    Result.USBPRE := 0;
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
  WaitStates : Byte;
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
  if Params.Frequency > 24000000 then
  //One Waitstate Prefetch Buffer enabled
    WaitStates := 1
  else
    //Zero Waitstates Prefetch Buffer enabled
    WaitStates := 0;

  //Set Waitstates
  SetBitsMasked(FLASH.ACR,WaitStates,%111 shl 0,0);
  // Wait for WaitStates set
  repeat
  until GetBitsMasked(FLASH.ACR,%111 shl 0,0) = WaitStates;

  if Params.AHBPRE=0 then
    ClearBit(FLASH.ACR,4)
  else
    //Enable Prefetch Buffer
    SetBit(FLASH.ACR,4);

  {$if defined(has_prediv)}
  SetNibble(RCC.CFGR2,Params.PREDIV,0);
  repeat
  until GetNibble(RCC.CFGR2,0) = Params.PREDIV;
  {$endif}

  // Set AHB Prescaler
  SetNibble(RCC.CFGR,Params.AHBPRE,4);
  repeat
  until GetNibble(RCC.CFGR,4) = Params.AHBPRE;

  // Set APB1 Prescaler
  if Params.FREQUENCY >= 36000000 then
  begin
    SetBitsMasked(RCC.CFGR,4,%111 shl 8,8);
    repeat
    until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = 4;
  end
  else
  begin
    SetBitsMasked(RCC.CFGR,0,%111 shl 8,8);
    repeat
    until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = 0;
  end;

  case aClockType of
    TClockType.HSI :
    begin
      SetCrumb(RCC.CFGR,byte(TClockType.HSI),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSI);
    end;

    {$if defined(has_hsi48)}
    TClockType.HSI48 :
    begin
      // Turn on HSI48
      SetBit(RCC.CR2,16);
      WaitBitIsSet(RCC.CR2,17);
      // Switch to HSI48
      SetCrumb(RCC.CFGR,byte(TClockType.HSI48),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSI48);
    end;
    {$endif}
    TClockType.HSE :
    begin
      // Turn on HSE
      setBit(RCC.CR,16);
      WaitBitIsSet(RCC.CR,17);
      // Switch to HSE
      SetCrumb(RCC.CFGR,byte(TClockType.HSE),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSE);
    end
    else
    begin
      // PLL Case, Set Multiplier
      SetNibble(RCC.CFGR,Params.PLLN,18);

      //Set PLL Source and activate clock
      if aClockType = TClockType.PLLHSI then
      {$if defined(has_prediv)}
        SetCrumb(RCC.CFGR,%01,15);
      {$else}
        SetCrumb(RCC.CFGR,0,15);
      {$endif}
      {$if defined(has_hsi48)}
      if aClockType = TClockType.PLLHSI48 then
      begin
        //Start HSI48 Clock
        SetBit(RCC.CR2,16);
        WaitBitIsSet(RCC.CR2,17);
        //Switch PLL to HSI48 Clock
        SetCrumb(RCC.CFGR,%11,15);
      end;
      {$endif}
      if aClockType = TClockType.PLLHSE then
      begin
        //Start HSE Clock
        SetBit(RCC.CR,16);
        WaitBitIsSet(RCC.CR,17);
        //Switch PLL to HSE Clock
        SetCrumb(RCC.CFGR,%10,15);
      end;

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
  Result := GetHCLKFrequency;
end;

function TSTM32SystemCore.GetMaxCPUFrequency : longWord;
begin
  Result := MaxCPUFrequency;
end;

{$ENDREGION}

begin
end.
