unit MBF.Kinetis.UART;
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
{< Freescale Kinetis Chip series UART functions. }
interface
{$INCLUDE MBF.Config.inc}

uses
  PXL.TypeDef,
  MBF.Kinetis.GPIO;

{$define has_lpusart0}
{$define has_usart0}
{$define has_usart1}
{$define has_usart2}

const
  DefaultUARTBaudrate=115200;

type
  TLPUARTRXPins= (
    PB10_LPUART0 = ALT3 + TNativePin.PB10,
    PC16_LPUART0 = ALT3 + TNativePin.PC16,
     PE5_LPUART0 = ALT3 + TNativePin.PE5,
     PD8_LPUART0 = ALT5 + TNativePin.PD8,
     PD2_LPUART0 = ALT6 + TNativePin.PD2,
     PC3_LPUART0 = ALT7 + TNativePin.PC3
  );

  TLPUARTTXPins= (
    PB11_LPUART0 = ALT3 + TNativePin.PB11,
    PC17_LPUART0 = ALT3 + TNativePin.PC17,
     PE4_LPUART0 = ALT3 + TNativePin.PE4,
     PD3_LPUART0 = ALT6 + TNativePin.PD3,
     PD9_LPUART0 = ALT6 + TNativePin.PD9,
     PC4_LPUART0 = ALT7 + TNativePin.PC4
  );

  TUARTRXPins= (
       PA1_UART0 = ALT2 + TNativePin.PA1,
      PA15_UART0 = ALT3 + TNativePin.PA15,
      PB16_UART0 = ALT3 + TNativePin.PB16,
      {$IF DEFINED(teensy)}D0_UART = ALT3 + TNativePin.PB16,{$ENDIF}
       PC3_UART1 = ALT3 + TNativePin.PC3,
       PD2_UART2 = ALT3 + TNativePin.PD2,
      {$IF DEFINED(freedom_k22f)}D0_UART = ALT3 + TNativePin.PD2,{$ENDIF}
       PD6_UART0 = ALT3 + TNativePin.PD6,
       PE1_UART1 = ALT3 + TNativePin.PE1
  );

  TUARTTXPins= (
      PA2_UART0 = ALT2 + TNativePin.PA2,
     PB17_UART0 = ALT2 + TNativePin.PB17,
     {$IF DEFINED(teensy)}D1_UART = ALT2 + TNativePin.PB17{$ENDIF}
     PA14_UART0 = ALT3 + TNativePin.PA14,
      PC4_UART1 = ALT3 + TNativePin.PC4,
      PD3_UART2 = ALT3 + TNativePin.PD3,
     {$IF DEFINED(freedom_k22f)}D1_UART = ALT3 + TNativePin.PD3,{$ENDIF}
      PD7_UART0 = ALT3 + TNativePin.PD7,
      PE0_UART1 = ALT3 + TNativePin.PE0
  );

{$if defined(has_usart3)}
  TUART3_RXPins= record
  const
    PB10 = TNativePin.PB10; PC16 = TNativePin.PC16; PE5 = TNativePin.PE5;
  end;
  TUART3_TXPins= record
  const
    PB11 = TNativePin.PB11; PC17 = TNativePin.PC17; PE4 = TNativePin.PE4;
  end;
{$endif}

{$if defined(has_usart4)}
  TUART4_RXPins= record
  const
    PE25 = TNativePin.PE25; PC14 = TNativePin.PC14;
  end;
  TUART4_TXPins= record
  const
    PE24 = TNativePin.PE24; PC15 = TNativePin.PC15;
  end;
{$endif}
{$if defined(has_usart5)}
  TUART5_RXPins= record
  const
    PD8 = TNativePin.PD8; PE9 = TNativePin.PE9;
  end;
  TUART5_TXPins= record
  const
    PD9 = TNativePin.PD9; PE8 = TNativePin.PE8;
  end;
{$endif}

TUARTBitsPerWord = (
  Eight = 8,
  Nine = 9
);

TUARTParity = (
  None = %00,
  Even = %10,
  Odd  = %11
);

TUARTStopBits = (
  One
);

TUARTRegistersHelper = record Helper for TUART_Registers
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
  function ReadString(out Text: StdString; const MaxCharacters: Cardinal = 0;
    const Timeout: Cardinal = 0): Boolean;

  { Writes string to UART (serial) port.
      @param(Text String that should be sent.)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to write the buffer. If this parameter
        is set to zero, then the function will write only what fits in writable FIFO buffers (or fail when such
        buffers are not supported).)
      @returns(Number of bytes that were actually read.) }
  function WriteString(const Text: StdString; const Timeout: Cardinal = 0): Boolean;

  property BaudRate : Cardinal read getBaudRate write setBaudRate;
  property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
  property Parity : TUARTParity read getParity write setParity;
  property StopBits : TUARTStopBits read getStopBits write setStopBits;
  property RxPin : TUARTRxPins write setRxPin;
  property TxPin : TUARTTxPins write setTxPin;
end;

{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(teensy)}
var
  UART : TUART_Registers absolute UART0_BASE;
  {$ELSEIF DEFINED(freedom_k22f)}
var
  UART : TUART_Registers absolute UART2_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.Kinetis.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.Kinetis.SystemCore;

procedure TUARTRegistersHelper.Initialize;
var
  Dummy : byte;
begin
  // Enable clock for UART Module
  case longWord(@self) of
    UART0_BASE : SIM.SCGC4 := SIM.SCGC4 or (1 shl 10);
    UART1_BASE : SIM.SCGC4 := SIM.SCGC4 or (1 shl 11);
    UART2_BASE : SIM.SCGC4 := SIM.SCGC4 or (1 shl 12);
  end;

  // First, load Reset Value, this also turns off the UART
  // Create the basic config for all n81 use cases
  self.C2:= 0;
  self.BDH := 0;
  self.BDL := 1 shl 2;
  self.C4 := 0;
  self.MA1 := 0;
  self.MA2 := 0;
  self.C1:= 0;

  self.S2 := $C0;
  self.C3 := 0;
  self.C5 := 0;

  // Set Defaults not RTS/CTS
  self.MODEM:= 0;
  self.IR := 0;

  // for now disable FIFO
  self.PFIFO := 0;
  self.CFIFO := 0;
  self.SFIFO := $c0;
  self.TWFIFO := 0;
  self.RWFIFO := 1;
  self.SFIFO := $C7;
  self.CFIFO := $C0;
  self.PFIFO := 0;
  dummy := self.S1;
  dummy := self.D;
  self.C5 := 0;
  self.C3 := 0;
  self.C2 := 0;

  setBaudRate(DefaultUARTBaudrate);
  // Enable both receiver and sender
  self.C2 := self.C2 or (1 shl 3); //Enable Transmitter
  self.C2 := self.C2 or (1 shl 2); //Enable Receiver
end;

procedure TUARTRegistersHelper.Initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  // Do default Initialization
  Initialize;
  GPIO.PinMode[longWord(ARxPin) and $ff] := TPinMode(longWord(ARxPin) shr 8);
  GPIO.PinMode[longWord(ATxPin) and $ff] := TPinMode(longWord(ATxPin) shr 8);
end;

procedure TUARTRegistersHelper.TearDown;
begin
  case longWord(@Self) of
    UART0_BASE : SIM.SCGC4 := SIM.SCGC4 and not (1 shl 10);
    UART1_BASE : SIM.SCGC4 := SIM.SCGC4 and not (1 shl 11);
    UART2_BASE : SIM.SCGC4 := SIM.SCGC4 and not (1 shl 12);
  end;
end;

procedure TUARTRegistersHelper.SetRxPin(const Value : TUARTRXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode(longWord(Value) shr 8);
end;

procedure TUARTRegistersHelper.SetTxPin(const Value : TUARTTXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode(longWord(Value) shr 8);
end;

function TUARTRegistersHelper.GetBaudRate: Cardinal;
begin
  Result := (SystemCore.GetSystemClockFrequency shl 5) div (((longWord((self.BDH and $1f) shl 8 or self.BDL) shl 5)+(self.C4 and longWord(%11111 shl 0))) shl 4);
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: Cardinal);
var
  SBR : longWord;
  BRFA : integer;
begin
  //if FBaudRate <> Value then
  begin
    SBR := SystemCore.GetSystemClockFrequency div (Value shl 4);
    // set Baudrate
    self.BDH := (SBR shr 8) and $1f;
    self.BDL := SBR and $ff;
    BRFA := ((SystemCore.GetSystemClockFrequency shl 5)  div (Value shl 4+5)) - (SBR shl 5);
    self.C4 := self.C4 and not longWord(%11111 shl 0) or BRFA;
  end;
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  if Self.C1 and (1 shl 4) = 0 then
    Result := TUARTBitsPerWord.Eight
  else
    Result := TUARTBitsPerWord.Nine;
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
begin
  if Value <> GetBitsPerWord then
  begin
    if Value = TUARTBitsPerWord.Eight then
      Self.C1 := Self.C1 and (not (1 shl 4))
    else
      Self.C1 := Self.C1 or (1 shl 4);
  end;
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  if Self.C1 and (1 shl 1) = 0 then
    Result := TUARTParity.None
  else
    Result := TUARTParity((Self.C1 shr 0) and %11);
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
begin
  Self.C1 := Self.C1 and (not (%11 shl 0)) or byte(Value);
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits.One;
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
begin
  // Nothing to do for this Chip, there is only one Stop Bot
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
    while self.S1 and (1 shl 5) = 0 do
    begin
      if TimeOut <> 0 then
      begin
        if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
          Exit;
      end;
    end;
    if longWord(GetBitsPerWord) <= 8 then
      PByte(PByte(Buffer) + Result)^ := self.D
    else
    begin
      PWord(PByte(Buffer) + Result)^ := self.D;
      inc(Result);
    end;
    Inc(Result);
  end;
end;

function TUARTRegistersHelper.WriteBuffer(const Buffer: Pointer; const BufferSize,TimeOut: Cardinal): Cardinal;
var
  StartTime : longWord;
begin
  Result := 0;
  StartTime := SystemCore.GetTickCount;

  while Result < BufferSize do
  begin
    while self.S1 and (1 shl 6) = 0 do
    begin
      if TimeOut <> 0 then
      begin
        if SystemCore.TicksInBetween(StartTime,SystemCore.GetTickCount) > TimeOut then
        begin
          Result := 0;
          Exit;
        end;
      end;
    end;

    if longWord(GetBitsPerWord) <= 8 then
      self.D := PByte(pByte(Buffer) + Result)^
    else
    begin
      inc(Result);
      self.D := pword(pword(Buffer) + Result)^
    end;
    Inc(Result);
  end;

  while self.S1 and (1 shl 6) = 0 do
  begin
    if TimeOut <> 0 then
    begin
      if SystemCore.TicksInbetween(StartTime,SystemCore.GetTickCount) > TimeOut then
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

function TUARTRegistersHelper.ReadString(out Text: StdString; const MaxCharacters: Cardinal = 0;
  const Timeout: Cardinal = 0): Boolean;
begin
  Text := '';
  Result := false;
end;

function TUARTRegistersHelper.WriteString(const Text: StdString; const Timeout: Cardinal = 0): Boolean;
begin
  WriteBuffer(@Text[1],length(Text),TimeOut);
  result := true;
end;

end.

