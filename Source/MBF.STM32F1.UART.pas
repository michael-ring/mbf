unit MBF.STM32F1.UART;
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

uses
  MBF.STM32F1.SystemCore,
  MBF.STM32F1.GPIO;

type
  TUART_Registers = TUSART_Registers;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeOut=10000;
type
  TUARTRXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_USART2) and defined(has_gpioa)}, PA3_USART2  = ALT0 or TNativePin.PA3 {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },    D0_UART  = ALT0 or TNativePin.PA3 {$endif}
    {$if defined(HAS_ARDUINOPINS)                  }, DEBUG_UART  = ALT0 or TNativePin.PA3 {$endif}

    {$if defined(has_USART1) and defined(has_gpioa)}, PA10_USART1 = ALT0 or TNativePin.PA10{$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB11_USART3 = ALT0 or TNativePin.PB11{$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC11_USART3 = ALT1 or TNativePin.PC11{$endif}
    {$if defined(has_USART1) and defined(has_gpiob)}, PB7_USART1  = ALT3 or TNativePin.PB7 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)}, PD6_USART2  = ALT3 or TNativePin.PD6 {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)}, PD9_USART3  = ALT3 or TNativePin.PD9 {$endif}
  );
  TUARTTXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_USART2) and defined(has_gpioa)}, PA2_USART2  = ALT0 or TNativePin.PA2 {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },   D1_UART   = ALT0 or TNativePin.PA2 {$endif}
    {$if defined(HAS_ARDUINOPINS)                  }, DEBUG_UART  = ALT0 or TNativePin.PA2 {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA9_USART1  = ALT0 or TNativePin.PA9 {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB10_USART3 = ALT0 or TNativePin.PB10{$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC10_USART3 = ALT1 or TNativePin.PC10{$endif}
    {$if defined(has_USART1) and defined(has_gpiob)}, PB6_USART1  = ALT3 or TNativePin.PB6 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)}, PD5_USART2  = ALT3 or TNativePin.PD5 {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)}, PD8_USART3  = ALT3 or TNativePin.PD8 {$endif}
  );

{$ENDREGION}

  TUARTBitsPerWord = (
    Eight = %00,
    Nine = %01
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
    APB1orAPB2 =%0
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
    procedure SetStopBits(const aStopBit: TUARTStopBits);
    function  GetClockSource : TUARTClockSource;
    procedure SetClockSource(const {%H-}aClockSource : TUARTClockSource);
  public
    procedure initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
    function Disable : boolean;
    procedure Enable;

    property BaudRate : longWord read getBaudRate write setBaudRate;
    property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
    property Parity : TUARTParity read getParity write setParity;
    property StopBits : TUARTStopBits read getStopBits write setStopBits;
    property ClockSource : TUARTClockSource read getClockSource;

    procedure WaitForTXReady; //inline;
    procedure WaitForRXReady; //inline;

    function  WaitForTXReady(EndTime : TMilliSeconds):boolean; //inline;
    function  WaitForRXReady(EndTime : TMilliSeconds):boolean; //inline;

    procedure WriteDR(const Value : byte);
    function  ReadDR : byte;

    {$DEFINE INTERFACE}
    {$I MBF.STM32.UART.inc}
    {$UNDEF INTERFACE}
  end;

{$IF DEFINED(HAS_ARDUINOMINIPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART2_BASE;
  DEBUG_UART : TUART_Registers absolute USART2_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.STM32.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}
{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART2_BASE;
  DEBUG_UART : TUART_Registers absolute USART2_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.STM32.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.BitHelpers;

function TUARTRegistersHelper.GetClockSource : TUARTClockSource;
begin
  Result :=  TUARTClockSource.APB1orAPB2;
end;

procedure TUARTRegistersHelper.setClockSource(const aClockSource : TUARTClockSource);
begin
  //No choice on STM32F1 family
end;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  case {%H-}longWord(@Self) of
    USART1_BASE : setBit(RCC.APB2ENR,14);
    USART2_BASE : setBit(RCC.APB1ENR,17);
    {$if defined(has_usart3)}USART3_BASE : setBit(RCC.APB1ENR,18);{$endif}
    {$if defined(has_uart4)}  UART4_BASE : setBit(RCC.APB1ENR,19);{$endif}
    {$if defined(has_uart5)}  UART5_BASE : setBit(RCC.APB1ENR,20);{$endif}
  end;
  // First, load Reset Value, this also turns off the UART
  // Create the basic config for all n81 use cases
  self.CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  self.CR2:= 0;

  // Set Defaults not RTS/CTS
  self.CR3:= 0;

   // RE TE Enable both receiver and sender
  setBit(self.CR1,2);
  setBit(self.CR1,3);

  setBaudRate(DefaultUARTBaudRate);
  GPIO.PinMode[longWord(aRxPin) and $ff] := TPinMode.Input;
  GPIO.PinDrive[longWord(aRxPin) and $ff] := TPinDrive.None;
  GPIO.PinMode[longWord(aTxPin) and $ff] := TPinMode.AF0;
  // Set the (very limited) Pin Remapping, RX Pins follow TX Pins as there is only one config bit
  case longWord(aTxPin) and $ff of
    TNativePin.PA9 : ClearBit(AFIO.MAPR,2);
    TNativePin.PA2 : ClearBit(AFIO.MAPR,3);
    TNativePin.PB10 : SetCrumb(AFIO.MAPR,%00,4);
    TNativePin.PB6 : SetBit(AFIO.MAPR,2);
    {$if defined(has_gpiod)}
    TNativePin.PD5 : SetBit(AFIO.MAPR,3);
    {$endif}
    {$if defined(has_gpioc)}
    TNativePin.PC10 : SetCrumb(AFIO.MAPR,%01,4);
    {$endif}
    {$if defined(has_gpiod)}
    TNativePin.PD8 :  SetCrumb(AFIO.MAPR,%11,4);
    {$endif}
  end;
  Enable;
end;

function TUARTRegistersHelper.Disable:boolean; //inline;
begin
  Result := GetBit(self.CR1,13)>0;
  clearBit(self.CR1,13);
end;

procedure TUARTRegistersHelper.Enable; //inline;
begin
  SetBit(self.CR1,13);
end;

function TUARTRegistersHelper.GetBaudRate: longWord;
var
  ClockFreq : longWord;
begin
  case GetClockSource of
    TUARTClockSource.APB1orAPB2 : if {%H-}longWord(@self) = USART1_BASE then ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency
                                                  else ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
  end;
  Result := (ClockFreq*16 div self.BRR) shr 4;
end;

procedure TUARTRegistersHelper.SetBaudRate(const aBaudrate: longWord);
var
  ClockFreq,Mantissa,Fraction : longWord;
  ReEnable : boolean = false;
begin
    // set Baudrate
    // UE disable Serial interface
   ReEnable := Disable;

    case GetClockSource of
      TUARTClockSource.APB1orAPB2 : if {%H-}longWord(@self) = USART1_BASE then
                                      ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency
                                    else
                                      ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
    end;
    Mantissa := ((ClockFreq*25) div (4*aBaudrate)) div 100;
    Fraction := (longWord(((((ClockFreq*25) div (4*aBaudrate)) {%H-}- Mantissa*100)*16+50) div 100) and $0f);
    self.BRR := Mantissa shl 4 or Fraction;
    if ReEnable = true then
      Enable;
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord(GetBit(Self.CR1,12));
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const aBitsPerWord: TUARTBitsPerWord);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setBitValue(Self.CR1,longWord(aBitsPerWord),12);
  if ReEnable = true then
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
  SetCrumb(Self.CR1,longWord(aParity),9);
  if ReEnable = true then
    Enable;
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits(getCrumb(Self.CR2,12));
end;

procedure TUARTRegistersHelper.SetStopBits(const aStopBit: TUARTStopBits);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setCrumb(Self.CR2,longWord(aStopBit),12);
  if ReEnable = true then
    Enable;
end;

procedure TUARTRegistersHelper.WaitForTXReady; //inline;
begin
  WaitBitIsSet(self.SR,7);
end;

procedure TUARTRegistersHelper.WaitForRXReady; //inline;
begin
  WaitBitIsSet(self.SR,5);
end;

function TUARTRegistersHelper.WaitForTXReady(EndTime : TMilliSeconds):boolean; //inline;
begin
  Result := WaitBitIsSet(self.SR,7,EndTime);
end;

function TUARTRegistersHelper.WaitForRXReady(EndTime : TMilliSeconds):boolean; //inline;
begin
  Result := WaitBitIsSet(self.SR,5,EndTime);
end;

procedure TUARTRegistersHelper.WriteDR(const Value : byte); //inline;
begin
  self.DR := Value;
end;

function TUARTRegistersHelper.ReadDR : byte ; //inline;
begin
  Result := self.DR;
end;

{$DEFINE IMPLEMENTATION}
{$I MBF.STM32.UART.inc}
{$UNDEF IMPLEMENTATION}

{$ENDREGION}
end.
