unit mbf.stm32l4.systemcore;
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

  STM32L4x5 and STM32L4x6 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00083560.pdf

  STM32L4x1 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00149427.pdf

  STM32L41xxx42xxx43xxx44xxx45xxx46xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00151940.pdf

  STM32L4Rxxx and STM32L4Sxxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00310109.pdf
}

interface

{$INCLUDE MBF.Config.inc}

{$DEFINE INTERFACE}
{$INCLUDE MBF.ARM.SystemCore.inc}
{$UNDEF INTERFACE}

{$define has_hsi48}
{$if defined(stm32l471xx) or defined(stm32l475xx)  or defined(stm32l476xx)
  or defined(stm32l85xx) or defined(stm32l85xx) }
  {$undefine has_hsi48}
{$endif}

{$if defined(stm32l4) }
// All l4 chips have 80MHz
const
  MaxCPUFrequency=80000000;
{$else}
  {$error Unknown Chip, please check mbf.boards.stm32l4.inc and then define maximum CPU Frequency here}
{$endif}

const
  HSIClockFrequency = 16000000;
  HSI48ClockFrequency = 48000000;
  LSIClockFreq = 40000;
  LSEClockFreq = 32768;
  MSIClockFrequency=4000000;

  MSIRange : array[0..11] of longWord = ( 100000,  200000,  400000,  800000,
                                         1000000, 2000000, 4000000, 8000000,16000000,24000000,32000000,48000000 );
  AHBPREFactors : array[0..15] of word = (1,1,1,1,1,1,1,1,2,4,8,16,64,128,256,512);

var
  HSEClockFrequency : longWord = 0;
  XTALRTCFreq : longword = 32768;

type
  TClockType = (HSI,HSE,
                MSI100K,MSI200k,MSI400K,MSI800K,MSI1M,MSI2M,MSI4M,MSI8M,MSI16M,MSI24M,MSI32M,MSI48M,
                PLLHSI,PLLHSE,
                PLLMSI4M,PLLMSI8M,PLLMSI16M,PLLMSI24M,PLLMSI32M,PLLMSI48M);

  TSTM32SystemCore = record helper for TSystemCore
  type
    TOSCParameters = record
    FREQUENCY : longWord;
    PLLM : byte;
    PLLN : byte;
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
    function GetHSIClockFrequency: longWord;
    function GetAPB1PeripheralClockFrequency : longWord;
    function GetAPB1TimerClockFrequency : longWord;
    function GetAPB2PeripheralClockFrequency : longWord;
    function GetAPB2TimerClockFrequency : longWord;
    procedure SetCPUFrequency(const Value: longWord; aClockType : TClockType = TClockType.PLLMSI4M);
    function GetCPUFrequency : longWord;
    function getMaxCPUFrequency : longWord;
  end;

var
  SystemCore : TSystemCore;

implementation

{$IF DEFINED(CortexM0)}
uses
  cortexm0;
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

procedure TSTM32SystemCore.Initialize;
begin
  ConfigureSystem;
  ConfigureTimer;
end;

function TSTM32SystemCore.GetSysTickClockFrequency : longWord; [public, alias: 'MBF_GetSysTickClockFrequency'];
begin
  Result := GetHCLKFrequency;
end;

function TSTM32SystemCore.GetHSIClockFrequency : longWord;
begin
  Result := HSIClockFrequency;
end;

function TSTM32SystemCore.GetAPB1PeripheralClockFrequency : longWord;
var
  divider : byte;
begin
  divider := (RCC.CFGR shr 8) and $07;
  if Divider < 4 then
    Result := GetHCLKFrequency
  else
    Result := GetHCLKFrequency div longWord(2 shl (divider and $03));
end;

function TSTM32SystemCore.GetAPB1TimerClockFrequency : longWord;
begin
    if ((RCC.CFGR shr 8) and $07) < 4 then
      Result := GetAPB1PeripheralClockFrequency
    else
      Result := GetAPB1PeripheralClockFrequency shl 1;
end;

function TSTM32SystemCore.GetAPB2PeripheralClockFrequency : longWord;
var
  divider : byte;
begin
  divider := (RCC.CFGR shr 11) and $07;
  if Divider < 4 then
    Result := GetHCLKFrequency
  else
    Result := GetHCLKFrequency div longWord(2 shl (divider and $03));
end;

function TSTM32SystemCore.GetAPB2TimerClockFrequency : longWord;
begin
    if ((RCC.CFGR shr 11) and $07) < 4 then
      Result := GetAPB1PeripheralClockFrequency
    else
      Result := GetAPB1PeripheralClockFrequency shl 1;
end;

procedure TSTM32SystemCore.ConfigureSystem;
{$NOTES OFF}
var
  dummy : longWord;
begin
  //PWR Enable PWR Subsystem Clock
  RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 28);
  //Read back value for a short delay
  dummy := RCC.APB1ENR1 and (1 shl 28);
  //Seems nothing to do here...
end;
{$NOTES ON}

function TSTM32SystemCore.getFrequencyParameters(aHCLKFrequency : longWord;aClockType : TClockType):TOSCParameters;
var
  PLLM : byte;
  PLLN : byte;
  PLLR : byte;
  AHBPRE : byte;
  LastError : longWord;
  PREDIVMin,PREDIVMax,OSCCLOCK,PLLInFrequency,PLLOutFrequency,HCLKFrequency : longWord;
begin
  Result.Frequency := 0;
  LastError := aHCLKFrequency;

  case aClockType of
     TClockType.HSI,TClockType.PLLHSI:
         OSCCLOCK := HSIClockFrequency;
     TClockType.MSI100k:
         OSCCLOCK := 100000;
     TClockType.MSI200k:
         OSCCLOCK := 200000;
     TClockType.MSI400k:
         OSCCLOCK := 400000;
     TClockType.MSI800k:
         OSCCLOCK := 800000;
     TClockType.MSI1M:
         OSCCLOCK := 1000000;
     TClockType.MSI2M:
         OSCCLOCK := 2000000;
     TClockType.MSI4M,TClockType.PLLMSI4M:
         OSCCLOCK := 4000000;
     TClockType.MSI8M,TClockType.PLLMSI8M:
         OSCCLOCK := 8000000;
     TClockType.MSI16M,TClockType.PLLMSI16M:
         OSCCLOCK := 16000000;
     TClockType.MSI24M,TClockType.PLLMSI24M:
         OSCCLOCK := 24000000;
     TClockType.MSI32M,TClockType.PLLMSI32M:
         OSCCLOCK := 32000000;
     TClockType.MSI48M,TClockType.PLLMSI48M:
         OSCCLOCK := 48000000;
  else
    OSCCLOCK := HSEClockFrequency;
  end;

  case aClockType of
    TClockType.HSI,
    TClockType.MSI100k,
    TClockType.MSI200k,
    TClockType.MSI400k,
    TClockType.MSI800k,
    TClockType.MSI1M,
    TClockType.MSI2M,
    TClockType.MSI4M,
    TClockType.MSI8M,
    TClockType.MSI16M,
    TClockType.MSI24M,
    TClockType.MSI32M,
    TClockType.MSI48M,
    TClockType.HSE:
    begin
      Result.AHBPRE := 15;
      for AHBPRE := 0 to 15 do
      begin
        HCLKFrequency := OSCCLOCK div longWord(AHBPREFactors[AHBPRE]);
        if HCLKFrequency <= aHCLKFrequency then
        begin
          Result.AHBPRE := AHBPRE;
          break;
        end;
      end;
      Result.Frequency := OSCCLOCK div longWord(AHBPREFactors[Result.AHBPRE]);
    end;
  else
    begin
      PREDIVMin := 0;
      PREDIVMax := 7;

      for PLLM := PREDIVMin to PREDIVMax do
      begin
        PLLInFrequency := OSCCLOCK div longWord(PLLM+1);
        if (PLLInFrequency >=4000000) and (PLLInFrequency <=16000000) then
        begin
          for PLLN := 8 to 86 do
          begin
            for PLLR := 0 to 3 do
            begin
              PLLOUTFrequency := PLLInFrequency * PLLN div (PLLR * 2 + 2);
              if (PLLOUTFrequency <= MaxCPUFrequency) then
              begin
                for AHBPRE := 0 to 15 do
                begin
                  HCLKFrequency := PLLOutFrequency div longWord(AHBPREFactors[AHBPRE]);
                  if LastError >= Abs(aHCLKFrequency-HCLKFrequency) then
                  begin
                    LastError := Abs(aHCLKFrequency-HCLKFrequency);
                    Result.Frequency := HCLKFrequency;
                    Result.PLLM := PLLM;
                    Result.PLLN := PLLN;
                    Result.PLLR := PLLR;
                    Result.AHBPRE := AHBPRE;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TSTM32SystemCore.GetHCLKFrequency : longWord;
var
  temp : longWord;
begin
  temp := (RCC.CFGR shr 4) and %1111;
  Result := getSYSCLKFrequency div longWord(AHBPREFactors[temp]);
end;

function TSTM32SystemCore.GetSYSCLKFrequency : longWord;
var
  temp : longWord;
begin
  case (RCC.CFGR shr 2) and %11 of
    0:  //MSI used as system clock
        Result := MSIRange[(RCC.CR shr 4) and %1111];
    1:  //HSI used as system clock
        Result := HSIClockFrequency;
    2:  //HSE used as System clock
        Result := HSEClockFrequency;
    3:  //PLL used as system clock;
        begin
          case RCC.PLLCFGR and %11 of
            0: Result := 0;
            1: Result := MSIRange[(Rcc.CR shr 4) and %1111];
            2: Result := HSIClockFrequency;
            3: Result := HSEClockFrequency;
          end;
          temp := ((RCC.PLLCFGR shr 4) and %111)+1;
          Result := Result div temp;
          temp := (RCC.PLLCFGR shr 8) and %1111111;
          if temp > 86 then temp := 86;
          Result := Result * temp;
          temp := (RCC.PLLCFGR shr 25 and %11)*2+2;
          Result := Result div temp;
        end;
  end;
end;

procedure TSTM32SystemCore.SetCPUFrequency(const Value: longWord; aClockType : TClockType = TClockType.PLLMSI4M);
var
  dummy : longWord;
  Params : TOscParameters;
begin
  //Set Waitstates to a save value
  FLASH.ACR := (%1 shl 8) or (%1 shl 9) or (%1 shl 10) or %100;

  //Make sure that MSI Clock is enabled
  if RCC.CR and (1 shl 0) = 0 then
    RCC.CR := RCC.CR or (1 shl 0);

  //Wait for MSI Clock to be stable
  while (RCC.CR and (1 shl 1)) = 0 do
    ;

  case aClockType of
    TClockType.MSI100k,
    TClockType.MSI200k,
    TClockType.MSI400k,
    TClockType.MSI800k,
    TClockType.MSI1M,
    TClockType.MSI2M,
    TClockType.MSI4M,
    TClockType.MSI8M,
    TClockType.MSI16M,
    TClockType.MSI24M,
    TClockType.MSI32M,
    TClockType.MSI48M:
        begin
          dummy := longWord(aClockType)-longWord(TClockType.MSI100k);
          RCC.CR := (RCC.CR and not (%1111 shl 4)) or (dummy shl 4);
        end;
    TClockType.PLLMSI4M,
    TClockType.PLLMSI8M,
    TClockType.PLLMSI16M,
    TClockType.PLLMSI24M,
    TClockType.PLLMSI32M,
    TClockType.PLLMSI48M:
    begin
      dummy := longWord(aClockType)-longWord(TClockType.PLLMSI4M)+(longWord(TClockType.MSI4M)-longWord(TClockType.MSI100k));
      RCC.CR := (RCC.CR and not (%1111 shl 4)) or (dummy shl 4);
    end;
  end;

  //Wait for MSI Clock to be stable
  while (RCC.CR and (1 shl 1)) = 0 do
    ;

  // Switch to MSI Clock
  if (RCC.CFGR and (%11 shl 2)) <> 0 then
    RCC.CFGR := RCC.CFGR and not (%11 shl 0);

  //Wait until MSI Clock is activated
  while (RCC.CFGR  and (%11 shl 2)) <> 0 do
    ;

  //PLLON Disable PLL if active
  if RCC.CR and (1 shl 24) <> 0 then
  begin
    RCC.CR := RCC.CR and (not (1 shl 24));

    //PLLRDY Wait for PLL to shut down
    while (RCC.CR and (1 shl 25)) <> 0 do
      ;
  end;

  Params := getFrequencyParameters(Value,aClockType);

  case aClockType of
    TClockType.MSI100k,
    TClockType.MSI200k,
    TClockType.MSI400k,
    TClockType.MSI800k,
    TClockType.MSI1M,
    TClockType.MSI2M,
    TClockType.MSI4M,
    TClockType.MSI8M,
    TClockType.MSI16M,
    TClockType.MSI24M,
    TClockType.MSI32M,
    TClockType.MSI48M,
    TClockType.HSI,
    TClockType.HSE :
    begin
      Rcc.CFGR := (RCC.CFGR and not (%1111 shl 4)) or (Params.AHBPRE shl 4);
      //Turn off PLL Clock Output to save power
      RCC.PLLCFGR := RCC.PLLCFGR and (not (%1 shl 24))
    end
    else
    begin
      //Use PLL
      RCC.PLLCFGR := (RCC.PLLCFGR and (not (%111 shl 4))) or (Params.PLLM shl 4);

      RCC.PLLCFGR := (RCC.PLLCFGR and not (%1111111 shl 8)) or (Params.PLLN shl 8);
      RCC.PLLCFGR := (RCC.PLLCFGR and not (%11 shl 25)) or (Params.PLLR shl 25);
      //Set PLL Source
      if aClockType = TClockType.PLLHSI then
      RCC.PLLCFGR := RCC.PLLCFGR and not (%11 shl 0) or (%10 shl 0)
      else if aClockType = TClockType.PLLHSE then
        RCC.CFGR := (RCC.CFGR and not (%11 shl 0)) or (%11 shl 0)
      else
        RCC.PLLCFGR := RCC.PLLCFGR and not (%11 shl 0) or (%01 shl 0);

      //Enable PLL Clock Output
      RCC.PLLCFGR := RCC.PLLCFGR or (%1 shl 24);

      //Set Prescaler
      RCC.CFGR := (RCC.CFGR and not (%1111 shl 4)) or (Params.AHBPRE shl 4);

      //Set PLL Source
      RCC.PLLCFGR := RCC.PLLCFGR and (not (%11)) or %01;

      //Configure APB1 clock
      RCC.CFGR := (RCC.CFGR and not (%111 shl 8)) or (%000 shl 8);
      //Configure APB2 clock
      RCC.CFGR := (RCC.CFGR and not (%111 shl 11)) or (%000 shl 11);

      //PLLON Enable PLL
      RCC.CR := RCC.CR or (1 shl 24);

      //PLLRDY Wait for PLL to lock
      while (RCC.CR and (1 shl 25)) = 0 do
        ;

      //Enable PLL
      RCC.CFGR := RCC.CFGR and (not (%11)) or %11;

      //Wait for PLL Switch
      while RCC.CFGR and (%11 shl 2) <> (%11 shl 2) do
        ;
    end;
  end;
  //Set Flash Waitstates
  //Zero Waitstate Instruction+Data Cache enabled
  if Params.Frequency <= 16000000 then
    FLASH.ACR := (%1 shl 9) or (%1 shl 10) or %000;
  //One Waitstate Prefetch+Instruction+Data Cache enabled
  if Params.Frequency <= 32000000 then
    FLASH.ACR := (%1 shl 8) or (%1 shl 9)  or (%1 shl 10) or %001;
  //Two Waitstates Prefetch+Instruction+Data Cache enabled
  if Params.Frequency <= 48000000 then
    FLASH.ACR := (%1 shl 8) or (%1 shl 9) or (%1 shl 10) or %010;
  //Three Waitstates Prefetch+Instruction+Data Cache enabled
  if Params.Frequency <= 64000000 then
    FLASH.ACR := (%1 shl 8) or (%1 shl 9) or (%1 shl 10) or %011;
  //Four Waitstates Prefetch+Instruction+Data Cache enabled
  if Params.Frequency > 64000000 then
    FLASH.ACR := (%1 shl 8) or (%1 shl 9) or (%1 shl 10) or %100;

  //Read Register to activate
  {$NOTES OFF}
  dummy := FLASH.ACR;
  {$NOTES ON}


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
