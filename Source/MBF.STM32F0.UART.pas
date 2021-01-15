unit MBF.STM32F0.UART;
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

uses
  MBF.STM32F0.SystemCore,
  MBF.STM32F0.GPIO;

type
  TUART_Registers = TUSART_Registers;

{$REGION PinDefinitions}
const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeOut=10000;

type
  TUARTRXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_USART1) and defined(has_gpiob)}, PB7_USART1  = ALT0 or TNativePin.PB7  {$endif}
    {$if defined(has_USART4) and defined(has_gpioc)}, PC11_USART4 = ALT0 or TNativePin.PC11 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)}, PD6_USART2  = ALT0 or TNativePin.PD6  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)}, PD9_USART3  = ALT0 or TNativePin.PD9  {$endif}
    {$if defined(has_USART8) and defined(has_gpiod)}, PD14_USART8 = ALT0 or TNativePin.PD14 {$endif}
    //{$if defined(has_USART1) and defined(has_gpioa)}, PA3_USART1  = ALT1 or TNativePin.PA3  {$endif}
    {$if defined(has_USART2) and defined(has_gpioa)}, PA3_USART2  = ALT1 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOPINS)                  }, D0_UART     = ALT1 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOPINS)                  }, DEBUG_UART  = ALT1 or TNativePin.PA3  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA10_USART1 = ALT1 or TNativePin.PA10 {$endif}
    {$if defined(HAS_ARDUINONANOPINS)              },  D0_UART    = ALT1 or TNativePin.PA10 {$endif}
    //{$if defined(has_USART1) and defined(has_gpioa)}, PA15_USART1 = ALT1 or TNativePin.PA15 {$endif}
    {$if defined(has_USART2) and defined(has_gpioa)}, PA15_USART2 = ALT1 or TNativePin.PA1  {$endif}
    {$if defined(HAS_ARDUINONANOPINS)              },  DEBUG_UART = ALT1 or TNativePin.PA15 {$endif}
    {$if defined(has_USART7) and defined(has_gpioc)}, PC1_USART7  = ALT1 or TNativePin.PC1  {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC5_USART3  = ALT1 or TNativePin.PC5  {$endif}
    {$if defined(has_USART7) and defined(has_gpioc)}, PC7_USART7  = ALT1 or TNativePin.PC7  {$endif}
    {$if defined(has_USART8) and defined(has_gpioc)}, PC9_USART8  = ALT1 or TNativePin.PC9  {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC11_USART3 = ALT1 or TNativePin.PC11 {$endif}
    {$if defined(has_USART4) and defined(has_gpioe)}, PE9_USART4  = ALT1 or TNativePin.PE9  {$endif}
    {$if defined(has_USART5) and defined(has_gpioe)}, PE11_USART5 = ALT1 or TNativePin.PE11 {$endif}
    {$if defined(has_USART7) and defined(has_gpiof)}, PF3_USART7  = ALT1 or TNativePin.PF3  {$endif}
    {$if defined(has_USART6) and defined(has_gpiof)}, PF10_USART6 = ALT1 or TNativePin.PF10 {$endif}
    {$if defined(has_USART6) and defined(has_gpioc)}, PC1_USART6  = ALT2 or TNativePin.PC1  {$endif}
    {$if defined(has_USART8) and defined(has_gpioc)}, PC3_USART8  = ALT2 or TNativePin.PC3  {$endif}
    {$if defined(has_USART5) and defined(has_gpiod)}, PD2_USART5  = ALT2 or TNativePin.PD2  {$endif}
    {$if defined(has_USART4) and defined(has_gpioa)}, PA1_USART4  = ALT4 or TNativePin.PA1  {$endif}
    {$if defined(has_USART5) and defined(has_gpiob)}, PB4_USART5  = ALT4 or TNativePin.PB4  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB11_USART3 = ALT4 or TNativePin.PB11 {$endif}
    {$if defined(has_USART6) and defined(has_gpioa)}, PA5_USART6  = ALT5 or TNativePin.PA5  {$endif}
  );

  TUARTTXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_USART1) and defined(has_gpiob)}, PB6_USART1  = ALT0 or TNativePin.PB6  {$endif}
    {$if defined(has_USART4) and defined(has_gpioc)}, PC10_USART4 = ALT0 or TNativePin.PC10 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)}, PD5_USART2  = ALT0 or TNativePin.PD5  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)}, PD8_USART3  = ALT0 or TNativePin.PD8  {$endif}
    {$if defined(has_USART8) and defined(has_gpiod)}, PD13_USART8 = ALT0 or TNativePin.PD13 {$endif}
    //{$if defined(has_USART1) and defined(has_gpioa)}, PA2_USART1 = ALT1 or TNativePin.PA2 {$endif}
    {$if defined(has_USART2) and defined(has_gpioa)}, PA2_USART2  = ALT1 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOPINS)                  }, D1_UART     = ALT1 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOPINS)                  }, DEBUG_UART  = ALT1 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINONANOPINS)              }, D1_UART     = ALT1 or TNativePin.PA2  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA9_USART1  = ALT1 or TNativePin.PA9  {$endif}
    {$if defined(HAS_ARDUINONANOPINS)              },  DEBUG_UART = ALT1 or TNativePin.PA9  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA14_USART1 = ALT1 or TNativePin.PA14 {$endif}
    {$if defined(has_USART2) and defined(has_gpioa)}, PA14_USART2 = ALT1 or TNativePin.PA14 {$endif}
    {$if defined(has_USART7) and defined(has_gpioc)}, PC0_USART7  = ALT1 or TNativePin.PC0  {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC4_USART3  = ALT1 or TNativePin.PC4  {$endif}
    {$if defined(has_USART7) and defined(has_gpioc)}, PC6_USART7  = ALT1 or TNativePin.PC6  {$endif}
    {$if defined(has_USART8) and defined(has_gpioc)}, PC8_USART8  = ALT1 or TNativePin.PC8  {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC10_USART3 = ALT1 or TNativePin.PC10 {$endif}
    {$if defined(has_USART4) and defined(has_gpioe)}, PE8_USART4  = ALT1 or TNativePin.PE8  {$endif}
    {$if defined(has_USART5) and defined(has_gpioe)}, PE10_USART5 = ALT1 or TNativePin.PE10 {$endif}
    {$if defined(has_USART7) and defined(has_gpiof)}, PF2_USART7  = ALT1 or TNativePin.PF2  {$endif}
    {$if defined(has_USART6) and defined(has_gpiof)}, PF9_USART6  = ALT1 or TNativePin.PF9  {$endif}
    {$if defined(has_USART6) and defined(has_gpioc)}, PC0_USART6  = ALT2 or TNativePin.PC0  {$endif}
    {$if defined(has_USART8) and defined(has_gpioc)}, PC2_USART8  = ALT2 or TNativePin.PC2  {$endif}
    {$if defined(has_USART5) and defined(has_gpioc)}, PC12_USART5 = ALT2 or TNativePin.PC12 {$endif}
    {$if defined(has_USART4) and defined(has_gpioa)}, PA0_USART4  = ALT4 or TNativePin.PA0  {$endif}
    {$if defined(has_USART5) and defined(has_gpiob)}, PB3_USART5  = ALT4 or TNativePin.PB3  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB10_USART3 = ALT4 or TNativePin.PB10 {$endif}
    {$if defined(has_USART6) and defined(has_gpioa)}, PA4_USART6  = ALT5 or TNativePin.PA4  {$endif}
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
    PCLK = %00,
    SYSCLK = %01,
    LSE = %10,
    HSI = %11
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
      property ClockSource : TUARTClockSource read getClockSource;

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
  UART : TUART_Registers absolute USART2_BASE;
  DEBUG_UART : TUART_Registers absolute USART1_BASE;
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
  case longWord(@self) of
    USART1_BASE : Result :=  TUARTClockSource(GetCrumb(RCC.CFGR3,0));
    USART2_BASE : Result :=  TUARTClockSource(GetCrumb(RCC.CFGR3,16));
    {$ifdef has_uart3}Result :=  TUARTClockSource(GetCrumb(RCC.CFGR3,18)){$endif}
  else
    Result := TUARTClockSource.PCLK
  end;
end;

procedure TUARTRegistersHelper.SetClockSource(const Value : TUARTClockSource);
begin
  case longWord(@self) of
    USART1_BASE : SetCrumb(RCC.CFGR3,longWord(Value),0);
    USART2_BASE : SetCrumb(RCC.CFGR3,longWord(Value),16);
    {$ifdef has_uart3}SetCrumb(RCC.CFGR3,longWord(Value),18){$endif}
  else
    ;
  end;
end;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  case longWord(@Self) of
    USART1_BASE : setBit(RCC.APB2ENR,14);
    USART2_BASE : setBit(RCC.APB1ENR,17);
    {$ifdef has_usart3}USART3_BASE : setBit(RCC.APB1ENR,18);{$endif}
    {$ifdef has_usart4}USART4_BASE : setBit(RCC.APB1ENR,19);{$endif}
    {$ifdef has_usart5}USART5_BASE : setBit(RCC.APB1ENR,20);{$endif}
    {$ifdef has_usart6}USART6_BASE : setBit(RCC.APB2ENR,5);{$endif}
    {$ifdef has_usart7}USART7_BASE : setBit(RCC.APB2ENR,6);{$endif}
    {$ifdef has_usart8}USART8_BASE : setBit(RCC.APB2ENR,7);{$endif}
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

  SetBaudRate(DefaultUARTBaudrate);
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
  Enable;
end;

function TUARTRegistersHelper.Disable:boolean;
begin
  Result := GetBit(self.CR1,0) > 0;
  ClearBit(self.CR1,0);
end;

procedure TUARTRegistersHelper.Enable;
begin
  SetBit(self.CR1,0);
end;

function TUARTRegistersHelper.GetBaudRate: longWord;
var
  ClockFreq : longWord;
begin
  case GetClockSource of
    TUARTClockSource.PCLK : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
    TUARTClockSource.HSI : ClockFreq := HSIClockFrequency;
    TUARTClockSource.LSE : ClockFreq := XTALRTCFreq;
    TUARTClockSource.SYSCLK : ClockFreq := SystemCore.GetSYSCLKFrequency;
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
  reactivate : boolean = false;
begin
  // set Baudrate
  // UE disable Serial interface
  reactivate := Disable;
  case GetClockSource of
    TUARTClockSource.PCLK : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
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
    UsArtDiv := 2*ClockFreq div Value;
    self.BRR := (UsartDiv and $fff0) or ((UsartDiv and %1111) shr 1);
  end;
  if reactivate = true then
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
  Result := TUARTParity(getCrumb(Self.CR1,9));
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setCrumb(Self.CR1,longWord(Value),9);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits(getCrumb(Self.CR2,12));
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  setCrumb(Self.CR2,longWord(Value),12);
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

