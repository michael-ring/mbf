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
  DefaultUARTTimeout=10000;

type
  TUARTRXPins = (
    {$if defined(has_UART2 ) and defined(has_gpioa) }  PA1_UART2  = ALT0  or TNativePin.PA1  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioa) }, PA2_UART1  = ALT0  or TNativePin.PA2  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB5_UART2  = ALT1  or TNativePin.PB5  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB6_UART1  = ALT1  or TNativePin.PB6  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioa) }, PA4_UART1  = ALT2  or TNativePin.PA4  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB1_UART2  = ALT2  or TNativePin.PB1  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB11_UART2 = ALT3  or TNativePin.PB11 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB13_UART1 = ALT3  or TNativePin.PB13 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB2_UART1  = ALT4  or TNativePin.PB2  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB8_UART2  = ALT4  or TNativePin.PB8  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioa) }, PA8_UART2  = ALT5  or TNativePin.PA8  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC6_UART1  = ALT5  or TNativePin.PC6  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC1_UART1  = ALT6  or TNativePin.PC1  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioc) }, PC8_UART2  = ALT6  or TNativePin.PC8  {$endif}
    {$if defined(chipkitlenny) }                     , D0_UART    = ALT6  or TNativePin.PC8  {$endif}
    {$if defined(chipkitlenny) }                     , DEBUG_UART = ALT6  or TNativePin.PC8  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioa) }, PA9_UART2  = ALT7  or TNativePin.PA9  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC3_UART1  = ALT7  or TNativePin.PC3  {$endif}
  );

  TUARTTXPins = (
    {$if defined(has_UART1 ) and defined(has_gpioa) }  PA0_UART1  = ALT1  or TNativePin.PA0  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB3_UART1  = ALT1  or TNativePin.PB3  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB4_UART1  = ALT1  or TNativePin.PB4  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) }, PB7_UART1  = ALT1  or TNativePin.PB7  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpiob) },PB15_UART1  = ALT1  or TNativePin.PB15 {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC0_UART1  = ALT1  or TNativePin.PC0  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC5_UART1  = ALT1  or TNativePin.PC5  {$endif}
    {$if defined(has_UART1 ) and defined(has_gpioc) }, PC7_UART1  = ALT1  or TNativePin.PC7  {$endif}

    {$if defined(has_UART2 ) and defined(has_gpioa) }, PA3_UART2  = ALT2 or TNativePin.PA3  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB0_UART2  = ALT2 or TNativePin.PB0  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) }, PB9_UART2  = ALT2 or TNativePin.PB9  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) },PB10_UART2  = ALT2 or TNativePin.PB10 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpiob) },PB14_UART2  = ALT2 or TNativePin.PB14 {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioc) }, PC2_UART2  = ALT2 or TNativePin.PC2  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioc) }, PC4_UART2  = ALT2 or TNativePin.PC4  {$endif}
    {$if defined(has_UART2 ) and defined(has_gpioc) }, PC9_UART2  = ALT2 or TNativePin.PC9  {$endif}
    {$if defined(chipkitlenny) }                     , D1_UART    = ALT2 or TNativePin.PC9  {$endif}
    {$if defined(chipkitlenny) }                     , DEBUG_UART = ALT2 or TNativePin.PC9  {$endif}
  );

{$ENDREGION}

  TUARTBitsPerWord = (
    Eight = %00,
    Nine = %01
  );

  TUARTParity = (
    None = %00,
    Even = %01,
    Odd  = %10
  );

  TUARTStopBits = (
    One = %0,
    Two = %1
  );

  TUARTClockSource = (
    PBCLK2noSLEEP = %00,
    SYSCLK        = %01,
    FRC           = %10,
    PBCLK2        = %11
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
    function Disable : boolean;
    procedure Enable;

  { Reads data buffer from UART (serial) port.
    @param(Buffer Pointer to data buffer where the data will be written to.)
    @param(BufferSize Number of bytes to read.)
    @param(Timeout Maximum time (in milliseconds) to wait while attempting to read the buffer. If this parameter is
      set to zero, then the function will block indefinitely, attempting to read until the specified number of
      bytes have been read.)
    @returns(Number of bytes that were actually read.) }

  { Writes data buffer to UART (serial) port.
    @param(Buffer Pointer to data buffer where the data will be read from.)
    @param(BufferSize Number of bytes to write.)
    @param(Timeout Maximum time (in milliseconds) to wait while attempting to write the buffer. If this parameter
      is set to zero, then the function will block indefinitely, attempting to write until the specified number of
      bytes have been written.)
    @returns(Number of bytes that were actually written.) }

  { Attempts to read a byte from UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to wait
    while attempting to do so; if this parameter is set to zero, then the function will block indefinitely until the
    byte has been read. @True is returned when the operation was successful and @False when the byte could not be
    read. }

  { Attempts to write a byte to UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to wait
    while attempting to do so; if this parameter is set to zero, then the function will block indefinitely until the
    byte has been written. @True is returned when the operation was successful and @False when the byte could not be
    written. }

  { Attempts to write multiple bytes to UART (serial) port. @code(Timeout) defines maximum time (in milliseconds) to
    wait while attempting to do so; if this parameter is set to zero, then the function will block indefinitely,
    attempting to write until the specified bytes have been written. @True is returned when the operation was
    successful and @False when not all bytes could be written. }

  { Reads string from UART (serial) port.
    @param(Text String that will hold the incoming data.)
    @param(MaxCharacters Maximum number of characters to read. Once this number of characters has been read, the
      function immediately returns, even if there is more data to read. When this parameter is set to zero, then
      the function will continue to read the data, depending on value of @code(Timeout).)
    @param(Timeout Maximum time (in milliseconds) to wait while attempting to read the buffer. If this parameter
      is set to zero, then the function will read only as much data as fits in readable FIFO buffers (or fail when
      such buffers are not supported).)
    @returns(Number of bytes that were actually read.) }

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

    function WriteString(const aWriteString: String; const Timeout: cardinal = 0): Boolean;

  { Writes string to UART (serial) port.
      @param(Text String that should be sent.)
      @param(Timeout Maximum time (in milliseconds) to wait while attempting to write the buffer. If this parameter
        is set to zero, then the function will write only what fits in writable FIFO buffers (or fail when such
        buffers are not supported).)
      @returns(Number of bytes that were actually read.) }

  property BaudRate : Cardinal read getBaudRate write setBaudRate;
  property BitsPerWord : TUARTBitsPerWord read getBitsPerWord write setBitsPerWord;
  property Parity : TUARTParity read getParity write setParity;
  property StopBits : TUARTStopBits read getStopBits write setStopBits;
  property RxPin : TUARTRxPins write setRxPin;
  property TxPin : TUARTTxPins write setTxPin;
  property ClockSource : TUARTClockSource read getClockSource write setClockSource;
end;

{$IF DEFINED(HAS_ARDUINOPINS)}
  {$IF DEFINED(chipkitlenny)}
var
  UART : TUART_Registers absolute UART2_BASE;
  DEBUG_UART : TUART_Registers absolute UART2_BASE;
  {$ELSEIF DEFINED(pinguino)}
var
  UART : TUART_Registers absolute UART1_BASE;
  DEBUG_UART : TUART_Registers absolute UART1_BASE;
  {$ELSE}
    {$ERROR This Device has Arduinopins defined but is not yet known to MBF.PIC32MX.UART}
  {$ENDIF}
{$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.PIC32MX.SystemCore,
  MBF.BitHelpers;

procedure TUARTRegistersHelper.initialize(const ARxPin : TUARTRXPins;
                       const ATxPin : TUARTTXPins);
begin
  Initialize;
  setRxPin(ARxPin);
  setTxPin(ATxPin);
end;

procedure TUARTRegistersHelper.SetRxPin(const Value : TUARTRXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode.Input;
  SystemCore.RegUnlock;
  case longWord(@Self) of
    {$if defined(has_UART1 )} UART1_BASE : PPIS.U1RXR := (longWord(Value) shr 8) and %1111;{$endif}
    {$if defined(has_UART2 )} UART2_BASE : PPIS.U2RXR := (longWord(Value) shr 8) and %1111;{$endif}
    {$if defined(has_UART3 )} UART3_BASE : PPIS.U3RXR := (longWord(Value) shr 8) and %1111;{$endif}
    {$if defined(has_UART4 )} UART4_BASE : PPIS.U4RXR := (longWord(Value) shr 8) and %1111;{$endif}
    {$if defined(has_UART5 )} UART5_BASE : PPIS.U5RXR := (longWord(Value) shr 8) and %1111;{$endif}
    {$if defined(has_UART6 )} UART6_BASE : PPIS.U6RXR := (longWord(Value) shr 8) and %1111;{$endif}
  end;
  SystemCore.RegLock;
end;

procedure TUARTRegistersHelper.SetTxPin(const Value : TUARTTXPins);
begin
  GPIO.PinMode[longWord(Value) and $ff] := TPinMode.Output;
  SystemCore.RegUnlock;
  GPIO.SetPPOS(longWord(Value) and $ff,TPinAlternateMode((longWord(Value) shr 8) and %1111));
  SystemCore.RegLock;
end;

procedure TUARTRegistersHelper.Enable;
begin
  setBit(USTASET,15);
end;

function TUARTRegistersHelper.Disable : boolean;
begin
  Result := false;
  if getBit(self.USTA,15) <> 0 then
  begin
    setBit(USTACLR,15);
    Result := true;
  end;
end;

procedure TUARTRegistersHelper.Initialize;
begin
  // First, load Reset Value, this also turns off the UART
  // Create the basic config for all n81 use cases
  //self.UMode := 0;
  self.UMode := $8008;

  self.USTA := 0;

  setBaudRate(DefaultUARTBaudRate);
  // UE Enable UART
  SetBit(USTASET,15);
  // RE TE Enable both receiver and sender
  SetBit(USTASET,10);
  SetBit(USTASET,12);
end;

function TUARTRegistersHelper.GetBaudRate: Cardinal;
var
  ClockFreq : longWord;
begin
  case GetClockSource of
    TUARTClockSource.PBCLK2noSLEEP,
    TUARTClockSource.PBCLK2 : ClockFreq := SystemCore.GetPBCLKFrequency;
    TUARTClockSource.SYSCLK : ClockFreq := SystemCore.GetSYSCLKFrequency;
    TUARTClockSource.FRC : ClockFreq := FRCClockFrequency;
  end;
  if GetBit(UMODE,3) = 0 then
    Result := ClockFreq div ((UBRG+1) shl 4)
  else
    Result := ClockFreq div ((UBRG+1) shl 2)
end;

procedure TUARTRegistersHelper.SetBaudRate(const Value: Cardinal);
var
  ClockFreq : longWord;
  reactivate : boolean = false;
begin
    // set Baudrate
    // UE disable Serial interface
   reactivate := Disable;

    case GetClockSource of
      TUARTClockSource.PBCLK2noSLEEP,
      TUARTClockSource.PBCLK2 : ClockFreq := SystemCore.GetPBCLKFrequency;
      TUARTClockSource.SYSCLK : ClockFreq := SystemCore.GetSYSCLKFrequency;
      TUARTClockSource.FRC : ClockFreq := FRCClockFrequency;
    end;

    if getBit(UMODE,3) = 0 then
      UBRG := ClockFreq div (Value shl 4) -1
    else
      UBRG := ClockFreq div (Value shl 2) -1;
    if reactivate then
      enable;
end;

function TUARTRegistersHelper.GetBitsPerWord: TUARTBitsPerWord;
begin
  if getBitsMasked(self.UMODE,%11,1) = %11 then
    Result := TUARTBitsPerWord.Nine
  else
    Result := TUARTBitsPerWord.Eight
end;

procedure TUARTRegistersHelper.SetBitsPerWord(const Value: TUARTBitsPerWord);
var
  reactivate : boolean;
begin
  reactivate := Disable;
  if getBitsMasked(self.UMODE,%11,1) = %11 then
  begin
    if not (Value = TUARTBitsPerWord.Nine) then
    begin
      SetBit(UMODECLR,1);
      SetBit(UMODECLR,2);
    end;
  end
  else
    if Value = TUARTBitsPerWord.Nine then
    begin
      SetBit(UMODESET,1);
      SetBit(UMODESET,2);
    end;
  if reactivate then
    enable;
end;

function TUARTRegistersHelper.GetParity: TUARTParity;
begin
  if getBitsMasked(self.UMODE,%11,1) = %11 then
    Result := TUARTParity.None
  else
    Result := TUARTParity(UMODE shr 1 and %11);
end;

procedure TUARTRegistersHelper.SetParity(const Value: TUARTParity);
var
  reactivate : boolean;
begin
  reactivate := Disable;

  if getBitsMasked(Self.UMODE,%11,1) <> %11 then
    SetBitsMasked(UMODE,longWord(Value),%110,1);
  if reactivate then
    enable;
end;

function TUARTRegistersHelper.GetStopBits: TUARTStopBits;
begin
  Result := TUARTStopBits(UMODE and %1);
end;

procedure TUARTRegistersHelper.SetStopBits(const Value: TUARTStopBits);
var
  reactivate : boolean;
begin
  reactivate := Disable;

  if Value = TUARTStopBits.one then
    SetBit(UMODECLR,0)
  else
    SetBit(UMODESET,0);
  if reactivate then
    enable;
end;

function TUARTRegistersHelper.GetClockSource : TUARTClockSource;
begin
  Result := TUARTClockSource(getBitsMasked(self.UMODE,%11,17));
end;

procedure TUARTRegistersHelper.SetClockSource(const Value : TUARTClockSource);
var
  reactivate : boolean;
begin
  reactivate := Disable;
  SetBitsMasked(self.UMODE,byte(Value),%11,17);
  if reactivate then
    enable;
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
    if not waitBitIsSet(self.USTA,0,EndTime) then
      Exit;
    if GetBitsPerWord = TUARTBitsPerWord.Eight then
      PByte(PByte(aReadBuffer) + Result)^ := self.URXREG
    else
    begin
      PWord(PByte(aReadBuffer) + Result)^ := self.URXREG;
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
    //Transmitbuffer Full Status
    if waitBitIsCleared(self.USTA,9,EndTime) = false then
        Exit;
    if GetBitsPerWord = TUARTBitsPerWord.Eight then
      self.UTXREG := pByte(pByte(aWriteBuffer) + Result)^
    else
    begin
      inc(Result);
      self.UTXREG := pWord(pWord(WriteBuffer) + Result)^
    end;
    Inc(Result);
  end;
  // Wait for Transmit Buffer empty
  if waitBitIsSet(self.USTA,8,EndTime) = false then
    Exit;
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

  if not waitBitIsSet(self.USTA,0,EndTime) then
    Exit;

  aReadByte := URXREG;
end;

function TUARTRegistersHelper.ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0):boolean;
var
  EndTime : longWord;
  i : integer;
begin
  Result := false;
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;
  if aReadCount = -1 then
    aReadCount := length(aReadBuffer);

  for i := low(aReadBuffer) to low(aReadBuffer) + aReadCount do
  begin
    if not waitBitIsSet(self.USTA,0,EndTime) then
      Exit;
    aReadBuffer[i] := self.URXREG
  end;
  Result := true;
end;

function TUARTRegistersHelper.WriteByte(const aWriteByte: byte; const Timeout : Cardinal=0) : boolean;
var
  EndTime : longWord;
begin
  Result := false;
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  if waitBitIsCleared(self.USTA,9,EndTime) = false then
      Exit;
  self.UTXREG := aWriteByte;
  // Wait for Transmit Buffer empty
  if waitBitIsSet(self.USTA,8,EndTime) = false then
    Exit;
  Result := true;
end;

function TUARTRegistersHelper.WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : Cardinal=0) : boolean;
var
  EndTime : longWord;
  i : longWord;
begin
  Result := false;
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  for i := low(aWriteBuffer) to low(aWriteBuffer) + aWriteCount do
  begin
    if waitBitIsCleared(self.USTA,9,EndTime) = false then
      Exit;
      self.UTXREG := aWriteBuffer[i];
  end;
  // Wait for Transmit Buffer empty
  if waitBitIsSet(self.USTA,8,EndTime) = false then
    Exit;
  Result := true;
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; aReadCount: integer = -1;
  const Timeout: Cardinal = 0): Boolean;
var
  EndTime : longWord;
begin
  Result := false;
  aReadString := '';
  //Default timeout is 10 Seconds
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    if not waitBitIsSet(self.USTA,0,EndTime) then
      Exit;
    aReadString := aReadString + char(self.URXREG);
    if (aReadCount <> -1) and (length(aReadString) >=aReadCount) then
    begin
      result := true;
      exit;
    end;
  until (SystemCore.GetTickCount > EndTime);

  result := true;
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
    if not waitBitIsSet(self.USTA,0,EndTime) then
      Exit;
    charRead := char(self.URXREG);
    aReadString := aReadString + charRead;
    if aDelimiter =charRead then
    begin
      result := true;
      exit;
    end;
  until (SystemCore.GetTickCount > EndTime);
  result := true;
end;

function TUARTRegistersHelper.WriteString(const aWriteString: String; const Timeout: Cardinal = 0): Boolean;
var
  EndTime : longWord;
  i : longWord;
begin
  Result := false;
  if Timeout = 0 then
    EndTime := SystemCore.GetTickCount + DefaultUARTTimeout
  else
    EndTime := SystemCore.GetTickCount + TimeOut;

  for i := 1 to length(aWriteString) do
  begin
    if waitBitIsCleared(self.USTA,9,EndTime) = false then
      Exit;
    self.UTXREG := byte(aWriteString[i]);
  end;
  // Wait for Transmit Buffer empty
  if waitBitIsSet(self.USTA,8,EndTime) = false then
    Exit;
  Result := true;
end;

{$ENDREGION}

end.
