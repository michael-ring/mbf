{$IF DEFINED(INTERFACE)}

{ Reads a byte from UART port.
  Will block indefinitely until data has been read.
  @returns(The Byte of Data that was read) }
function  ReadByte:Byte; inline;

{ Attempts to read a byte from UART port.
  @param(TimeOut defines maximum time in milliseconds to wait for successful write)
  @returns(@True is returned when the operation was successful) }
function  ReadByte(var aReadByte: byte; const TimeOut: TMilliSeconds):boolean;

{ Writes a byte to UART port.
  Will block indefinitely until the byte has been written.
  @param(aWriteByte The Data to write)}
procedure WriteByte(const aWriteByte: byte); inline;

{ Attempts to Write a byte to UART port.
  @param(aWriteByte The Data to write)
  @param(TimeOut defines maximum time in milliseconds to wait for successful write)
  @returns(@True is returned when the operation was successful)}
function  WriteByte(const aWriteByte: byte; const TimeOut: TMilliSeconds) : boolean;

{ Reads multiple Bytes from UART port.
  Will block indefinitely until the bytes have been read.
  @param(aReadBuffer Array of Bytes where the data will be written to.) }
procedure ReadBytes(var aReadBuffer: array of byte);

{ Reads multiple Bytes from UART port.
  Will block indefinitely until the bytes have been read.
  @param(aReadBuffer Array of Bytes where the data will be written to.)
  @param(aReadCount  Number of bytes to read.)}
procedure ReadBytes(var aReadBuffer: array of byte; const aReadCount: integer);

{ Reads multiple Bytes from UART port.
  @param(aReadBuffer Array of Bytes where the data will be written to.)
  @param(aReadCount  Number of bytes to read.)
  @param(TimeOut Maximum time in milliseconds to wait while attempting to read the buffer.)
  @returns(True when Data could be read without timeout otherwise false) }
function  ReadBytes(var aReadBuffer: array of byte; var aReadCount: integer; const TimeOut:TMilliSeconds):boolean;

{ Writes multiple bytes of data to UART port.
  Will block indefinitely until the bytes have been written.
  @param(aWriteBuffer array of bytes where the data will be read from.) }
procedure WriteBytes(const aWriteBuffer: array of byte);

{ Writes multiple bytes of data to UART port.
  Will block indefinitely until the bytes have been written.
  @param(aWriteBuffer array of bytes where the data will be read from.)
  @param(aWriteCount Number of bytes to write.)}
procedure WriteBytes(const aWriteBuffer: array of byte; const aWriteCount : integer);

{ Attempts to write multiple bytes of data to UART port.
  @param(aWriteBuffer array of bytes where the data will be read from.)
  @param(aWriteCount Number of bytes to write.)
  @param(TimeOut Maximum time (in milliseconds) to wait while attempting to write the buffer.
  @returns(True when Data could be read without timeout otherwise false.) }
function  WriteBytes(const aWriteBuffer: array of byte; const aWriteCount : integer; const TimeOut: TMilliSeconds) : boolean;

{ Reads a String of data from UART port.
  Will block indefinitely until the bytes have been read.
  @param(aReadString String where the data will be written to)
  @param(aReadCount Number of bytes to read) }
procedure ReadString(var aReadString: String; const aReadCount: Integer);

{ Attempts to read a String of data from UART port.
  @param(aReadString String where the data will be written to)
  @param(aReadCount Number of bytes to read)
  @param(TimeOut Maximum time (in milliseconds) to wait while attempting to write the buffer.
  @returns(True when Data could be read without timeout otherwise false.) }
function  ReadString(var aReadString: String;   var aReadCount: Integer; const TimeOut: TMilliSeconds): Boolean;

{ Reads a String of data from UART port until a delimiter was read
  Will block indefinitely until the bytes have been read.
  @param(aReadString String where the data will be written to)
  @param(aDelimiter The delimiter char. It will not be included in the returned string) }
procedure ReadString(var aReadString: String; const aDelimiter : char);

{ Attempts to read a String of data from UART port until a delimiter was read
  @param(aReadString String where the data will be written to)
  @param(aDelimiter The delimiter char. It will not be included in the returned string)
  @param(TimeOut Maximum time (in milliseconds) to wait while attempting to read the string.
  @returns(True when Data could be read without timeout otherwise false.) }
function  ReadString(var aReadString: String; const aDelimiter : char; const TimeOut: TMilliSeconds): Boolean;

{ Writes a string to UART port.
  @param(aWriteString String where the data will be read from.) }
procedure WriteString(const aWriteString: String);
procedure WriteUnsignedInt(const aNumber: longword);
procedure WriteSignedInt(const aNumber: longint);
procedure WriteHexInt(const aNumber: longword;const aLength : byte);

{ Attempts to write a String to UART port.
  @param(aWriteString String where the data will be read from.)
  @param(TimeOut Maximum time (in milliseconds) to wait while attempting to write the buffer.)
  @returns(True when Data could be written without timeout otherwise false.) }
function  WriteString(const aWriteString: String; const TimeOut: TMilliSeconds): Boolean;

{ Reads data buffer from UART port.
  @param(aReadBuffer Pointer to data buffer where the data will be written to.)
  @param(aReadCount  Number of bytes to read. Must be lower or equal to the size of DataBuffer)}
procedure ReadBuffer(aReadBuffer: Pointer; const aReadCount : integer);

{ Reads data buffer from UART port.
  @param(aReadBuffer Pointer to data buffer where the data will be written to.)
  @param(aReadCount  Number of bytes to read.)
  @param(TimeOut Maximum time (in milliseconds) to wait while attempting to read the buffer.
  @returns(True when Data could be read without timeout otherwise false}
function  ReadBuffer(aReadBuffer: Pointer;   var aReadCount : integer; const TimeOut: TMilliSeconds): boolean;

{ Writes data buffer to UART (serial) port.
  @param(aWriteBuffer Pointer to data buffer where the data will be read from.)
  @param(aWriteCount Number of bytes to write.)}
procedure WriteBuffer(const aWriteBuffer: Pointer; const aWriteCount : integer);

{ Writes data buffer to UART (serial) port.
  @param(aWriteBuffer Pointer to data buffer where the data will be read from.)
  @param(aWriteCount Number of bytes to write.)
  @param(TimeOut Maximum time (in milliseconds) to wait while attempting to write the buffer.
  @returns(True when Data could be read without timeout otherwise false.) }
function  WriteBuffer(const aWriteBuffer: Pointer; const aWriteCount : integer; const TimeOut: TMilliSeconds): boolean;

{$ENDIF}

{$IF DEFINED(IMPLEMENTATION)}

function TUARTRegistersHelper.ReadByte:byte; inline;
begin
  WaitForRXReady;
  result := ReadDR;
end;

function TUARTRegistersHelper.ReadByte(var aReadByte: byte; const TimeOut: TMilliSeconds):boolean;
var
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;
  if WaitForRXReady(EndTime) = false then
    exit(false);
  aReadByte := ReadDR;
  result := true;
end;

procedure TUARTRegistersHelper.WriteByte(const aWriteByte: byte); inline;
begin
  WaitForTXReady;
  WriteDR(aWriteByte);
end;

function TUARTRegistersHelper.WriteByte(const aWriteByte: byte; const TimeOut: TMilliSeconds) : boolean;
var
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  if WaitForTXReady(EndTime) = false then
    exit(false);
  WriteDR(aWriteByte);
  result := true;
end;

procedure TUARTRegistersHelper.ReadBytes(var aReadBuffer: array of byte);
var
  i : integer;
begin
  for i := 0 to High(aReadBuffer) do
  begin
    WaitForRxReady;
    aReadBuffer[i] := ReadDR;
  end;
end;

procedure TUARTRegistersHelper.ReadBytes(var aReadBuffer: array of byte; const aReadCount : integer);
var
  i : integer;
begin
  for i := 0 to aReadCount-1 do
  begin
    WaitForRXReady;
    aReadBuffer[i] := ReadDR;
  end;
end;

function TUARTRegistersHelper.ReadBytes(var aReadBuffer: array of byte; var aReadCount : integer; const TimeOut: TMilliSeconds):boolean;
var
  EndTime : longWord;
  i : integer;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  for i := 0 to aReadCount-1 do
  begin
    if WaitForRXReady(EndTime) = false then
    begin
      aReadCount := i;
      Exit(false);
    end;
    aReadBuffer[i] := ReadDR;
  end;
  Result := True;
end;

procedure TUARTRegistersHelper.WriteBytes(const aWriteBuffer: array of byte);
var
  i : integer;
begin
  for i := 0 to High(aWriteBuffer) do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i]);
  end;
end;

procedure TUARTRegistersHelper.WriteBytes(const aWriteBuffer: array of byte; const aWriteCount : integer);
var
  i : integer;
begin
  for i := 0 to aWriteCount-1 do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i]);
  end;
end;

function TUARTRegistersHelper.WriteBytes(const aWriteBuffer: array of byte; const aWriteCount : integer; const TimeOut: TMilliSeconds) : boolean;
var
  EndTime : longWord;
  i : integer;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  for i := 0 to aWriteCount-1 do
  begin
    if WaitForTXReady(EndTime) = false then
      Exit(false);
    WriteDR(aWriteBuffer[i]);
  end;
  Result := true;
end;

procedure TUARTRegistersHelper.ReadString(var aReadString: String; const aReadCount: integer);
var
  i : integer;
begin
  aReadString := '';
  for i := 1 to aReadCount do
  begin
    WaitForRXReady;
    aReadString := aReadString + char(ReadDR);
  end;
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; var aReadCount: integer; const TimeOut: TMilliSeconds): Boolean;
var
  EndTime : longWord;
  i : integer;
begin
  aReadString := '';
  EndTime := SystemCore.GetTickCount + TimeOut;
  for i := 1 to aReadCount do
  begin
    if WaitForRXReady(EndTime) = false then
    begin
      aReadCount := i;
      exit(false);
    end;
    aReadString := aReadString + char(ReadDR);
  end;
  Result := true;
end;

procedure TUARTRegistersHelper.ReadString(var aReadString: String; const aDelimiter: char);
var
  charRead : char;
begin
  aReadString := '';
  repeat
    WaitForRXReady;
    CharRead := char(ReadDR);
    if CharRead = aDelimiter then
      exit;
    aReadString := aReadString + CharRead;
  until 1=0;
end;

function TUARTRegistersHelper.ReadString(var aReadString: String; const aDelimiter: char;
  const TimeOut: TMilliSeconds): Boolean;
var
  EndTime : longWord;
  CharRead : char;
begin
  Result := false;
  aReadString := '';
  EndTime := SystemCore.GetTickCount + TimeOut;

  repeat
    if WaitForRXReady(EndTime) = false then
      exit(false);
    CharRead := char(ReadDR);
    if CharRead = aDelimiter then
      exit(true);
    aReadString := aReadString + CharRead;
  until 1=0;
end;

procedure TUARTRegistersHelper.WriteString(const aWriteString: String);
var
  i : integer;
begin
  for i := 1 to length(aWriteString) do
  begin
    WaitForTXReady;
    WriteDR(byte(aWriteString[i]));
  end;
end;

function TUARTRegistersHelper.WriteString(const aWriteString: String; const TimeOut: TMilliSeconds): Boolean;
var
  EndTime : longWord;
  i : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;
  for i := 1 to length(aWriteString) do
  begin
    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDR(byte(aWriteString[i]));
  end;
  Result := true;
end;

procedure TUARTRegistersHelper.WriteUnsignedInt(const aNumber: longword);
var
  i : integer;
  TempString : String[10];
begin
  Str(aNumber,TempString);
  for i := 1 to length(TempString) do
  begin
    WaitForTXReady;
    WriteDR(byte(TempString[i]));
  end;
end;
procedure TUARTRegistersHelper.WriteSignedInt(const aNumber: longint);
var
  i : integer;
  TempString : String[11];
begin
  Str(aNumber,TempString);
  for i := 1 to length(TempString) do
  begin
    WaitForTXReady;
    WriteDR(byte(TempString[i]));
  end;
end;
procedure TUARTRegistersHelper.WriteHexInt(const aNumber: longword;const aLength:byte);
var
  i : integer;
  temp : byte;
begin
  for i := alength-1 downto 0 do
  begin
    temp := ((aNumber shr (4*i)) and %1111)+ord('0');
    if temp > ord('9') then
      temp := temp-ord('9')+ord('a')-1;
    WaitForTXReady;
    WriteDR(temp);
  end;
end;

procedure TUARTRegistersHelper.ReadBuffer(aReadBuffer: Pointer; const aReadCount : integer);
var
  i : integer;
begin
  for i := 0 to aReadCount -1 do
  begin
    WaitForRXReady;
    PByte(PByte(aReadBuffer) + i)^ := ReadDR;
  end;
end;

function TUARTRegistersHelper.ReadBuffer(aReadBuffer: Pointer; var aReadCount : integer; const TimeOut: TMilliSeconds): boolean;
var
  i : integer;
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  for i := 0 to aReadCount -1  do
  begin
    if WaitForRXReady(EndTime) = false then
    begin
      aReadCount := i;
      Exit;
    end;
    PByte(PByte(aReadBuffer) + aReadCount)^ := ReadDR;
  end;
  Result := true;
end;

procedure TUARTRegistersHelper.WriteBuffer(const aWriteBuffer: Pointer; const aWriteCount : Integer);
var
  i : integer;
begin
  for i := 0 to aWriteCount -1 do
  begin
    WaitForTXReady;
    WriteDR(PByte(pByte(aWriteBuffer) + i)^)
  end;
end;

function TUARTRegistersHelper.WriteBuffer(const aWriteBuffer: Pointer; const aWriteCount : Integer; const TimeOut: TMilliSeconds): boolean;
var
  i : integer;
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  for i := 0 to aWriteCount -1 do
  begin
    if WaitForTXReady(EndTime) = false then
      Exit(false);
    WriteDR(PByte(pByte(aWriteBuffer) + i)^);
  end;
  Result := true;
end;

{$ENDIF}

