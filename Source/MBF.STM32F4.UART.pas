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
type
  TUARTRXPins = (
    {$if defined(has_USART2) and defined(has_gpioa) }   PA3_USART2 = ALT7 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOPINS)                   },   D0_UART   = ALT7 or TNativePin.PA3  {$endif}
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
    Two=%10
  );

  TUARTRegistersHelper = record helper for TUART_Registers
  private
    function GetBaudRate: Cardinal;
    procedure SetBaudRate(const Value: Cardinal);
    function GetBitsPerWord: TUARTBitsPerWord;
    procedure SetBitsPerWord(const Value: TUARTBitsPerWord);
    function GetParity: TUARTParity;
    procedure SetParity(const Value: TUARTParity);
    function GetStopBits: TUARTStopBits;
    procedure SetStopBits(const Value: TUARTStopBits);
    procedure SetRxPin(const Value : TUARTRXPins);
    procedure SetTxPin(const Value : TUARTTXPins);
    function ReadBuffer(aReadBuffer: Pointer; aReadCount : integer; TimeOut: Cardinal=0): Cardinal;
    function WriteBuffer(const aWriteBuffer: Pointer; aWriteCount : integer; TimeOut: Cardinal=0): Cardinal;

  public
    procedure initialize;
    procedure initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins;aBaudRate : Cardinal = 115200);
    procedure Disable;
    procedure Flush;

    function ReadByte(var aReadByte: byte; const Timeout : Cardinal=0):boolean;
    function ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0):boolean;

    function WriteByte(const aWriteByte: byte; const Timeout : Cardinal=0) : boolean;
    function WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : Cardinal=0) : boolean;

    { Reads string from UART (serial) port.
      @param(Text String that will hold the incoming data.)
      @param(MaxCharacters Maximum number of characters to read. Once this number of characters has been read, the
        function immediately returns, even if there is more data to read. When this parameter is set to zero, then
        the function will continue to read the data, depending on value of @code(Timeout).)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to read the buffer. If this parameter
        is set to zero, then the function will read only as much data as fits in readable FIFO buffers (or fail when
        such buffers are not supported).)
      @returns(Number of bytes that were actually read.) }
    function ReadString(var aReadString: String; aReadCount: Integer = -1;
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
  end;

{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART2_BASE;
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

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins; aBaudRate : Cardinal = 115200);
begin
  Initialize;
  SetBaudRate(115200);
  setRxPin(ARxPin);
  setTxPin(ATxPin);
end;

procedure TUARTRegistersHelper.SetRxPin(const Value : TUARTRXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
end;

procedure TUARTRegistersHelper.SetTxPin(const Value : TUARTTXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
end;

procedure TUARTRegistersHelper.Disable;
begin
  case longWord(@Self) of
    USART1_BASE : RCC.APB2ENR := RCC.APB2ENR and not (1 shl 4);
    USART2_BASE : RCC.APB1ENR := RCC.APB1ENR and not (1 shl 17);
    {$ifdef has_uart3}USART3_BASE : RCC.APB1ENR := RCC.APB1ENR and not (1 shl 18);{$endif}
    {$ifdef has_uart4}UART4_BASE : RCC.APB1ENR := RCC.APB1ENR and not (1 shl 19);{$endif}
    {$ifdef has_uart5}UART5_BASE : RCC.APB1ENR := RCC.APB1ENR and not (1 shl 20);{$endif}
    {$ifdef has_uart6}USART6_BASE : RCC.APB2ENR := RCC.APB2ENR and not (1 shl 5);{$endif}
    {$ifdef has_uart7}USART7_BASE : xRCC.APB1ENR := RCC.APB1ENR and not (1 shl xx);{$endif}//TODO set Bits
    {$ifdef has_uart8}USART8_BASE : xRCC.APB1ENR := RCC.APB1ENR and not (1 shl xx);{$endif}//TODO set Bits
  end;
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

  setBaudRate(DefaultUARTBaudRate);
  // UE Enable UART
  self.CR1 := self.CR1 or (1 shl 13);
  // RE TE Enable both receiver and sender
  self.CR1 := self.CR1 or (1 shl 2) or (1 shl 3);
end;

function TUARTRegistersHelper.GetBaudRate: Cardinal;
begin
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: Cardinal);
var
  ClockFreq,Mantissa,Fraction : longWord;
  reactivate : boolean = false;
begin
    // set Baudrate
    // UE disable Serial interface
    if self.CR1 and (1 shl 13) = 1 then
    begin
      self.CR1 := self.CR1 and not(1 shl 13);
      reactivate := true;
    end;
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
    if self.CR1 and not(1 shl 15) = 0 then
    begin
      Mantissa := ClockFreq div (Value shl 4);
      Fraction := longWord(longWord(longWord(ClockFreq - Mantissa*16*Value)*100 div longWord(Value shl 4)) shl 4+50) div 100;
    end
    else
    begin
      Mantissa := ((ClockFreq*25) div (2*Value)) div 100;
      Fraction := (longWord(((((ClockFreq*25) div (2*Value)) - Mantissa*100)*16+50) div 100) and $0f) div 2;
    end;
    self.BRR := Mantissa shl 4 or Fraction;
    if reactivate = true then
      self.CR1 := self.CR1 or (1 shl 13);
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord((Self.BRR shr 12) and %1);
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
begin
  Self.BRR := Self.BRR and (not (1 shl 12)) or (longWord(Value) shl 12);
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  Result := TUARTParity((Self.BRR shr 9) and %11);
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
begin
  Self.BRR := Self.BRR and (not (%11 shl 9)) or (longWord(Value) shl 9);
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits.One;
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
begin
  //Nothing to do here
end;

procedure TUARTRegistersHelper.Flush;
begin
  //LPC_UART.IIR_FCR := $07;
end;

function TUARTRegistersHelper.ReadBuffer(aReadBuffer: Pointer; aReadCount : integer; TimeOut: Cardinal=0): longWord;
var
  StartTime : longWord;
begin
  Result := 0;
  StartTime := SystemCore.GetTickCount;

  while (Result < aReadCount) do
  begin
    while self.SR and (1 shl 5) = 0 do
    begin
      if TimeOut <> -1 then
      begin
        if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
          Exit;
      end;
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
  StartTime : longWord;
begin

  Result := 0;
  StartTime := SystemCore.GetTickCount;

  while Result < aWriteCount do
  begin
    //TXE
    while self.SR and (1 shl 7) = 0 do
    begin
      if TimeOut <> 0 then
      begin
        if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
          Exit;
      end;
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
  //TXE
  while self.SR and (1 shl 7) = 0 do
  begin
    if TimeOut <> -1 then
    begin
      if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
        Exit;
    end;
  end;
end;

function TUARTRegistersHelper.ReadByte(var aReadByte: byte; const Timeout : Cardinal=0):boolean;
var
  aReadCount : integer;
begin
  aReadCount := ReadBuffer(@aReadByte,1,TimeOut);
  Result := aReadCount=1;
end;

function TUARTRegistersHelper.ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0):boolean;
begin
  if aReadCount = -1 then
    aReadCount := High(aReadBuffer)-Low(aReadBuffer);
  aReadCount := ReadBuffer(@aReadBuffer,aReadCount,TimeOut);
  //TODO This does not compile !!!???!!!
  //if aReadCount >0 then
  //  SetLength(aReadBuffer,aReadCount);
  Result := aReadCount > 0;
end;

function TUARTRegistersHelper.WriteByte(const aWriteByte: byte; const Timeout : Cardinal=0) : boolean;
begin
  if WriteBuffer(@aWriteByte,1,TimeOut) >0 then
    Result := true
  else
    Result := false;
end;

function TUARTRegistersHelper.WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : Cardinal=0) : boolean;
begin
  if aWriteCount = -1 then
    aWriteCount := High(aWriteBuffer)-Low(aWriteBuffer);
  result := aWriteCount = WriteBuffer(@aWriteBuffer,aWriteCount,TimeOut);
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; aReadCount: integer = -1;
  const Timeout: Cardinal = 0): Boolean;
begin
  //TODO
  aReadString := '';
  Result := false;
end;

function TUARTRegistersHelper.WriteString(const aWriteString: String; const Timeout: Cardinal = 0): Boolean;
begin
  Result := length(aWriteString) = WriteBuffer(@aWriteString[1],length(aWriteString),TimeOut);
end;

{$ENDREGION}

end.

