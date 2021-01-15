unit mbf.stm32f3.systemcore;
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

  STM32F37xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00041563.pdf

  STM32F303xBCDE, STM32F303x68, STM32F328x8, STM32F358xC, STM32F398xE advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00043574.pdf

  STM32F334xx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00093941.pdf

  STM32F302xBCDE and STM32F302x68 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00094349.pdf

  STM32F301x68 and STM32F318x8 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00094350.pdf
}

interface

{$INCLUDE MBF.Config.inc}

{$DEFINE INTERFACE}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF INTERFACE}

{$if defined(stm32f3) }
// All f3 chips have 72MHz
const
  MaxCPUFrequency=72000000;
{$else}
  {$error Unknown Chip, please check mbf.boards.stm32f3.inc and then define maximum CPU Frequency here}
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
  temp : longWord;
begin
  case GetCrumb(RCC.CFGR,2) of
    %00:  //HSI used as system clock
        Result := HSIClockFrequency;
    %01:  //HSE used as system clock
        Result := HSEClockFrequency;
    %10:  //PLL used as system clock;
        begin
          {$if defined(STM32F303RD) or defined(STM32F303RE)
               or defined(STM32F303VD) or defined(STM32F303VE)
               or defined(STM32F303ZD) or defined(STM32F303ZE)
               or defined(STM32F398VE) }
          case GetCrumb(RCC.CFGR,15) of
            %00: Result := HSIClockFrequency div 2;
            %01: Result := HSIClockFrequency div (getNibble(RCC.CFGR2,0)+1);
            %10: Result := HSEClockFrequency div (getNibble(RCC.CFGR2,0)+1);
          else
            Result := 0;
          {$else}

          case GetBit(RCC.CFGR,16) of
            0: Result := HSIClockFrequency div 2;
            1: Result := HSEClockFrequency div longWord(getNibble(RCC.CFGR2,0)+1);
          end;
          {$endif}
          temp := getNibble(RCC.CFGR,18) + 2;
          if temp > 16 then temp := 16;
          Result := Result * temp;
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
  ConfigureSystem;
  ConfigureTimer;
end;

procedure TSTM32SystemCore.ConfigureSystem;
begin
  //PWR Enable PWR Subsystem Clock
  setBit(RCC.APB1ENR,28);
  //Read back value for a short delay
  getBit(RCC.APB1ENR,28);
  //Seems nothing to do here...
end;

function TSTM32SystemCore.getFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
var
  PREDIV : byte;
  PLLN : byte;
  AHBPRE : byte;
  LastError : longWord;
  PREDIVMin,PREDIVMax,SysClockFrequency,PLLInFrequency,PLLOutFrequency,HCLKFrequency : longWord;
begin
  Result.Frequency := 0;
  Result.USBPre := -1;
  LastError := aHCLKFrequency;

  if (aClockType = TClockType.HSI) or (aClockType = TClockType.PLLHSI) then
    SysClockFrequency := HSIClockFrequency
  else
    SysClockFrequency := HSEClockFrequency;

  case aClockType of
    TClockType.HSI,
    TClockType.HSE:
    begin
      Result.AHBPRE := 7;
      for AHBPRE := 0 to 7 do
      begin
        HCLKFrequency := SysClockFrequency div longWord(1 shl AHBPRE);
        if HCLKFrequency <= aHCLKFrequency then
        begin
          Result.AHBPRE := AHBPRE;
          break;
        end;
      end;
      Result.Frequency := SysClockFrequency div longWord(1 shl Result.AHBPRE);
      Result.PREDIV := 1;
    end
  else
    begin
      if aClockType = TClockType.PLLHSI then
      begin
        {$if defined(has_pllprediv)}
          PREDIVMin := 0;
          PREDIVMax := 1;
        {$else}
          PREDIVMin := 1;
          PREDIVMax := 1;
        {$endif}
      end
      else
      begin
        PREDIVMin := 0;
        PREDIVMax := 15;
      end;

      for PREDIV := PREDIVMin to PREDIVMax do
      begin
        PLLInFrequency := SysClockFrequency div longWord(PREDIV+1);
        if (PLLInFrequency >=4000000) and (PLLInFrequency <=24000000) then
        begin
          for PLLN := 2 to 16 do
          begin
            PLLOUTFrequency := PLLInFrequency * PLLN;
            if PLLOUTFrequency <= MaxCPUFrequency then
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
                  Result.PLLN := PLLN-1;
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
  WaitStates : Byte;
  Params : TOscParameters;
begin
  //Make sure that HSI Clock is enabled
  if GetBit(RCC.CR,0) = 0 then
    SetBit(RCC.CR,0);

  //Wait for HSI Clock to be stable
  WaitBitIsSet(RCC.CR,1);

  // Switch to HSI Clock
  if getCrumb(RCC.CFGR,2) <> 0 then
    setCrumb(RCC.CFGR,%00,0);

  //Wait until HSI Clock is activated
  while getCrumb(RCC.CFGR,2) <> 0 do
    ;

  //PLLON Disable PLL if active
  if getBit(RCC.CR,24) = 1 then
  begin
    clearBit(RCC.CR,24);

    //PLLRDY Wait for PLL to shut down
    WaitBitIsCleared(RCC.CR,25);
  end;

  Params := getFrequencyParameters(Value,aClockType);

  //Set Flash Waitstates
  WaitStates := 0;
  if Params.Frequency >= 24000000 then
    WaitStates := 1;
  if Params.Frequency >= 48000000 then
    WaitStates := 2;

  //Set Waitstates
  SetBitsMasked(FLASH.ACR,WaitStates,%111 shl 0,0);
  repeat
  until getBitsMasked(FLASH.ACR,%111 shl 0,0) = WaitStates;

  SetNibble(RCC.CFGR2,Params.PREDIV,0);
  repeat
  until GetNibble(RCC.CFGR2,0) = Params.PREDIV;

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

  // Set APB2 Prescaler
  SetBitsMasked(RCC.CFGR,0,%111 shl 11,11);
  repeat
  until GetBitsMasked(RCC.CFGR,%111 shl 11,11) = 0;

  case aClockType of
    TClockType.HSI :
    begin
      SetCrumb(RCC.CFGR,byte(TClockType.HSI),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = byte(TClockType.HSI);
   end;
    TClockType.HSE :
    begin
      setBit(RCC.CR,16);
      WaitBitIsSet(RCC.CR,17);
      SetCrumb(RCC.CFGR,longWord(TClockType.HSE),0);
      repeat
      until GetCrumb(RCC.CFGR,2) = longWord(TClockType.HSE);
    end
    else
    begin
      SetNibble(RCC.CFGR,Params.PLLN,18);
      //Set PLL Source
      if aClockType = TClockType.PLLHSI then
        ClearBit(RCC.CFGR,16)
      else
        SetBit(RCC.CFGR,16);

      //PLLON Enable PLL
      setBit(RCC.CR,24);

      //PLLRDY Wait for PLL to lock
      waitBitIsSet(RCC.CR,25);

      //Enable PLL
      setCrumb(RCC.CFGR,longWord(TClockType.PLLHSI),0);

      //Wait for PLL Switch
      repeat
      until GetBitsMasked(RCC.CFGR,%11 shl 2,2) = longWord(TClockType.PLLHSI);
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
