unit MBF.STM32L4.UART;
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

uses
  MBF.STM32L4.SystemCore,
  MBF.STM32L4.GPIO;

type
  TUART_Registers = TUSART_Registers;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeOut=10000;

type
  TUARTRXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_USART2) and defined(has_gpioa)}, PA15_USART2 = ALT3 or TNativePin.PA15{$endif}
    {$if defined(HAS_ARDUINOMINIPINS)              },  DEBUG_UART = ALT7 or TNativePin.PA15{$endif}
    {$if defined(has_USART2) and defined(has_gpioa)},  PA3_USART2 = ALT7 or TNativePin.PA3 {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA10_USART1 = ALT7 or TNativePin.PA10{$endif}
    {$if defined(HAS_ARDUINOMINIPINS)              },     D0_UART = ALT7 or TNativePin.PA10{$endif}
    {$if defined(HAS_ARDUINOPINS)                  },     D0_UART = ALT7 or TNativePin.PA10{$endif}
    {$if defined(HAS_ARDUINOPINS)                  },  DEBUG_UART = ALT7 or TNativePin.PA10{$endif}
    {$if defined(has_USART1) and defined(has_gpiob)},  PB7_USART1 = ALT7 or TNativePin.PB7 {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB11_USART3 = ALT7 or TNativePin.PB11{$endif}
    {$if defined(has_USART3) and defined(has_gpioc)},  PC5_USART3 = ALT7 or TNativePin.PC5 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC11_USART3 = ALT7 or TNativePin.PC11{$endif}
    {$if defined(has_USART2) and defined(has_gpiod)},  PD6_USART2 = ALT7 or TNativePin.PD6 {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)},  PD9_USART3 = ALT7 or TNativePin.PD9 {$endif}
    {$if defined(has_USART1) and defined(has_gpiog)}, PG10_USART1 = ALT7 or TNativePin.PG10{$endif}
    {$if defined(has_UART4)  and defined(has_gpioa)},   PA1_UART4 = ALT8 or TNativePin.PA1 {$endif}
    {$if defined(has_LPUART1) and defined(has_gpioa)},PA3_LPUART1 = ALT8 or TNativePin.PA3 {$endif}
    {$if defined(has_LPUART1) and defined(has_gpiob)},PB10_LPUART1= ALT8 or TNativePin.PB10{$endif}
    {$if defined(has_LPUART1) and defined(has_gpioc)},PC0_LPUART1 = ALT8 or TNativePin.PC0 {$endif}
    {$if defined(has_UART4)  and defined(has_gpioc)},  PC11_UART4 = ALT8 or TNativePin.PC11{$endif}
    {$if defined(has_UART5)  and defined(has_gpiod)},   PD2_UART5 = ALT8 or TNativePin.PD2 {$endif}
    {$if defined(has_LPUART1) and defined(has_gpiog)},PG8_LPUART1 = ALT8 or TNativePin.PG8 {$endif}
  );

  TUARTTXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_USART2) and defined(has_gpioa)},  PA2_USART2 = ALT7 or TNativePin.PA2 {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)              },  DEBUG_UART = ALT7 or TNativePin.PA2 {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)},  PA9_USART1 = ALT7 or TNativePin.PA9 {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)              },     D1_UART = ALT7 or TNativePin.PA9 {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },     D1_UART = ALT7 or TNativePin.PA9 {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },  DEBUG_UART = ALT7 or TNativePin.PA9 {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)},  PB6_USART1 = ALT7 or TNativePin.PB6 {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB10_USART3 = ALT7 or TNativePin.PB10{$endif}
    {$if defined(has_USART3) and defined(has_gpioc)},  PC4_USART3 = ALT7 or TNativePin.PC4 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC10_USART3 = ALT7 or TNativePin.PC10{$endif}
    {$if defined(has_USART2) and defined(has_gpiod)},  PD5_USART2 = ALT7 or TNativePin.PD5 {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)},  PD8_USART3 = ALT7 or TNativePin.PD8 {$endif}
    {$if defined(has_USART1) and defined(has_gpiog)},  PG9_USART1 = ALT7 or TNativePin.PG9 {$endif}
    {$if defined(has_UART4)  and defined(has_gpioa)},   PA0_UART4 = ALT8 or TNativePin.PA0 {$endif}
    {$if defined(has_LPUART1) and defined(has_gpioa)}, PA2_LPUART1= ALT8 or TNativePin.PA2 {$endif}
    {$if defined(has_LPUART1) and defined(has_gpiob)},PB11_LPUART1= ALT8 or TNativePin.PB11{$endif}
    {$if defined(has_LPUART1) and defined(has_gpioc)}, PC1_LPUART1= ALT8 or TNativePin.PC1 {$endif}
    {$if defined(has_UART4)  and defined(has_gpioc)},  PC10_UART4 = ALT8 or TNativePin.PC10{$endif}
    {$if defined(has_UART5)  and defined(has_gpioc)},  PC12_UART5 = ALT8 or TNativePin.PC12{$endif}
    {$if defined(has_LPUART1) and defined(has_gpiog)}, PG7_LPUART1= ALT8 or TNativePin.PG7 {$endif}
  );

  {$ENDREGION}

  TUARTBitsPerWord = (
    Eight = %00,
    Nine = %01,
    Seven = %10
  );

  TUARTParity = (
    None = %00,
    Even = %10,
    Odd  = %11
  );

  TUARTStopBits = (
    One = %00,
    ZeroDotFive = %01,
    Two = %10,
    OneDotFive = %11
  );

  TUARTClockSource = (
    APB2 = %00,
    SYSCLK = %01,
    HSI = %10,
    LSE = %11
  );

  TUARTRegistersHelper = record helper for TUART_Registers
  private
    function  GetBaudRate: longWord;
    procedure SetBaudRate(const Value: longWord);
    function  GetBitsPerWord: TUARTBitsPerWord;
    procedure SetBitsPerWord(const Value: TUARTBitsPerWord);
    function  GetParity: TUARTParity;
    procedure SetParity(const Value: TUARTParity);
    function  GetStopBits: TUARTStopBits;
    procedure SetStopBits(const Value: TUARTStopBits);
    procedure SetRxPin(const Value : TUARTRXPins);
    procedure SetTxPin(const Value : TUARTTXPins);
    procedure SetClockSource(const Value : TUARTClockSource);
    function GetClockSource : TUARTClockSource;
  public
    procedure initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
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

{$IF DEFINED(HAS_ARDUINOMINIPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART1_BASE;
  DEBUG_UART : TUART_Registers absolute USART2_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.STM32.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}
{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART1_BASE;
  DEBUG_UART : TUART_Registers absolute USART1_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.STM32.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.BitHelpers;

function TUARTRegistersHelper.GetClockSource : TUARTClockSource;
begin
  case longWord(@self) of
    USART1_BASE : Result :=  TUARTClockSource(getBitsMasked(RCC.CCIPR,%11 shl 0,0));
    USART2_BASE : Result :=  TUARTClockSource(getBitsMasked(RCC.CCIPR,%11 shl 2,2));
    {$ifdef has_usart3}Result :=  TUARTClockSource(getBitsMasked(RCC.CCIPR,%11 shl 4,4));{$endif}
    {$ifdef has_uart4} Result :=  TUARTClockSource(getBitsMasked(RCC.CCIPR,%11 shl 6,6));{$endif}
    {$ifdef has_uart5} Result :=  TUARTClockSource(getBitsMasked(RCC.CCIPR,%11 shl 8,8));{$endif}
  end;
end;

procedure TUARTRegistersHelper.SetClockSource(const Value : TUARTClockSource);
begin
  case longWord(@self) of
    USART1_BASE : setBitsMasked(RCC.CCIPR,longWord(Value),%11 shl 0,0);
    USART2_BASE : setBitsMasked(RCC.CCIPR,longWord(Value),%11 shl 2,2);
    {$ifdef has_usart3}setBitsMasked(RCC.CCIPR,longWord(Value),%11 shl 4,4);{$endif}
    {$ifdef has_uart4} setBitsMasked(RCC.CCIPR,longWord(Value),%11 shl 6,6);{$endif}
    {$ifdef has_uart4} setBitsMasked(RCC.CCIPR,longWord(Value),%11 shl 8,8);{$endif}
  end;
end;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  case longWord(@Self) of
    USART1_BASE : RCC.APB2ENR := RCC.APB2ENR or (1 shl 14);
    USART2_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 17);
    {$ifdef has_uart3}USART3_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 18);{$endif}
    {$ifdef has_uart4}UART4_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 19);{$endif}
    {$ifdef has_lpuart1}LPUART1_BASE : RCC.APB1ENR2 := RCC.APB1ENR2 or (1 shl 0);{$endif}
  end;
  // First, load Reset Value, this also turns off the UART
  // Create the basic config for all n81 use cases
  self.CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  self.CR2:= 0;

  // Set Defaults not RTS/CTS
  self.CR3:= 0;

  setClockSource(TUARTClockSource.APB2);

  // RE TE Enable both receiver and sender
  setBit(self.CR1,2);
  setBit(self.CR1,3);

  SetBaudRate(DefaultUARTBaudrate);
  setRxPin(ARxPin);
  setTxPin(ATxPin);
  Enable;
end;

procedure TUARTRegistersHelper.SetRxPin(const Value : TUARTRXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
end;

procedure TUARTRegistersHelper.SetTxPin(const Value : TUARTTXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
end;

function TUARTRegistersHelper.Disable:boolean; inline;
begin
  Result := GetBit(self.CR1,0) > 0;
  ClearBit(self.CR1,0);
end;

procedure TUARTRegistersHelper.Enable; inline;
begin
  SetBit(self.CR1,0);
end;

function TUARTRegistersHelper.GetBaudRate: longWord;
var
  ClockFreq : longWord;
begin
  case GetClockSource of
    TUARTClockSource.APB2 : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;
    TUARTClockSource.SYSCLK : ClockFreq := SystemCore.GetSYSCLKFrequency;
    TUARTClockSource.HSI : ClockFreq := SystemCore.GetHSIClockFrequency;
    TUARTClockSource.LSE : ClockFreq := XTALRTCFreq;
  end;

  //OVER8
  if getBit(self.CR1,15) = 0 then
    Result := ClockFreq div Self.BRR
  else
    Result := ClockFreq div((Self.BRR and $fff0) or ((Self.BRR and %111) shl 1));
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: longWord);
var
  ClockFreq,UsartDiv : longWord;
  ReEnable : boolean = false;
begin
  // set Baudrate
  // UE disable Serial interface
  ReEnable := Disable;

  case GetClockSource of
    TUARTClockSource.APB2 : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;
    TUARTClockSource.HSI : ClockFreq := HSIClockFrequency;
    TUARTClockSource.LSE : ClockFreq := XTALRTCFreq;
    TUARTClockSource.SYSCLK : ClockFreq := SystemCore.GetSYSCLKFrequency;
  end;

  if getBit(self.CR1,15) = 0 then
  begin
    // 16x Oversampling
    self.BRR := ClockFreq div Value;
  end
  else
  begin
    // 8x Oversampling
    UsartDiv := 2*ClockFreq div Value;
    self.BRR := (UsartDiv and $fff0) or ((UsartDiv and %1111) shr 1);
  end;

  if reEnable = true then
    Enable;
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord((getBit(Self.CR1,28) shl 1) or getBit(Self.CR1,12));
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setBitValue(Self.CR1,longWord(Value) shr 1,28);
  setBitValue(Self.CR1,longWord(Value) and %1,12);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  Result := TUARTParity(getBitsMasked(Self.CR1,%11 shl 9,9));
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setBitsMasked(Self.CR1,longWord(Value),%11 shl 9,9);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits(getBitsMasked(Self.CR2,%11 shl 12,12));
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setBitsMasked(Self.CR2,longWord(Value),%11 shl 12,12);
  if ReEnable then
    Enable;
end;

procedure TUARTRegistersHelper.WaitForTXReady; inline;
begin
  WaitBitIsSet(self.ISR,7);
end;

procedure TUARTRegistersHelper.WaitForRXReady; inline;
begin
  WaitBitIsSet(self.ISR,5);
end;

function TUARTRegistersHelper.WaitForTXReady(EndTime : TMilliSeconds):boolean; inline;
begin
  Result := WaitBitIsSet(self.ISR,7,EndTime);
end;

function TUARTRegistersHelper.WaitForRXReady(EndTime : TMilliSeconds):boolean; inline;
begin
  Result := WaitBitIsSet(self.ISR,5,EndTime);
end;

procedure TUARTRegistersHelper.WriteDR(const Value : byte); inline;
begin
  self.TDR := Value;
end;

function TUARTRegistersHelper.ReadDR : byte ; inline;
begin
  Result := self.RDR;
end;

{$DEFINE IMPLEMENTATION}
{$I MBF.STM32.UART.inc}
{$UNDEF IMPLEMENTATION}

{$ENDREGION}

end.
