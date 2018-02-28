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
{< ST Micro F1xx board series functions. }
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32F1.GPIO;

type
  TUART_Registers = TUSART_Registers;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
type
  TUARTRXPins = (
    {$if defined(has_USART2 ) and defined(has_gpioa) }   PA3_USART2  = ALT0 or TNativePin.PA3  {$endif}
    {$if defined(HAS_ARDUINOPINS)                    },   D0_UART    = ALT0 or TNativePin.PA3  {$endif}
    {$if defined(has_USART1 ) and defined(has_gpioa) }, PA10_USART1  = ALT0 or TNativePin.PA10 {$endif}
    {$if defined(has_USART1 ) and defined(has_gpiob) },  PB7_USART1  = ALT1 or TNativePin.PB7  {$endif}
    {$if defined(has_USART3 ) and defined(has_gpiob) }, PB11_USART3  = ALT0 or TNativePin.PB11 {$endif}
    {$if defined(has_USART3 ) and defined(has_gpioc) }, PC11_USART3  = ALT1 or TNativePin.PC11 {$endif}
    {$if defined(has_USART2 ) and defined(has_gpiod) },  PD6_USART2  = ALT1 or TNativePin.PD6  {$endif}
    {$if defined(has_USART3 ) and defined(has_gpiod) },  PD9_USART3  = ALT3 or TNativePin.PD9  {$endif}
  );
  TUARTTXPins = (
    {$if defined(has_USART2 ) and defined(has_gpioa) }   PA2_USART2  = ALT0 or TNativePin.PA2  {$endif}
    {$if defined(HAS_ARDUINOPINS)                    },   D1_UART    = ALT0 or TNativePin.PA2  {$endif}
    {$if defined(has_USART1 ) and defined(has_gpioa) },  PA9_USART1  = ALT0 or TNativePin.PA9  {$endif}
    {$if defined(has_USART1 ) and defined(has_gpiob) },  PB6_USART1  = ALT1 or TNativePin.PB6  {$endif}
    {$if defined(has_USART3 ) and defined(has_gpiob) }, PB10_USART3  = ALT0 or TNativePin.PB10 {$endif}
    {$if defined(has_USART3 ) and defined(has_gpioc) }, PC10_USART3  = ALT1 or TNativePin.PC10 {$endif}
    {$if defined(has_USART2 ) and defined(has_gpiod) },  PD5_USART2  = ALT1 or TNativePin.PD5  {$endif}
    {$if defined(has_USART3 ) and defined(has_gpiod) },  PD8_USART3  = ALT3 or TNativePin.PD8  {$endif}
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
    //procedure SetClockSource(const Value : TUARTClockSource);
    function GetClockSource : TUARTClockSource;
  public
    procedure initialize;
    procedure initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
    procedure TearDown;
    procedure Flush;

    { Reads data buffer from UART (serial) port.
      @param(Buffer Pointer to data buffer where the data will be written to.)
      @param(BufferSize Number of bytes to read.)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to read the buffer. If this parameter is
        set to zero, then the function will block indefinitely, attempting to read until the specified number of
        bytes have been read.)
      @returns(Number of bytes that were actually read.) }
    function ReadBuffer(const Buffer: Pointer; const BufferSize,TimeOut: Cardinal): Cardinal;

    { Writes data buffer to UART (serial) port.
      @param(Buffer Pointer to data buffer where the data will be read from.)
      @param(BufferSize Number of bytes to write.)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to write the buffer. If this parameter
        is set to zero, then the function will block indefinitely, attempting to write until the specified number of
        bytes have been written.)
      @returns(Number of bytes that were actually written.) }
    function WriteBuffer(const Buffer: Pointer; const BufferSize,TimeOut: Cardinal): Cardinal;

    { Attempts to read a byte from UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to wait
      while attempting to do so; if this parameter is set to zero, then the function will block indefinitely until the
      byte has been read. @True is returned when the operation was successful and @False when the byte could not be
      read. }
    function ReadByte(out Value: Byte; const Timeout: Cardinal = 0): Boolean; inline;

    { Attempts to write a byte to UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to wait
      while attempting to do so; if this parameter is set to zero, then the function will block indefinitely until the
      byte has been written. @True is returned when the operation was successful and @False when the byte could not be
      written. }
    function WriteByte(const Value: Byte; const Timeout: Cardinal = 0): Boolean; inline;

    { Attempts to write multiple bytes to UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to
      wait while attempting to do so; if this parameter is set to zero, then the function will block indefinitely,
      attempting to write until the specified bytes have been written. @True is returned when the operation was
      successful and @False when not all bytes could be written. }
    function WriteBytes(const Values: array of Byte; const Timeout: Cardinal = 0): Boolean;

    { Reads string from UART (serial) port.
      @param(Text String that will hold the incoming data.)
      @param(MaxCharacters Maximum number of characters to read. Once this number of characters has been read, the
        function immediately returns, even if there is more data to read. When this parameter is set to zero, then
        the function will continue to read the data, depending on value of @code(Timeout).)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to read the buffer. If this parameter
        is set to zero, then the function will read only as much data as fits in readable FIFO buffers (or fail when
        such buffers are not supported).)
      @returns(Number of bytes that were actually read.) }
    function ReadString(out Text: String; const MaxCharacters: Cardinal = 0;
      const Timeout: Cardinal = 0): Boolean;

    { Writes string to UART (serial) port.
        @param(Text String that should be sent.)
        @param(Timeout Maximum time (in milliseconds) to wait while attempting to write the buffer. If this parameter
          is set to zero, then the function will write only what fits in writable FIFO buffers (or fail when such
          buffers are not supported).)
        @returns(Number of bytes that were actually read.) }
    function WriteString(const Text: String; const Timeout: Cardinal = 0): Boolean;

    property BaudRate : Cardinal read getBaudRate write setBaudRate;
    property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
    property Parity : TUARTParity read getParity write setParity;
    property StopBits : TUARTStopBits read getStopBits write setStopBits;
    property RxPin : TUARTRxPins write setRxPin;
    property TxPin : TUARTTxPins write setTxPin;
    property ClockSource : TUARTClockSource read getClockSource;
  end;

{$IF DEFINED(HAS_ARDUINOMINIPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART2_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.STM32.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}
{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART2_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.STM32.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.STM32F1.SystemCore;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  Initialize;
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

procedure TUARTRegistersHelper.TearDown;
begin
  case longWord(@Self) of
    USART1_BASE : RCC.APB2ENR := RCC.APB2ENR and not (1 shl 14);
    USART2_BASE : RCC.APB1ENR := RCC.APB1ENR and not (1 shl 17);
    {$ifdef has_uart3}USART3_BASE : RCC.APB1ENR := RCC.APB1ENR and not (1 shl 18);{$endif}
    {$ifdef has_uart4}UART4_BASE : RCC.APB1ENR := RCC.APB1ENR and not (1 shl 19);{$endif}
    {$ifdef has_uart5}UART5_BASE : RCC.APB1ENR := RCC.APB1ENR and not (1 shl 20);{$endif}
  end;
end;

procedure TUARTRegistersHelper.Initialize;
begin
  case longWord(@Self) of
    USART1_BASE : RCC.APB2ENR := RCC.APB2ENR or (1 shl 14);
    USART2_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 17);
    {$ifdef has_uart3}USART3_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 18);{$endif}
    {$ifdef has_uart4}UART4_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 19);{$endif}
    {$ifdef has_uart5}UART5_BASE : RCC.APB1ENR := RCC.APB1ENR or (1 shl 20);{$endif}
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
var
  ClockFreq : longWord;
begin
  case GetClockSource of
    TUARTClockSource.APB1orAPB2 : if longWord(@self) = USART1_BASE then ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency
                                                  else ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
  end;
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: Cardinal);
var
  ClockFreq,Mantissa,Fraction : longWord;
  reactivate : boolean = false;
begin
    // set Baudrate
    // UE disable Serial interface
    if self.CR1 and (1 shl 13) = 1 shl 13 then
    begin
      self.CR1 := self.CR1 and not(1 shl 13);
      reactivate := true;
    end;

    case GetClockSource of
      TUARTClockSource.APB1orAPB2 : if longWord(@self) = USART1_BASE then ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency
                                                    else ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
    end;
    Mantissa := ((ClockFreq*25) div (4*Value)) div 100;
    Fraction := (longWord(((((ClockFreq*25) div (4*Value)) - Mantissa*100)*16+50) div 100) and $0f);
    self.BRR := Mantissa shl 4 or Fraction;
    if reactivate = true then
      self.CR1 := self.CR1 or (1 shl 0);
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord((Self.CR1 shr 12) and %1);
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
begin
  Self.CR1 := Self.CR1 and (not ((1 shl 12)) or ((longWord(Value) and %1) shl 12));
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  Result := TUARTParity((Self.CR1 shr 9) and %11);
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
begin
  Self.CR1 := Self.CR1 and (not (%11 shl 9)) or (longWord(Value) shl 9);
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits((Self.CR2 shr 12) and %11);
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
begin
  Self.CR2 := Self.CR2  and (not (%11 shl 12)) or (longWord(Value) shl 12);
  //Nothing to do here
end;

procedure TUARTRegistersHelper.Flush;
begin
  //LPC_UART.IIR_FCR := $07;
end;

function TUARTRegistersHelper.ReadBuffer(const Buffer: Pointer; const BufferSize,TimeOut: Cardinal): Cardinal;
var
  StartTime : longWord;
begin
  Result := 0;
  StartTime := SystemCore.GetTickCount;

  while (Result < BufferSize) do
  begin
    //RXNE
    while self.SR and (1 shl 5) = 0 do
    begin
      if TimeOut <> 0 then
      begin
        if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
          Exit;
      end;
    end;
    if (GetBitsPerWord = TUARTBitsPerWord.Eight) then
      PByte(PByte(Buffer) + Result)^ := self.DR
    else
    begin
      PWord(PByte(Buffer) + Result)^ := self.DR;
      inc(Result);
    end;
    Inc(Result);
  end;
end;

function TUARTRegistersHelper.WriteBuffer(const Buffer: Pointer; const BufferSize, TimeOut: Cardinal): Cardinal;
var
  StartTime : longWord;
begin
  Result := 0;
  StartTime := SystemCore.GetTickCount;

  while Result < BufferSize do
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
    if (GetBitsPerWord = TUARTBitsPerWord.Eight) then
      self.DR := PByte(pByte(Buffer) + Result)^
    else
    begin
      inc(Result);
      self.DR := pword(pword(Buffer) + Result)^
    end;
    Inc(Result);
  end;
  //TXE
  while self.SR and (1 shl 7) = 0 do
  begin
    if TimeOut <> 0 then
    begin
      if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
        Exit;
    end;
  end;
end;

function TUARTRegistersHelper.ReadByte(out Value: Byte; const Timeout: Cardinal): Boolean;
begin
  Result := ReadBuffer(@Value, SizeOf(Byte), Timeout) = SizeOf(Byte);
end;

function TUARTRegistersHelper.WriteByte(const Value: Byte; const Timeout: Cardinal): Boolean;
begin
  Result := WriteBuffer(@Value, SizeOf(Byte), Timeout) = SizeOf(Byte);
end;

function TUARTRegistersHelper.WriteBytes(const Values: array of Byte; const Timeout: Cardinal): Boolean;
begin
  if Length(Values) > 0 then
    Result := WriteBuffer(@Values[0], Length(Values), Timeout) = Cardinal(Length(Values))
  else
    Result := False;
end;

function TUARTRegistersHelper.ReadString(out Text: String; const MaxCharacters: Cardinal = 0;
  const Timeout: Cardinal = 0): Boolean;
var
  Count,i : longWord;
  Data : array[0..255] of byte;
begin
  Text := '';
  Result := false;
  Count := ReadBuffer(@Data,SizeOf(Data),MaxCharacters);
  if count > 0 then
  begin
    for i := 0 to count-1 do
      Text := Text + char(Data[i]);
    Result := true;
  end;
end;

function TUARTRegistersHelper.WriteString(const Text: String; const Timeout: Cardinal = 0): Boolean;
var
  i : longWord;
begin
  for i := 1 to length(Text) do
    WriteByte(byte(Text[i]),TimeOut);
  //WriteBuffer(@Text[1],length(Text),TimeOut);
  result := true;
end;

function TUARTRegistersHelper.GetClockSource : TUARTClockSource;
begin
  Result :=  TUARTClockSource.APB1orAPB2;
end;

{$ENDREGION}

end.

