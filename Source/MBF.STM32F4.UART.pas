unit mbf.stm32f4.uart;
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

  STM32F405415, STM32F407417, STM32F427437 and STM32F429439 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00031020.pdf

  STM32F401xBC and STM32F401xDE advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00096844.pdf

  STM32F411xCE advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00119316.pdf

  STM32F446xx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00135183.pdf

  STM32F469xx and STM32F479xx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00127514.pdf

  STM32F410 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00180366.pdf

  STM32F412 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00180369.pdf

  STM32F413423 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00305666.pdf
}

interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32F4.SystemCore,
  MBF.STM32F4.GPIO;

type
  TUART_Registers = TUSART_Registers;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeOut=10000;
type
    TUARTRXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_USART2) and defined(has_gpioa)}, PA3_USART2  = ALT7 or TNativePin.PA3 {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },   D0_UART   = ALT7 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },   DEBUG_UART= ALT7 or TNativePin.PA3  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA10_USART1 = ALT7 or TNativePin.PA10 {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)}, PB3_USART1  = ALT7 or TNativePin.PB3 {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)}, PB7_USART1  = ALT7 or TNativePin.PB7 {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB11_USART3 = ALT7 or TNativePin.PB11 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC5_USART3  = ALT7 or TNativePin.PC5 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC11_USART3 = ALT7 or TNativePin.PC11 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)}, PD6_USART2  = ALT7 or TNativePin.PD6 {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)}, PD9_USART3  = ALT7 or TNativePin.PD9 {$endif}
    {$if defined(has_UART4) and defined(has_gpioa)}, PA1_UART4    = ALT8 or TNativePin.PA1 {$endif}
    {$if defined(has_UART7) and defined(has_gpioa)}, PA8_UART7    = ALT8 or TNativePin.PA8 {$endif}
    {$if defined(has_USART6) and defined(has_gpioa)}, PA12_USART6 = ALT8 or TNativePin.PA12 {$endif}
    {$if defined(has_UART7) and defined(has_gpiob)}, PB3_UART7    = ALT8 or TNativePin.PB3 {$endif}
    {$if defined(has_USART6) and defined(has_gpioc)}, PC7_USART6  = ALT8 or TNativePin.PC7 {$endif}
    {$if defined(has_UART4) and defined(has_gpioc)}, PC11_UART4   = ALT8 or TNativePin.PC11 {$endif}
    {$if defined(has_UART5) and defined(has_gpiod)}, PD2_UART5    = ALT8 or TNativePin.PD2 {$endif}
    {$if defined(has_UART8) and defined(has_gpioe)}, PE0_UART8    = ALT8 or TNativePin.PE0 {$endif}
    {$if defined(has_UART5) and defined(has_gpioe)}, PE7_UART5    = ALT8 or TNativePin.PE7 {$endif}
    {$if defined(has_UART7) and defined(has_gpioe)}, PE7_UART7    = ALT8 or TNativePin.PE7 {$endif}
    {$if defined(has_UART7) and defined(has_gpiof)}, PF6_UART7    = ALT8 or TNativePin.PF6 {$endif}
    {$if defined(has_UART8) and defined(has_gpiof)}, PF8_UART8    = ALT8 or TNativePin.PF8 {$endif}
    {$if defined(has_USART6) and defined(has_gpiog)}, PG9_USART6  = ALT8 or TNativePin.PG9 {$endif}
    {$if defined(has_UART4) and defined(has_gpioa)}, PA11_UART4   = ALT11 or TNativePin.PA11 {$endif}
    {$if defined(has_UART5) and defined(has_gpiob)}, PB5_UART5    = ALT11 or TNativePin.PB5 {$endif}
    {$if defined(has_UART5) and defined(has_gpiob)}, PB8_UART5    = ALT11 or TNativePin.PB8 {$endif}
    {$if defined(has_UART5) and defined(has_gpiob)}, PB12_UART5   = ALT11 or TNativePin.PB12 {$endif}
    {$if defined(has_UART4) and defined(has_gpiod)}, PD0_UART4    = ALT11 or TNativePin.PD0 {$endif}
    {$if defined(has_UART9) and defined(has_gpiod)}, PD14_UART9   = ALT11 or TNativePin.PD14 {$endif}
    {$if defined(has_UART10) and defined(has_gpioe)}, PE2_UART10  = ALT11 or TNativePin.PE2 {$endif}
    {$if defined(has_UART9) and defined(has_gpiog)}, PG0_UART9    = ALT11 or TNativePin.PG0 {$endif}
    {$if defined(has_UART10) and defined(has_gpiog)}, PG11_UART10 = ALT11 or TNativePin.PG11 {$endif}
  );
  TUARTTXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_USART2) and defined(has_gpioa)}, PA2_USART2  = ALT7 or TNativePin.PA2 {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },   D1_UART   = ALT7 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },   DEBUG_UART= ALT7 or TNativePin.PA2  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA9_USART1  = ALT7 or TNativePin.PA9 {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA15_USART1 = ALT7 or TNativePin.PA15 {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)}, PB6_USART1  = ALT7 or TNativePin.PB6 {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB10_USART3 = ALT7 or TNativePin.PB10 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC10_USART3 = ALT7 or TNativePin.PC10 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)}, PD5_USART2  = ALT7 or TNativePin.PD5 {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)}, PD8_USART3  = ALT7 or TNativePin.PD8 {$endif}
    {$if defined(has_UART4) and defined(has_gpioa)}, PA0_UART4    = ALT8 or TNativePin.PA0 {$endif}
    {$if defined(has_USART6) and defined(has_gpioa)}, PA11_USART6 = ALT8 or TNativePin.PA11 {$endif}
    {$if defined(has_UART7) and defined(has_gpioa)}, PA15_UART7   = ALT8 or TNativePin.PA15 {$endif}
    {$if defined(has_UART7) and defined(has_gpiob)}, PB4_UART7    = ALT8 or TNativePin.PB4 {$endif}
    {$if defined(has_USART6) and defined(has_gpioc)}, PC6_USART6  = ALT8 or TNativePin.PC6 {$endif}
    {$if defined(has_UART4) and defined(has_gpioc)}, PC10_UART4   = ALT8 or TNativePin.PC10 {$endif}
    {$if defined(has_UART5) and defined(has_gpioc)}, PC12_UART5   = ALT8 or TNativePin.PC12 {$endif}
    {$if defined(has_UART4) and defined(has_gpiod)}, PD10_UART4   = ALT8 or TNativePin.PD10 {$endif}
    {$if defined(has_UART8) and defined(has_gpioe)}, PE1_UART8    = ALT8 or TNativePin.PE1 {$endif}
    {$if defined(has_UART5) and defined(has_gpioe)}, PE8_UART5    = ALT8 or TNativePin.PE8 {$endif}
    {$if defined(has_UART7) and defined(has_gpioe)}, PE8_UART7    = ALT8 or TNativePin.PE8 {$endif}
    {$if defined(has_UART7) and defined(has_gpiof)}, PF7_UART7    = ALT8 or TNativePin.PF7 {$endif}
    {$if defined(has_UART8) and defined(has_gpiof)}, PF9_UART8    = ALT8 or TNativePin.PF9 {$endif}
    {$if defined(has_USART6) and defined(has_gpiog)}, PG14_USART6 = ALT8 or TNativePin.PG14 {$endif}
    {$if defined(has_UART4) and defined(has_gpioa)}, PA12_UART4   = ALT11 or TNativePin.PA12 {$endif}
    {$if defined(has_UART5) and defined(has_gpiob)}, PB6_UART5    = ALT11 or TNativePin.PB6 {$endif}
    {$if defined(has_UART5) and defined(has_gpiob)}, PB9_UART5    = ALT11 or TNativePin.PB9 {$endif}
    {$if defined(has_UART5) and defined(has_gpiob)}, PB13_UART5   = ALT11 or TNativePin.PB13 {$endif}
    {$if defined(has_UART4) and defined(has_gpiod)}, PD1_UART4    = ALT11 or TNativePin.PD1 {$endif}
    {$if defined(has_UART9) and defined(has_gpiod)}, PD15_UART9   = ALT11 or TNativePin.PD15 {$endif}
    {$if defined(has_UART10) and defined(has_gpioe)}, PE3_UART10  = ALT11 or TNativePin.PE3 {$endif}
    {$if defined(has_UART9) and defined(has_gpiog)}, PG1_UART9    = ALT11 or TNativePin.PG1 {$endif}
    {$if defined(has_UART10) and defined(has_gpiog)}, PG12_UART10 = ALT11 or TNativePin.PG12 {$endif}
  );

{$ENDREGION}

  TUARTBitsPerWord = (
    Eight = %0,
    Nine = %1
  );

  TUARTParity = (
    None = %00,
    Even = %10,
    Odd  = %11
  );

  TUARTStopBits = (
    One=%00,
    ZeroDotFive=%01,
    Two=%10,
    OndDotFive=%11
  );

  TUARTClockSource = (
    APB1orAPB2 = %0
  );

  TUARTRegistersHelper = record helper for TUART_Registers
  private
    function  GetBaudRate: longWord;
    procedure SetBaudRate(const aBaudrate: longWord);
    function  GetBitsPerWord: TUARTBitsPerWord;
    procedure SetBitsPerWord(const aBitsPerWord: TUARTBitsPerWord);
    function  GetParity: TUARTParity;
    procedure SetParity(const aParity: TUARTParity);
    function  GetStopBits: TUARTStopBits;
    procedure SetStopBits(const aStopbit: TUARTStopBits);
    function  GetClockSource : TUARTClockSource;
    procedure SetClockSource(const aClockSource : TUARTClockSource);

  public
    procedure initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins;aBaudRate : longWord = 115200);
    function Disable : boolean;
    procedure Enable;

    property BaudRate : longWord read getBaudRate write setBaudRate;
    property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
    property Parity : TUARTParity read getParity write setParity;
    property StopBits : TUARTStopBits read getStopBits write setStopBits;
    property ClockSource : TUARTClockSource read getClockSource write setClockSource;

    procedure WaitForTXReady; inline;
    procedure WaitForRXReady; inline;

    function  WaitForTXReady(EndTime : TMilliSeconds):boolean; inline;
    function  WaitForRXReady(EndTime : TMilliSeconds):boolean; inline;

    procedure WriteDR(const Value : byte); inline;
    function ReadDR:byte; inline;
    {$DEFINE INTERFACE}
    {$I MBF.STM32.UART.inc}
    {$UNDEF INTERFACE}
  end;

{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART2_BASE;
  DEBUG_UART : TUART_Registers absolute USART2_BASE;
  {$ELSEIF DEFINED(discovery)}
var
  UART : TUART_Registers absolute USART2_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.STM32.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.BitHelpers;

function TUARTRegistersHelper.getClockSource : TUARTClockSource;
begin
  //No choice on STM32F401 family
  Result := TUARTClockSource.APB1orAPB2;
end;

procedure TUARTRegistersHelper.setClockSource(const aClockSource : TUARTClockSource);
begin
  //No choice on STM32F401 family
end;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins; aBaudRate : longWord = 115200);
begin
  case longWord(@Self) of
    USART1_BASE : RCC.APB2ENR := RCC.APB2ENR or (1 shl 4);
    USART2_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 17);
    {$ifdef has_usart3}USART3_BASE : setBit(RCC.APB1ENR,18);{$endif}
    {$ifdef has_uart4} UART4_BASE  : setBit(RCC.APB1ENR,19);{$endif}
    {$ifdef has_uart5} UART5_BASE  : setBit(RCC.APB1ENR,20);{$endif}
    {$ifdef has_usart6}USART6_BASE : setBit(RCC.APB2ENR,5);{$endif}
    {$ifdef has_uart7} UART7_BASE  : setBit(RCC.APB1ENR,30);{$endif}
    {$ifdef has_uart8} UART8_BASE  : SetBit(RCC.APB1ENR,31);{$endif}
    {$ifdef has_uart9} UART9_BASE  : setBit(RCC.APB2ENR,6);{$endif}
    {$ifdef has_uart10}UART10_BASE : setBit(RCC.APB2ENR,7);{$endif}
  end;
  // First, load Reset Value, this also turns off the UART
  // Create the basic config for all n81 use cases
  self.CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  self.CR2:= 0;

  // Set Defaults not RTS/CTS
  self.CR3:= 0;

  setBit(self.CR1,2);
  setBit(self.CR1,3);

  SetBaudRate(DefaultUARTBaudrate);
  GPIO.PinMode[longWord(aRxPin) and $ff] := TPinMode((longWord(aRxPin) shr 8));
  GPIO.PinMode[longWord(aTxPin) and $ff] := TPinMode((longWord(aTxPin) shr 8));
  Enable;
end;

function TUARTRegistersHelper.Disable:boolean;
begin
  Result := GetBit(self.CR1,13) > 0;
  ClearBit(self.CR1,13);
end;

procedure TUARTRegistersHelper.Enable;
begin
  SetBit(self.CR1,13);
end;

function TUARTRegistersHelper.GetBaudRate: longWord;
var
  ClockFreq : longWord;
begin
  case longWord(@self) of
    USART1_BASE : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;
    USART2_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
    {$ifdef has_usart3}USART3_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart4} UART4_BASE  : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart5} UART5_BASE  : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_usart6}USART6_BASE : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
    {$ifdef has_uart7} UART7_BASE  : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart8} UART8_BASE  : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart9} UART9_BASE  : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
    {$ifdef has_uart10}UART10_BASE : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
  end;

  if getBit(self.CR1,15) = 0 then
    Result := ClockFreq div Self.BRR
  else
    Result := ClockFreq div((Self.BRR and $fff0) or ((Self.BRR and %111) shl 1));
end;

procedure TUARTRegistersHelper.SetBaudRate(const aBaudrate: longWord);
var
  ClockFreq,UsartDiv : longWord;
  reactivate : boolean;
begin
  // UE disable Serial interface
  reactivate := Disable;
  case longWord(@self) of
    USART1_BASE : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;
    USART2_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
    {$ifdef has_usart3}USART3_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart4} UART4_BASE  : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart5} UART5_BASE  : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_usart6}USART6_BASE : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
    {$ifdef has_uart7} UART7_BASE  : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart8} UART8_BASE  : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart9} UART9_BASE  : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
    {$ifdef has_uart10}UART10_BASE : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
  end;
  if getBit(self.CR1,15) = 0 then
  begin
    // 16x Oversampling
    self.BRR := ClockFreq div aBaudRate;
  end
  else
  begin
    // 8x Oversampling
    UsartDiv := 2*ClockFreq div aBaudRate;
    self.BRR := (UsartDiv and $fff0) or ((UsartDiv and %1111) shr 1);
  end;
    if reactivate = true then
      Enable;
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord(getBit(Self.BRR,12));
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const aBitsPerWord: TUARTBitsPerWord);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setBitValue(Self.BRR,longWord(aBitsPerWord),12);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  Result := TUARTParity(getCrumb(Self.CR1,9));
end;

procedure TUARTRegistersHelper.SetParity(const aParity: TUARTParity);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setCrumb(Self.CR1,longWord(aParity),9);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits(getCrumb(Self.CR2,12));
end;

procedure TUARTRegistersHelper.SetStopBits(const aStopbit: TUARTStopBits);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setCrumb(Self.CR2,longWord(aStopbit),12);
  if ReEnable then
    Enable;
end;

procedure TUARTRegistersHelper.WaitForTXReady; inline;
begin
  WaitBitIsSet(self.SR,7);
end;

procedure TUARTRegistersHelper.WaitForRXReady; inline;
begin
  WaitBitIsSet(self.SR,5);
end;

function TUARTRegistersHelper.WaitForTXReady(EndTime : TMilliSeconds):boolean; inline;
begin
  Result := WaitBitIsSet(self.SR,7,EndTime);
end;

function TUARTRegistersHelper.WaitForRXReady(EndTime : TMilliSeconds):boolean; inline;
begin
  Result := WaitBitIsSet(self.SR,5,EndTime);
end;

procedure TUARTRegistersHelper.WriteDR(const Value : byte); inline;
begin
  self.DR := Value;
end;

function TUARTRegistersHelper.ReadDR : byte ; inline;
begin
  Result := self.DR;
end;

{$DEFINE IMPLEMENTATION}
{$I MBF.STM32.UART.inc}
{$UNDEF IMPLEMENTATION}

{$ENDREGION}

end.

