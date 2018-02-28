unit MBF.PIC32MX.UART;
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
{< Microchip PIC32MX board series functions. }
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.PIC32MX.GPIO;

{$REGION PinDefinitions}

const
  DefaultUARTBaudrate=115200;
type
  TUARTRXPins = (
    {$if defined(has_UART2 ) and defined(has_gpioa) }  PA1_UART2  = ALT0 or TNativePin.PA1 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioa) }, PA0_UART1  = ALT0 or TNativePin.PA2 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB5_UART2  = ALT1 or TNativePin.PB5 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB6_UART1  = ALT1 or TNativePin.PB6 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioa) }, PA4_UART1  = ALT2 or TNativePin.PA4 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB1_UART2  = ALT2 or TNativePin.PB1 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) },PB11_UART2  = ALT3 or TNativePin.PB11{$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) },PB13_UART1  = ALT3 or TNativePin.PB13{$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB2_UART1  = ALT4 or TNativePin.PB2 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB8_UART2  = ALT4 or TNativePin.PB8 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioa) }, PA8_UART2  = ALT5 or TNativePin.PA8 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC6_UART1  = ALT5 or TNativePin.PC6 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC1_UART1  = ALT6 or TNativePin.PC1 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioc) }, PC8_UART2  = ALT6 or TNativePin.PC8 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioa) }, PA9_UART2  = ALT7 or TNativePin.PA9 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC0_UART1  = ALT7 or TNativePin.PC3 {$endif}
  );

  TUARTTXPins = (
    {$if defined(has_UART1 ) and defined(has_gpioa) }  PA0_UART1  = ALT1 or TNativePin.PA1 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB3_UART1  = ALT1 or TNativePin.PA1 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB4_UART1  = ALT1 or TNativePin.PA1 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB7_UART1  = ALT1 or TNativePin.PA1 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) },PB15_UART1  = ALT1 or TNativePin.PA1 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC0_UART1  = ALT1 or TNativePin.PA1 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC5_UART1  = ALT1 or TNativePin.PA1 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC7_UART1  = ALT1 or TNativePin.PA1 {$endif}

    {$if defined(has_UART2 ) and defined(has_gpioa) }, PA3_UART1  = ALT2 or TNativePin.PA3 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB0_UART1  = ALT2 or TNativePin.PB0 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB9_UART1  = ALT2 or TNativePin.PB9 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) },PB10_UART1  = ALT2 or TNativePin.PB10{$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) },PB14_UART1  = ALT2 or TNativePin.PB14{$endif}
    {$if defined(has_UART2 ) and defined(has_gpioc) }, PC2_UART1  = ALT2 or TNativePin.PC2 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioc) }, PC4_UART1  = ALT2 or TNativePin.PC4 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioc) }, PC9_UART1  = ALT2 or TNativePin.PC9 {$endif}
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
    One = %0,
    Two = %1
  );

  TUARTClockSource = (
    APB1orAPB2 = %00,
    SYSCLK = %01,
    LSE = %10,
    HSI = %11
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
    procedure SetClockSource(const Value : TUARTClockSource);
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
    property ClockSource : TUARTClockSource read getClockSource write setClockSource;
  end;

{$IF DEFINED(HAS_ARDUINOMINIPINS)}
  {$IF DEFINED(nucleo)}
var
  UART : TUART_Registers absolute USART1_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.PIC32MX.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}
{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(HAS_ARDUINO_UART1)}
var
  UART : TUART_Registers absolute UART1_BASE;
  {$ELSEIF DEFINED(HAS_ARDUINO_UART2)}
var
  UART : TUART_Registers absolute UART2_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.PIC32MX.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.PIC32MX.SystemCore;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  Initialize;
  setRxPin(ARxPin);
  setTxPin(ATxPin);
end;

procedure TUARTRegistersHelper.SetRxPin(const Value : TUARTRXPins);
begin
  case longWord(@Self) of
    UART1_BASE : ;
    UART2_BASE : ;
  end;
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
end;

procedure TUARTRegistersHelper.SetTxPin(const Value : TUARTTXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode((longWord(Value) shr 8));
end;

procedure TUARTRegistersHelper.TearDown;
begin
  Self.UModeClr := 1 shl 15;
end;

procedure TUARTRegistersHelper.Initialize;
begin
  // First, load Reset Value, this also turns off the UART
  // Create the basic config for all n81 use cases
  self.UMode := 0;

  self.USTA := 0;

  self.UTXReg := 0;

  setBaudRate(DefaultUARTBaudRate);
  // UE Enable UART
  self.CR1 := self.CR1 or (1 shl 0);
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
    TUARTClockSource.HSI : ClockFreq := HSIClockFrequency;
    TUARTClockSource.LSE : ClockFreq := XTALRTCFreq;
    TUARTClockSource.SYSCLK : ClockFreq := SystemCore.GetSYSCLKFrequency;
  end;
  //OVER8
  if self.CR1 and not(1 shl 15) = 0 then
  begin
  end
  else
  begin
  end
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: Cardinal);
var
  ClockFreq,Mantissa,Fraction : longWord;
  reactivate : boolean = false;
begin
    // set Baudrate
    // UE disable Serial interface
    if self.CR1 and (1 shl 0) = 1 then
    begin
      self.CR1 := self.CR1 and not(1 shl 0);
      reactivate := true;
    end;

    case GetClockSource of
      TUARTClockSource.APB1orAPB2 : if longWord(@self) = USART1_BASE then ClockFreq := SystemCore.GetAPB2PeripheralClockFrequency
                                                    else ClockFreq := SystemCore.GetAPB1PeripheralClockFrequency;
      TUARTClockSource.HSI : ClockFreq := HSIClockFrequency;
      TUARTClockSource.LSE : ClockFreq := XTALRTCFreq;
      TUARTClockSource.SYSCLK : ClockFreq := SystemCore.GetSYSCLKFrequency;
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
      self.CR1 := self.CR1 or (1 shl 0);
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  Result := TUARTBitsPerWord((((Self.CR1 shr (28)) and %1) shl 1) or ((Self.CR1 shr 12) and %1));
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
begin
  Self.CR1 := Self.CR1 and (not ((1 shl 28) or (1 shl 12)) or ((longWord(Value) and %10) shl (28-1))
                       or ((longWord(Value) and %1) shl 12));
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
    while self.ISR and (1 shl 5) = 0 do
    begin
      if TimeOut <> 0 then
      begin
        if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
          Exit;
      end;
    end;
    if (GetBitsPerWord = TUARTBitsPerWord.Eight) or (GetBitsPerWord = TUARTBitsPerWord.Seven) then
      PByte(PByte(Buffer) + Result)^ := self.RDR
    else
    begin
      PWord(PByte(Buffer) + Result)^ := self.RDR;
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
    while self.ISR and (1 shl 7) = 0 do
    begin
      if TimeOut <> 0 then
      begin
        if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
          Exit;
      end;
    end;
    if (GetBitsPerWord = TUARTBitsPerWord.Eight)  or (GetBitsPerWord = TUARTBitsPerWord.Seven)then
      self.TDR := PByte(pByte(Buffer) + Result)^
    else
    begin
      inc(Result);
      self.TDR := pword(pword(Buffer) + Result)^
    end;
    Inc(Result);
  end;
  //TXE
  while self.ISR and (1 shl 7) = 0 do
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

procedure TUARTRegistersHelper.SetClockSource(const Value : TUARTClockSource);
begin
  case longWord(@self) of
    USART1_BASE : RCC.CFGR3 := RCC.CFGR3 and (not %11 shl 0) or (longWord(Value) shl 0);
    USART2_BASE : RCC.CFGR3 := RCC.CFGR3 and (not %11 shl 16) or (longWord(Value) shl 16);
    {$ifdef has_uart3}RCC.CFGR3 := RCC.CFGR3 and (not %11 shl 18) or (longWord(Value) shl 18){$endif}
    {$ifdef has_uart4}RCC.CFGR3 := RCC.CFGR3 and (not %11 shl 20) or (longWord(Value) shl 20){$endif}
    {$ifdef has_uart5}RCC.CFGR3 := RCC.CFGR3 and (not %11 shl 22) or (longWord(Value) shl 22){$endif}
  end;
end;

function TUARTRegistersHelper.GetClockSource : TUARTClockSource;
begin
  case longWord(@self) of
    USART1_BASE : Result :=  TUARTClockSource((RCC.CFGR3 shr 0) and %11);
    USART2_BASE : Result :=  TUARTClockSource((RCC.CFGR3 shr 16) and %11);
    {$ifdef has_uart3}Result :=  TUARTClockSource((RCC.CFGR3 shr 18) and %11){$endif}
    {$ifdef has_uart4}Result :=  TUARTClockSource((RCC.CFGR3 shr 20) and %11);{$endif}
    {$ifdef has_uart5}Result :=  TUARTClockSource((RCC.CFGR3 shr 22) and %11);{$endif}
  end;
end;

{$ENDREGION}

end.

