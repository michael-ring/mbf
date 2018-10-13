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

{< ST Micro F4xx board series functions. }
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32F4.GPIO;

type
  TUART_Registers = TUSART_Registers;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
  DefaultUARTTimeout=10000;
type
  TUARTRXPins = (
    {$if defined(has_USART2) and defined(has_gpioa) }   PA3_USART2 = ALT7 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },   D0_UART   = ALT7 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },   DEBUG_UART= ALT7 or TNativePin.PA3  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa) }, PA10_USART1 = ALT7 or TNativePin.PA10 {$endif}
    {$if defined(has_USART1) and defined(has_gpiob) },  PB3_USART1 = ALT7 or TNativePin.PB3  {$endif}
    {$if defined(has_USART1) and defined(has_gpiob) },  PB7_USART1 = ALT7 or TNativePin.PB7  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob) }, PB11_USART3 = ALT7 or TNativePin.PB11 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc) },  PC5_USART3 = ALT7 or TNativePin.PC5  {$endif}
    {$if defined(has_USART3) and defined(has_gpioc) }, PC11_USART3 = ALT7 or TNativePin.PC11 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod) },  PD6_USART2 = ALT7 or TNativePin.PD6  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod) },  PD9_USART3 = ALT7 or TNativePin.PD9  {$endif}
    {$if defined(has_UART4 ) and defined(has_gpioa) },  PA1_UART4  = ALT8 or TNativePin.PA1  {$endif}
    {$if defined(has_USART6) and defined(has_gpioa) }, PA12_USART6 = ALT8 or TNativePin.PA12 {$endif}
    {$if defined(has_USART6) and defined(has_gpioc) },  PC7_USART6 = ALT8 or TNativePin.PC7  {$endif}
    {$if defined(has_UART4 ) and defined(has_gpioc) }, PC11_UART4  = ALT8 or TNativePin.PC11 {$endif}
    {$if defined(has_UART5 ) and defined(has_gpiod) },  PD2_UART5  = ALT8 or TNativePin.PD2  {$endif}
    {$if defined(has_UART8 ) and defined(has_gpioe) },  PE0_UART8  = ALT8 or TNativePin.PE0  {$endif}
    {$if defined(has_UART5 ) and defined(has_gpioe) },  PE7_UART5  = ALT8 or TNativePin.PE7  {$endif}
    {$if defined(has_UART7 ) and defined(has_gpioe) },  PE7_UART7  = ALT8 or TNativePin.PE7  {$endif}
    {$if defined(has_UART7 ) and defined(has_gpiof) },  PF6_UART7  = ALT8 or TNativePin.PF6  {$endif}
    {$if defined(has_USART6) and defined(has_gpiog) },  PG9_USART6 = ALT8 or TNativePin.PG9  {$endif}
    );

  TUARTTXPins = (
    {$if defined(has_USART2) and defined(has_gpioa) }   PA2_USART2 = ALT7 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },   D1_UART   = ALT7 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },   DEBUG_UART= ALT7 or TNativePin.PA2  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa) },  PA9_USART1 = ALT7 or TNativePin.PA9  {$endif}
    {$if defined(has_USART1) and defined(has_gpioa) }, PA15_USART1 = ALT7 or TNativePin.PA15 {$endif}
    {$if defined(has_USART1) and defined(has_gpiob) },  PB6_USART1 = ALT7 or TNativePin.PB6  {$endif}
    {$if defined(has_USART3) and defined(has_gpiob) }, PB10_USART3 = ALT7 or TNativePin.PB10 {$endif}
    {$if defined(has_USART3) and defined(has_gpioc) }, PC10_USART3 = ALT7 or TNativePin.PC10 {$endif}
    {$if defined(has_USART2) and defined(has_gpiod) },  PD5_USART2 = ALT7 or TNativePin.PD5  {$endif}
    {$if defined(has_USART3) and defined(has_gpiod) },  PD8_USART3 = ALT7 or TNativePin.PD8  {$endif}
    {$if defined(has_UART4 ) and defined(has_gpioa) },  PA0_UART4  = ALT8 or TNativePin.PA0  {$endif}
    {$if defined(has_USART6) and defined(has_gpioa) }, PA11_USART6 = ALT8 or TNativePin.PA11 {$endif}
    {$if defined(has_USART6) and defined(has_gpioc) },  PC6_USART6 = ALT8 or TNativePin.PC6  {$endif}
    {$if defined(has_UART4 ) and defined(has_gpioc) }, PC10_UART4  = ALT8 or TNativePin.PC10 {$endif}
    {$if defined(has_UART5 ) and defined(has_gpioc) }, PC12_UART5  = ALT8 or TNativePin.PC12 {$endif}
    {$if defined(has_UART8 ) and defined(has_gpioe) },  PE1_UART8  = ALT8 or TNativePin.PE1  {$endif}
    {$if defined(has_UART5 ) and defined(has_gpioe) },  PE8_UART5  = ALT8 or TNativePin.PE8  {$endif}
    {$if defined(has_UART7 ) and defined(has_gpioe) },  PE8_UART7  = ALT8 or TNativePin.PE8  {$endif}
    {$if defined(has_UART7 ) and defined(has_gpiof) },  PF7_UART7  = ALT8 or TNativePin.PF7  {$endif}
    {$if defined(has_USART6) and defined(has_gpiog) }, PG14_USART6 = ALT8 or TNativePin.PG14 {$endif}
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
    function  GetBaudRate: Cardinal;
    procedure SetBaudRate(const aBaudrate: Cardinal);
    function  GetBitsPerWord: TUARTBitsPerWord;
    procedure SetBitsPerWord(const aBitsPerWord: TUARTBitsPerWord);
    function  GetParity: TUARTParity;
    procedure SetParity(const aParity: TUARTParity);
    function  GetStopBits: TUARTStopBits;
    procedure SetStopBits(const aStopbit: TUARTStopBits);
    procedure SetRxPin(const aRxPin : TUARTRXPins);
    procedure SetTxPin(const aTxPin : TUARTTXPins);
    function  GetClockSource : TUARTClockSource;
    procedure SetClockSource(const aClockSource : TUARTClockSource);


  public
    procedure initialize;
    procedure initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins;aBaudRate : Cardinal = 115200);
    function Disable : boolean;
    procedure Enable;

    function ReadBuffer(aReadBuffer: Pointer; aReadCount : integer; TimeOut: Cardinal=0): Cardinal;
    function WriteBuffer(const aWriteBuffer: Pointer; aWriteCount : integer; TimeOut: Cardinal=0): Cardinal;

    function ReadByte(var aReadByte: byte; const Timeout : Cardinal=0):boolean;
    function ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0):boolean;

    function WriteByte(const aWriteByte: byte; const Timeout : Cardinal=0) : boolean;
    function WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : Cardinal=0) : boolean;

    function ReadString(var aReadString: String; aReadCount: Integer = -1;
      const Timeout: Cardinal = 0): Boolean;
    function ReadString(var aReadString: String; const aDelimiter : char;
      const Timeout: Cardinal = 0): Boolean;

    { Writes string to UART (serial) port.
        @param(Text String that should be sent.)
        @param(Timeout Maximum time (in milliseconds) to wait while attempting to write the buffer. If this parameter
          is set to zero, then the function will write only what fits in writable FIFO buffers (or fail when such
          buffers are not supported).)
        @returns(Number of bytes that were actually read.) }
    function WriteString(const aWriteString: String; const Timeout: cardinal = 0): Boolean;

    property BaudRate : Cardinal read getBaudRate write setBaudRate;
    property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
    property Parity : TUARTParity read getParity write setParity;
    property StopBits : TUARTStopBits read getStopBits write setStopBits;
    property RxPin : TUARTRxPins write setRxPin;
    property TxPin : TUARTTxPins write setTxPin;
    property ClockSource : TUARTClockSource read getClockSource write setClockSource;
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
  MBF.STM32F4.SystemCore;

function TUARTRegistersHelper.getClockSource : TUARTClockSource;
begin
  //No choice on STM32F401 family
  Result := TUARTClockSource.APB1orAPB2;
end;

procedure TUARTRegistersHelper.setClockSource(const aClockSource : TUARTClockSource);
begin
  //No choice on STM32F401 family
end;

procedure TUARTRegistersHelper.Initialize;
begin
  case longWord(@Self) of
    USART1_BASE : RCC.APB2ENR := RCC.APB2ENR or (1 shl 4);
    USART2_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 17);
    {$ifdef has_uart3}USART3_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 18);{$endif}
    {$ifdef has_uart4}UART4_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 19);{$endif}
    {$ifdef has_uart5}UART5_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 20);{$endif}
    {$ifdef has_uart6}USART6_BASE : RCC.APB2ENR := RCC.APB2ENR or (1 shl 5);{$endif}
    {$ifdef has_uart7}USART7_BASE : xRCC.APB1ENR := RCC.APB1ENR or (1 shl xx);{$endif}//TODO set Bits
    {$ifdef has_uart8}USART8_BASE : xRCC.APB1ENR := RCC.APB1ENR or (1 shl xx);{$endif}//TODO set Bits
  end;
  // First, load Reset Value, this also turns off the UART
  // Create the basic config for all n81 use cases
  self.CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  self.CR2:= 0;

  // Set Defaults not RTS/CTS
  self.CR3:= 0;

  // RE TE Enable both receiver and sender
  self.CR1 := self.CR1 or (1 shl 2) or (1 shl 3);
end;


procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins; aBaudRate : Cardinal = 115200);
begin
  Initialize;
  SetBaudRate(DefaultUARTBaudrate);
  setRxPin(ARxPin);
  setTxPin(ATxPin);
  Enable;
end;


procedure TUARTRegistersHelper.SetRxPin(const aRxPin : TUARTRXPins);
begin
  GPIO.PinMode[longWord(aRxPin) and $ff] := TPinMode((longWord(aRxPin) shr 8));
end;

procedure TUARTRegistersHelper.SetTxPin(const aTxPin : TUARTTXPins);
begin
  GPIO.PinMode[longWord(aTxPin) and $ff] := TPinMode((longWord(aTxPin) shr 8));
end;

function TUARTRegistersHelper.Disable:boolean;
begin
  Result := self.CR1 and (1 shl 13) > 0;
  self.CR1 := self.CR1 and (not(1 shl 13));
end;

procedure TUARTRegistersHelper.Enable;
begin
  self.CR1 := self.CR1 or (1 shl 13);
end;

function TUARTRegistersHelper.GetBaudRate: Cardinal;
var
  ClockFreq : longWord;
begin
  case longWord(@self) of
    USART1_BASE : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;
    USART2_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
    {$ifdef has_uart3}USART3_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart4}UART4_BASE :  ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart5}UART5_BASE :  ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart6}USART6_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_uart7}USART7_BASE : xClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}//TODO set Bits
    {$ifdef has_uart8}USART8_BASE : xClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}//TODO set Bits
  end;

  if self.CR1 and (1 shl 15) = 0 then
    Result := ClockFreq div BRR
  else
    Result := ClockFreq div (((BRR shr 1) and ( not %111)) or (BRR and %111));
end;

procedure TUARTRegistersHelper.SetBaudRate(const aBaudrate: Cardinal);
var
  ClockFreq,Mantissa,Fraction : longWord;
  reactivate : boolean;
begin
    // UE disable Serial interface
    reactivate := Disable;
    case longWord(@self) of
      USART1_BASE : ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency;
      USART2_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
      {$ifdef has_uart3}USART3_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
      {$ifdef has_uart4}UART4_BASE :  ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
      {$ifdef has_uart5}UART5_BASE :  ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
      {$ifdef has_uart6}USART6_BASE : ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
      {$ifdef has_uart7}USART7_BASE : xClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}//TODO set Bits
      {$ifdef has_uart8}USART8_BASE : xClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}//TODO set Bits
    end;
    //OVER8
    if self.CR1 and (1 shl 15) = 0 then
    begin
      Mantissa := ClockFreq div (aBaudrate shl 4);
      Fraction := longWord(longWord(longWord(ClockFreq - Mantissa*16*aBaudrate)*100 div longWord(aBaudRate shl 4)) shl 4+50) div 100;
    end
    else
    begin
      Mantissa := ((ClockFreq*25) div (2*aBaudrate)) div 100;
      Fraction := (longWord(((((ClockFreq*25) div (2*aBaudrate)) - Mantissa*100)*16+50) div 100) and $0f) div 2;
    end;
    self.BRR := Mantissa shl 4 or Fraction;
    if reactivate = true then
      Enable;
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord((Self.BRR shr 12) and %1);
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const aBitsPerWord: TUARTBitsPerWord);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  Self.BRR := Self.BRR and (not (1 shl 12)) or (longWord(aBitsPerWord) shl 12);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  Result := TUARTParity((Self.BRR shr 9) and %11);
end;

procedure TUARTRegistersHelper.SetParity(const aParity: TUARTParity);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  Self.BRR := Self.BRR and (not (%11 shl 9)) or (longWord(aParity) shl 9);
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits((CR2 shr 12) and %11);
end;

procedure TUARTRegistersHelper.SetStopBits(const aStopbit: TUARTStopBits);
var
  ReEnable : boolean;
begin
  ReEnable := Disable;
  CR2 := CR2 and (not (%11 shl 12)) or longWord(aStopBit) shl 12;
  if ReEnable then
    Enable;
end;

function TUARTRegistersHelper.ReadBuffer(aReadBuffer: Pointer; aReadCount : integer; TimeOut: Cardinal=0): longWord;
var
  EndTime : longWord;
begin
  Result := 0;
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  while (Result < aReadCount) do
  begin
    while self.SR and (1 shl 5) = 0 do
    begin
      if SystemCore.GetTickCount > EndTime then
        Exit;
    end;
    if GetBitsPerWord = TUARTBitsPerWord.Eight then
      PByte(PByte(aReadBuffer) + Result)^ := self.DR
    else
    begin
      PWord(PByte(aReadBuffer) + Result)^ := self.DR;
      inc(Result);
    end;
    Inc(Result);
  end;
end;

function TUARTRegistersHelper.WriteBuffer(const aWriteBuffer: Pointer; aWriteCount : Integer; TimeOut: Cardinal=0): Cardinal;
var
  EndTime : longWord;
begin
  Result := 0;
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  while Result < aWriteCount do
  begin
    //TXE
    while self.SR and (1 shl 7) = 0 do
    begin
      if SystemCore.GetTickCount > EndTime then
        Exit;
    end;
    if GetBitsPerWord = TUARTBitsPerWord.Eight then
      self.DR := PByte(pByte(aWriteBuffer) + Result)^
    else
    begin
      inc(Result);
      self.DR := pword(pword(WriteBuffer) + Result)^
    end;
    Inc(Result);
  end;
end;

function TUARTRegistersHelper.ReadByte(var aReadByte: byte; const Timeout : Cardinal=0):boolean;
var
  EndTime : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    if self.SR and (1 shl 5) <> 0 then
    begin
      aReadByte := DR;
      result := true;
      exit;
    end;
  until (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0):boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : integer;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  i := Low(aReadBuffer);
  repeat
    if self.SR and (1 shl 5) <> 0 then
    begin
      aReadBuffer[i] := DR;
      inc(i);
      if i > high(aReadBuffer) then
      begin
        result := true;
        exit;
      end;
    end;
  until (SystemCore.GetTickCount > EndTime);
  //TODO: SetLength does not work
  //if result = false then
    //setLength(aReadBuffer,i-1-Low(aReadBuffer));
end;

function TUARTRegistersHelper.WriteByte(const aWriteByte: byte; const Timeout : Cardinal=0) : boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    //Wait for TXE (Transmit Data Register Empty) to go high
    if self.SR and (1 shl 7) <> 0 then
    begin
      DR := aWriteByte;
      result := true;
      exit;
    end;
  until (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : Cardinal=0) : boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  i := low(aWriteBuffer);
  begin
    repeat
      //Wait for TXE (Transmit Data Register Empty) to go high
      if self.SR and (1 shl 7) <> 0 then
      begin
        DR := aWriteBuffer[i];
        inc(i);
        if i > high(aWriteBuffer) then
        begin
          result := true;
          exit;
        end;
      end;
    until (SystemCore.GetTickCount > EndTime);
  end;
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; aReadCount: integer = -1;
  const Timeout: Cardinal = 0): Boolean;
var
  EndTime : longWord;
  i : integer;
begin
  Result := false;
  aReadString := '';
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;
  i := 1;
  repeat
    if self.SR and (1 shl 5) <> 0 then
    begin
      aReadString := aReadString + char(DR);
      inc(i);
      if i >aReadCount then
      begin
        result := true;
        exit;
      end;
    end;
  until (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; const aDelimiter: char;
  const Timeout: Cardinal = 0): Boolean;
var
  EndTime : longWord;
  charRead : char;
begin
  Result := false;
  aReadString := '';
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    if self.SR and (1 shl 5) <> 0 then
    begin
      charRead := char(DR);
      aReadString := aReadString + charread;
      if charRead = aDelimiter then
      begin
        result := true;
        exit;
      end;
    end;
  until (SystemCore.GetTickCount > EndTime);
end;

function TUARTRegistersHelper.WriteString(const aWriteString: String; const Timeout: Cardinal = 0): Boolean;
var
  EndTime : longWord;
  DataRead : byte;
  i : longWord;
begin
  Result := false;
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  i := 1;
  begin
    repeat
      //Wait for TXE (Transmit Data Register Empty) to go high
      if self.SR and (1 shl 7) <> 0 then
      begin
        DR := byte(aWriteString[i]);
        inc(i);
        if i > length(aWriteString) then
        begin
          result := true;
          exit;
        end;
      end;
    until (SystemCore.GetTickCount > EndTime);
  end;
end;

{$ENDREGION}

end.

