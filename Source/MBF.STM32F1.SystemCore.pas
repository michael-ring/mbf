unit mbf.stm32f1.systemcore;
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

  STM32F100xx advanced ARM
  http://www.st.com/resource/en/reference_manual/CD00246267.pdf

  STM32F101xx, STM32F102xx, STM32F103xx, STM32F105xx and STM32F107xx advanced Arm
  http://www.st.com/resource/en/reference_manual/CD00171190.pdf
}

interface

{$INCLUDE MBF.Config.inc}

{$DEFINE INTERFACE}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF INTERFACE}

{$if defined(stm32f100) }
// All f100 chips have 24MHz
const
  MaxCPUFrequency=24000000;
{$elseif defined(stm32f101) }
// All f101 chips have 36MHz
const
  MaxCPUFrequency=36000000;
{$elseif defined(stm32f102) }
// All f102 chips have 48MHz
const
  MaxCPUFrequency=48000000;
{$elseif defined(stm32f103) or defined(stm32f105_107)}
// All f103/5/7 chips have 72MHz
const
  MaxCPUFrequency=72000000;
{$else}
  {$error Unknown Chip, please check mbf.boards.stm32f1.inc and then define maximum CPU Frequency here}
{$endif}

const
  HSIClockFrequency = 8000000;
  LSIClockFreq = 40000;
  LSEClockFreq = 32768;

var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;

type
  TClockType = (HSI,HSE,PLLHSI,PLLHSE);

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
    function GetAPB2PeripheralClockFrequency : longWord;
    function GetAPB2TimerClockFrequency : longWord;
    procedure SetCPUFrequency(const Value: longWord; aClockType : TClockType = TClockType.PLLHSI);
    function GetCPUFrequency : longWord;
    function getMaxCPUFrequency : longWord;
    procedure DisableJTAGInterface;
    procedure DisableJTAGandSWDInterface;
    procedure EnableJTAGandSWDInterface;
    procedure EnableSWDInterface;
  end;

var
  SystemCore : TSystemCore;

implementation

uses
  cortexm3,MBF.BitHelpers;

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
    %01:  //HSE used as system clock
        Result := HSEClockFrequency;
    %10:  //PLL used as system clock;
        begin
          if getBit(RCC.CFGR,16) = 0 then
            Result := HSIClockFrequency div 2
          else
          begin
            {$if defined(STM32F105_107)}
              Result := HSEClockFrequency div (getNibble(RCC.CFGR2,0)+1);
            {$else}
              Result := HSEClockFrequency div longWord(getBit(RCC.CFGR,17)+1);
            {$endif}
          end;
          {$if defined(STM32F105_107)}
            if getNibble(RCC.CFGR,18) = %1101 then
              Result := (Result * 13) div 2
            else
              Result := Result * (getNibble(RCC.CFGR,18) + 2);
          {$else}
            temp := getNibble(RCC.CFGR,18) + 2;
            if temp > 16 then temp := 16;
              Result := Result * temp;
          {$endif}
        end;
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

function TSTM32SystemCore.GetAPB2PeripheralClockFrequency : longWord;
begin
  Result := GetHCLKFrequency div APBDividers[getBitsMasked(RCC.CFGR,%111 shl 11,11)];
end;

function TSTM32SystemCore.GetAPB2TimerClockFrequency : longWord;
begin
    if APBDividers[getBitsMasked(RCC.CFGR,%111 shl 11,11)] = 1 then
      Result := GetAPB1PeripheralClockFrequency
    else
      Result := GetAPB1PeripheralClockFrequency shl 1;
end;

procedure TSTM32SystemCore.Initialize;
begin
  DisableJTAGInterface;
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
  PREDIVMin,PREDIVMax,SysClockFrequency,PLLInFrequency,PLLOutFrequency,HCLKFrequency,MaxVCOFrequency : longWord;
begin
  Result.Frequency := 0;
  MaxVCOFrequency := 72000000;

  LastError := aHCLKFrequency;

  //if (aClockType = TClockType.HSI) or (aClockType = TClockType.PLLHSI) then
  //  SysClockFrequency := HSIClockFrequency
  //else
  //  SysClockFrequency := HSEClockFrequency;

  case aClockType of
    TClockType.HSI,
    TClockType.HSE:
    begin
      if (aClockType = TClockType.HSI) then
        SysClockFrequency := HSIClockFrequency
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
        SysClockFrequency := HSIClockFrequency div 2;
        PREDIVMin := 0;
        PREDIVMax := 0;
      end
      else
      begin
        SysClockFrequency := HSEClockFrequency;
        {$if defined(STM32F105_107)}
          PREDIVMin := 0;
          PREDIVMax := 15;
        {$else}
          PREDIVMin := 0;
          PREDIVMax := 1;
        {$endif}
      end;

      for PREDIV := PREDIVMin to PREDIVMax do
      begin
        PLLInFrequency := SysClockFrequency div longWord(PREDIV+1);
        if (PLLInFrequency >=4000000) and (PLLInFrequency <=25000000) then
        begin
          {$if defined(STM32F105_107)}
          for PLLN := 4 to 10 do
          {$else}
          for PLLN := 2 to 15 do
          {$endif}
          begin
            {$if defined(STM32F105_107)}
            if PLLN = 10 then
              PLLOUTFrequency := (PLLInFrequency * 13) div 2;
            else
            {$endif}
            PLLOUTFrequency := PLLInFrequency * PLLN;
            if PLLOUTFrequency <= MaxVCOFrequency then
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
                  {$if defined(STM32F105_107)}
                  if PLLN = 10 then
                    Result.PLLN := %1101
                  else
                    Result.PLLN := PLLN-2;
                  {$else}
                  Result.PLLN := PLLN-1;
                  {$endif}
                  Result.AHBPRE := AHBPRE;
                  Result.USBPRE := -1;
                  if (PLLOUTFrequency = 48000000) then
                    Result.USBPRE := 0;
                  if (PLLOUTFrequency = 72000000) then
                    Result.USBPRE := 1;
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

  WaitStates := 0;
  if Params.Frequency >= 24000000 then
    WaitStates := 1;
  if Params.Frequency >= 48000000 then
    WaitStates := 2;

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

  //Set Prescaler
  SetNibble(RCC.CFGR,Params.AHBPRE,4);
  repeat
  until GetNibble(RCC.CFGR,4) = Params.AHBPRE;

  //Configure APB1 (slow) clock
  if Params.FREQUENCY >= 36000000 then
  begin
    SetBitsMasked(RCC.CFGR,%100,%111 shl 8,8);
    repeat
    until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = %100;
  end
  else
  begin
    SetBitsMasked(RCC.CFGR,%000,%111 shl 8,8);
    repeat
    until GetBitsMasked(RCC.CFGR,%111 shl 8,8) = %000;
  end;

  //Configure APB2 (fast) clock
  SetBitsMasked(RCC.CFGR,%000,%111 shl 11,11);
  repeat
  until GetBitsMasked(RCC.CFGR,%111 shl 11,11) = %111;

  case aClockType of
    TClockType.HSI :
    begin
      SetCrumb(RCC.CFGR,byte(TClockType.HSI),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSI);
    end;
    TClockType.HSE :
    begin
      SetBit(RCC.CR,16);
      WaitBitIsSet(RCC.CR,17);
      {$if defined(STM32F105_107)}
        SetNibble(RCC.CFGR2,Params.PREDIV,0);
      {$else}
        SetBitValue(RCC.CFGR,Params.PREDIV,17);
      {$endif}
      SetNibble(RCC.CFGR,Params.AHBPRE,4);

      SetCrumb(RCC.CFGR,byte(TClockType.HSE),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSE);
    end
    else
    begin
      SetNibble(RCC.CFGR,Params.PLLN,18);
      //Set PLL Source
      if aClockType = TClockType.PLLHSI then
      begin
        ClearBit(RCC.CFGR,16);
      end
      else
      begin
        {$if defined(STM32F105_107)}
          SetNibble(RCC.CFGR2,Params.PREDIV,0);
        {$else}
        SetBitValue(RCC.CFGR,Params.PREDIV,17);
        {$endif}
        SetBit(RCC.CFGR,16);
        WaitBitIsSet(RCC.CR,17);
        {$if defined(STM32F105_107)}
        SetNibble(RCC.CFGR2,Params.PREDIV,0);
        {$else}
        SetBitValue(RCC.CFGR,Params.PREDIV,17);
        {$endif}
        SetNibble(RCC.CFGR,Params.AHBPRE,4);
      end;

      //PLLON Enable PLL
      SetBit(RCC.CR,24);

      //PLLRDY Wait for PLL to lock
      WaitBitIsSet(RCC.CR,25);

      //Enable PLL
      SetCrumb(RCC.CFGR,byte(TClockType.PLLHSI),0);

      //Wait for PLL Switch
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.PLLHSI);
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

procedure TSTM32SystemCore.DisableJTAGInterface;
begin
  //Enable AFIO Clock
  SetBit(RCC.APB2ENR,0);
  SetBitsMasked(AFIO.MAPR,%010,%111 shl 24,24)
end;

procedure TSTM32SystemCore.DisableJTAGandSWDInterface;
begin
  //Enable AFIO Clock
  SetBit(RCC.APB2ENR,0);
  SetBitsMasked(AFIO.MAPR,%100,%111 shl 24,24)
end;

procedure TSTM32SystemCore.EnableSWDInterface;
begin
  //Enable AFIO Clock
  SetBit(RCC.APB2ENR,0);
  SetBitsMasked(AFIO.MAPR,%010,%111 shl 24,24)
end;

procedure TSTM32SystemCore.EnableJTAGandSWDInterface;
begin
  //Enable AFIO Clock
  SetBit(RCC.APB2ENR,0);
  SetBitsMasked(AFIO.MAPR,%000,%111 shl 24,24)
end;

{$ENDREGION}

begin
end.
