unit MBF.STM32F7.UART;
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

{$WARN 3031 off : Values in enumeration types have to be ascending}
{$WARN 4055 off : Conversion between ordinals and pointers is not portable}
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32F7.SystemCore,
  MBF.STM32F7.GPIO;

type
  TUART_Registers = TUSART_Registers;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeOut=10000;
type
  TUARTRXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_UART5)  and defined(has_gpiob)}, PB5_UART5  = ALT1 or TNativePin.PB5  {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)}, PB15_USART1= ALT4 or TNativePin.PB15 {$endif}
    {$if defined(has_UART4)  and defined(has_gpioa)}, PA11_UART4 = ALT6 or TNativePin.PA11 {$endif}
    {$if defined(has_USART2) and defined(has_gpioa)}, PA3_USART2 = ALT7 or TNativePin.PA3  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA10_USART1= ALT7 or TNativePin.PA10 {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)}, PB7_USART1 = ALT7 or TNativePin.PB7  {$endif}
    {$if defined(has_UART5)  and defined(has_gpiob)}, PB8_UART5  = ALT7 or TNativePin.PB8  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB11_USART3= ALT7 or TNativePin.PB11 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC11_USART3= ALT7 or TNativePin.PC11 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)}, PD6_USART2 = ALT7 or TNativePin.PD6  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)}, PD9_USART3 = ALT7 or TNativePin.PD9  {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },  DEBUG_UART= ALT7 or TNativePin.PD9  {$endif}
    {$if defined(has_UART4)  and defined(has_gpioa)}, PA1_UART4  = ALT8 or TNativePin.PA1  {$endif}
    {$if defined(has_UART5)  and defined(has_gpiob)}, PB12_UART5 = ALT8 or TNativePin.PB12 {$endif}
    {$if defined(has_USART6) and defined(has_gpioc)}, PC7_USART6 = ALT8 or TNativePin.PC7  {$endif}
    {$if defined(has_UART4)  and defined(has_gpioc)}, PC11_UART4 = ALT8 or TNativePin.PC11 {$endif}
    {$if defined(has_UART4)  and defined(has_gpiod)}, PD0_UART4  = ALT8 or TNativePin.PD0  {$endif}
    {$if defined(has_UART5)  and defined(has_gpiod)}, PD2_UART5  = ALT8 or TNativePin.PD2  {$endif}
    {$if defined(has_UART8)  and defined(has_gpioe)}, PE0_UART8  = ALT8 or TNativePin.PE0  {$endif}
    {$if defined(has_UART7)  and defined(has_gpioe)}, PE7_UART7  = ALT8 or TNativePin.PE7  {$endif}
    {$if defined(has_UART7)  and defined(has_gpiof)}, PF6_UART7  = ALT8 or TNativePin.PF6  {$endif}
    {$if defined(has_USART6) and defined(has_gpiog)}, PG9_USART6 = ALT8 or TNativePin.PG9  {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },   D0_UART  =  ALT8 or TNativePin.PG9 {$endif}
    {$if defined(has_UART4)  and defined(has_gpioh)}, PH14_UART4 = ALT8 or TNativePin.PH14 {$endif}
    {$if defined(has_UART4)  and defined(has_gpioi)}, PI9_UART4  = ALT8 or TNativePin.PI9  {$endif}
    {$if defined(has_UART7)  and defined(has_gpioa)}, PA8_UART7  = ALT12 or TNativePin.PA8 {$endif}
    {$if defined(has_UART7)  and defined(has_gpiob)}, PB3_UART7  = ALT12 or TNativePin.PB3 {$endif}
  );
  TUARTTXPins = (
    NONE_USART = TNativePin.None
    {$if defined(has_UART5)  and defined(has_gpiob)}, PB6_UART5  = ALT1 or TNativePin.PB6  {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)}, PB14_USART1= ALT4 or TNativePin.PB14 {$endif}
    {$if defined(has_UART4)  and defined(has_gpioa)}, PA12_UART4 = ALT6 or TNativePin.PA12 {$endif}
    {$if defined(has_USART2) and defined(has_gpioa)}, PA2_USART2 = ALT7 or TNativePin.PA2  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa)}, PA9_USART1 = ALT7 or TNativePin.PA9  {$endif}
    {$if defined(has_USART1) and defined(has_gpiob)}, PB6_USART1 = ALT7 or TNativePin.PB6  {$endif}
    {$if defined(has_UART5)  and defined(has_gpiob)}, PB9_UART5  = ALT7 or TNativePin.PB9  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob)}, PB10_USART3= ALT7 or TNativePin.PB10 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc)}, PC10_USART3= ALT7 or TNativePin.PC10 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod)}, PD5_USART2 = ALT7 or TNativePin.PD5  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod)}, PD8_USART3 = ALT7 or TNativePin.PD8  {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },  DEBUG_UART= ALT7 or TNativePin.PD8  {$endif}
    {$if defined(has_UART4)  and defined(has_gpioa)}, PA0_UART4  = ALT8 or TNativePin.PA0  {$endif}
    {$if defined(has_UART5)  and defined(has_gpiob)}, PB13_UART5 = ALT8 or TNativePin.PB13 {$endif}
    {$if defined(has_USART6) and defined(has_gpioc)}, PC6_USART6 = ALT8 or TNativePin.PC6  {$endif}
    {$if defined(has_UART4)  and defined(has_gpioc)}, PC10_UART4 = ALT8 or TNativePin.PC10 {$endif}
    {$if defined(has_UART5)  and defined(has_gpioc)}, PC12_UART5 = ALT8 or TNativePin.PC12 {$endif}
    {$if defined(has_UART4)  and defined(has_gpiod)}, PD1_UART4  = ALT8 or TNativePin.PD1  {$endif}
    {$if defined(has_UART8)  and defined(has_gpioe)}, PE1_UART8  = ALT8 or TNativePin.PE1  {$endif}
    {$if defined(has_UART7)  and defined(has_gpioe)}, PE8_UART7  = ALT8 or TNativePin.PE8  {$endif}
    {$if defined(has_UART7)  and defined(has_gpiof)}, PF7_UART7  = ALT8 or TNativePin.PF7  {$endif}
    {$if defined(has_USART6) and defined(has_gpiog)}, PG14_USART6= ALT8 or TNativePin.PG14 {$endif}
    {$if defined(HAS_ARDUINOPINS)                  },   D1_UART  = ALT8 or TNativePin.PG14 {$endif}
    {$if defined(has_UART4)  and defined(has_gpioh)}, PH13_UART4 = ALT8 or TNativePin.PH13 {$endif}
    {$if defined(has_UART7)  and defined(has_gpioa)}, PA15_UART7 = ALT12 or TNativePin.PA15{$endif}
    {$if defined(has_UART7)  and defined(has_gpiob)}, PB4_UART7  = ALT12 or TNativePin.PB4 {$endif}
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
    APB1orAPB2 = %00,
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

{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART6_BASE;
  DEBUG_UART : TUART_Registers absolute USART3_BASE;
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
    USART1_BASE : Result :=  TUARTClockSource(GetCrumb(RCC.DCKCFGR2,0));
    USART2_BASE : Result :=  TUARTClockSource(GetCrumb(RCC.DCKCFGR2,2));
    {$ifdef has_usart3}USART3_BASE : Result := TUARTClockSource(GetCrumb(RCC.DCKCFGR2,4));{$endif}
    {$ifdef has_uart4} UART4_BASE : Result := TUARTClockSource(GetCrumb(RCC.DCKCFGR2,6));{$endif}
    {$ifdef has_uart5} UART5_BASE : Result := TUARTClockSource(GetCrumb(RCC.DCKCFGR2,8));{$endif}
    {$ifdef has_usart6}USART6_BASE : Result := TUARTClockSource(GetCrumb(RCC.DCKCFGR2,10));{$endif}
    {$ifdef has_uart7} UART7_BASE : Result := TUARTClockSource(GetCrumb(RCC.DCKCFGR2,12));{$endif}
    {$ifdef has_uart8} UART8_BASE : Result := TUARTClockSource(GetCrumb(RCC.DCKCFGR2,14));{$endif}
  end;
end;

procedure TUARTRegistersHelper.SetClockSource(const Value : TUARTClockSource);
begin
  case longWord(@self) of
    USART1_BASE : SetCrumb(RCC.DCKCFGR2,longWord(Value),0);
    USART2_BASE : SetCrumb(RCC.DCKCFGR2,longWord(Value),2);
    {$ifdef has_usart3}USART3_BASE : SetCrumb(RCC.DCKCFGR2,longWord(Value),4);{$endif}
    {$ifdef has_uart4} UART4_BASE  : SetCrumb(RCC.DCKCFGR2,longWord(Value),6);{$endif}
    {$ifdef has_uart5} UART5_BASE  : SetCrumb(RCC.DCKCFGR2,longWord(Value),8) ;{$endif}
    {$ifdef has_usart6}USART6_BASE : SetCrumb(RCC.DCKCFGR2,longWord(Value),10);{$endif}
    {$ifdef has_uart7} UART7_BASE  : SetCrumb(RCC.DCKCFGR2,longWord(Value),12);{$endif}
    {$ifdef has_uart8} UART8_BASE  : SetCrumb(RCC.DCKCFGR2,longWord(Value),14);{$endif}
  end;
end;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  case longWord(@Self) of
    USART1_BASE : setBit(RCC.APB2ENR,4);
    USART2_BASE : setBit(RCC.APB1ENR,17);
    {$ifdef has_usart3}USART3_BASE : setBit(RCC.APB1ENR,18);{$endif}
    {$ifdef has_uart4}  UART4_BASE : setBit(RCC.APB1ENR,19);{$endif}
    {$ifdef has_uart5}  UART5_BASE : setBit(RCC.APB1ENR,20);{$endif}
    {$ifdef has_usart6}USART6_BASE : setBit(RCC.APB2ENR,5);{$endif}
    {$ifdef has_uart7}  UART7_BASE : setBit(RCC.APB1ENR,30);{$endif}
    {$ifdef has_uart8}  UART8_BASE : setBit(RCC.APB1ENR,31);{$endif}
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
    TUARTClockSource.APB1orAPB2 : if (longWord(@self) = USART1_BASE) or (longWord(@self) = USART6_BASE) then ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency
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
      TUARTClockSource.APB1orAPB2 : if (longWord(@self) = USART1_BASE) or (longWord(@self) = USART6_BASE) then ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency
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

