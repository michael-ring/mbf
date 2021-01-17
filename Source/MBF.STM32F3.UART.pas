unit MBF.STM32F3.UART;
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
{$WARN 3031 off : Values in enumeration types have to be ascending}
{$WARN 4055 off : Conversion between ordinals and pointers is not portable}
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32F3.SystemCore,
  MBF.STM32F3.GPIO;

type
  TUART_Registers = TUSART_Registers;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeOut=10000;
type
  TUARTRXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_UART4 ) and defined(has_gpioc) }, PC11_UART4 = ALT5 or TNativePin.PC11 {$endif}
    {$if defined(has_UART5 ) and defined(has_gpiod) }, PD2_UART5  = ALT5 or TNativePin.PD2  {$endif}
    {$if defined(has_USART2) and defined(has_gpioa) }, PA3_USART2 = ALT7 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },  D0_UART   = ALT7 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },  DEBUG_UART= ALT7 or TNativePin.PA3  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa) },PA10_USART1 = ALT7 or TNativePin.PA10 {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)               },  D0_UART   = ALT7 or TNativePin.PA10 {$endif}
    {$if defined(has_USART2) and defined(has_gpioa) },PA15_USART2 = ALT7 or TNativePin.PA15 {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)               },  DEBUG_UART= ALT7 or TNativePin.PA15 {$endif}
    {$if defined(has_USART2) and defined(has_gpiob) }, PB4_USART2 = ALT7 or TNativePin.PB4  {$endif}
    {$if defined(has_USART1) and defined(has_gpiob) }, PB7_USART1 = ALT7 or TNativePin.PB7  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob) }, PB8_USART3 = ALT7 or TNativePin.PB8  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob) }, PB9_USART3 = ALT7 or TNativePin.PB9  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob) },PB11_USART3 = ALT7 or TNativePin.PB11 {$endif}
    {$if defined(has_USART1) and defined(has_gpioc) }, PC5_USART1 = ALT7 or TNativePin.PC5  {$endif}
    {$if defined(has_USART3) and defined(has_gpioc) },PC11_USART3 = ALT7 or TNativePin.PC11 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod) }, PD6_USART2 = ALT7 or TNativePin.PD6  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod) }, PD9_USART3 = ALT7 or TNativePin.PD9  {$endif}
    {$if defined(has_USART1) and defined(has_gpioe) }, PE1_USART1 = ALT7 or TNativePin.PE1  {$endif}
    {$if defined(has_USART3) and defined(has_gpioe) },PE15_USART3 = ALT7 or TNativePin.PE15 {$endif}  );

  TUARTTXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_UART4 ) and defined(has_gpioc) },PC10_UART4  = ALT5 or TNativePin.PC10 {$endif}
    {$if defined(has_UART5 ) and defined(has_gpioc) },PC12_UART5  = ALT5 or TNativePin.PC12 {$endif}
    {$if defined(has_USART2) and defined(has_gpioa) }, PA2_USART2 = ALT7 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },  D1_UART   = ALT7 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },  DEBUG_UART= ALT7 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)               },  DEBUG_UART= ALT7 or TNativePin.PA2  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa) }, PA9_USART1 = ALT7 or TNativePin.PA9  {$endif}
    {$if defined(HAS_ARDUINOMINIPINS)               },  D1_UART   = ALT7 or TNativePin.PA9  {$endif}
    {$if defined(has_USART2) and defined(has_gpioa) },PA14_USART2 = ALT7 or TNativePin.PA14 {$endif}
    {$if defined(has_USART2) and defined(has_gpiob) }, PB3_USART2 = ALT7 or TNativePin.PB3  {$endif}
    {$if defined(has_USART1) and defined(has_gpiob) }, PB6_USART1 = ALT7 or TNativePin.PB6  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob) }, PB8_USART3 = ALT7 or TNativePin.PB8  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob) }, PB9_USART3 = ALT7 or TNativePin.PB9  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob) },PB10_USART3 = ALT7 or TNativePin.PB10 {$endif}
    {$if defined(has_USART1) and defined(has_gpioc) }, PC4_USART1 = ALT7 or TNativePin.PC4  {$endif}
    {$if defined(has_USART3) and defined(has_gpioc) },PC10_USART3 = ALT7 or TNativePin.PC10 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod) }, PD5_USART2 = ALT7 or TNativePin.PD5  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod) }, PD8_USART3 = ALT7 or TNativePin.PD8  {$endif}
    {$if defined(has_USART1) and defined(has_gpioe) }, PE0_USART1 = ALT7 or TNativePin.PE0  {$endif}  );
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
    APB1orAPB2 = %00,
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

      procedure WaitForTXReady; //inline;
      procedure WaitForRXReady; //inline;

      function  WaitForTXReady(EndTime : TMilliSeconds):boolean; //inline;
      function  WaitForRXReady(EndTime : TMilliSeconds):boolean; //inline;

      procedure WriteDR(const Value : byte); //inline;
      function ReadDR:byte; //inline;

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
    {$ifdef has_usart3}Result :=  TUARTClockSource(GetCrumb(RCC.CFGR3,18));{$endif}
    {$ifdef has_uart4} Result :=  TUARTClockSource(GetCrumb(RCC.CFGR3,20));{$endif}
    {$ifdef has_uart5} Result :=  TUARTClockSource(GetCrumb(RCC.CFGR3,22));{$endif}
  end;
end;

procedure TUARTRegistersHelper.SetClockSource(const Value : TUARTClockSource);
begin
  case longWord(@self) of
    USART1_BASE : SetCrumb(RCC.CFGR3,longWord(Value),0);
    USART2_BASE : SetCrumb(RCC.CFGR3,longWord(Value),16);
    {$ifdef has_usart3}SetCrumb(RCC.CFGR3,longWord(Value),18);{$endif}
    {$ifdef has_uart4} SetCrumb(RCC.CFGR3,longWord(Value),20);{$endif}
    {$ifdef has_uart5} SetCrumb(RCC.CFGR3,longWord(Value),22);{$endif}
  end;
end;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  case longWord(@Self) of
    USART1_BASE : setBit(RCC.APB2ENR,14);
    USART2_BASE : setBit(RCC.APB1ENR,17);
    {$ifdef has_usart3}USART3_BASE : setBit(RCC.APB1ENR,18);{$endif}
    {$ifdef has_uart4}  UART4_BASE : setBit(RCC.APB1ENR,19);{$endif}
    {$ifdef has_uart5}  UART5_BASE : setBit(RCC.APB1ENR,20);{$endif}
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
  GPIO.PinMode[longWord(ARxPin) and $ff] := TPinMode((longWord(ARxPin) shr 8) and $3f);
  GPIO.PinMode[longWord(ATxPin) and $ff] := TPinMode((longWord(ATxPin) shr 8) and $3f);
  Enable;
end;

function TUARTRegistersHelper.Disable:boolean; //inline;
begin
  Result := GetBit(self.CR1,0) > 0;
  ClearBit(self.CR1,0);
end;

procedure TUARTRegistersHelper.Enable; //inline;
begin
  SetBit(self.CR1,0);
end;

function TUARTRegistersHelper.GetBaudRate: longWord;
var
  ClockFreq : longWord;
begin
  case GetClockSource of
    TUARTClockSource.APB1orAPB2 : if longWord(@self) = USART1_BASE then ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency
                                                    else ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
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
      TUARTClockSource.APB1orAPB2 : if longWord(@self) = USART1_BASE then ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency
                                                    else ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
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

procedure TUARTRegistersHelper.WaitForTXReady; //inline;
begin
  WaitBitIsSet(self.ISR,7);
end;

procedure TUARTRegistersHelper.WaitForRXReady; //inline;
begin
  WaitBitIsSet(self.ISR,5);
end;

function TUARTRegistersHelper.WaitForTXReady(EndTime : TMilliSeconds):boolean; //inline;
begin
  Result := WaitBitIsSet(self.ISR,7,EndTime);
end;

function TUARTRegistersHelper.WaitForRXReady(EndTime : TMilliSeconds):boolean; //inline;
begin
  Result := WaitBitIsSet(self.ISR,5,EndTime);
end;

procedure TUARTRegistersHelper.WriteDR(const Value : byte); //inline;
begin
  self.TDR := Value;
end;

function TUARTRegistersHelper.ReadDR : byte ; //inline;
begin
  Result := self.RDR;
end;

{$DEFINE IMPLEMENTATION}
{$I MBF.STM32.UART.inc}
{$UNDEF IMPLEMENTATION}

{$ENDREGION}

end.

