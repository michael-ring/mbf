{$IF DEFINED(INTERFACE)}
function  ReadByte:byte; inline;
function  ReadByte(out aReadByte: byte; const TimeOut : TMilliSeconds):boolean; inline;
procedure WriteByte(const aWriteByte: byte); inline;
function  WriteByte(const aWriteByte: byte; const TimeOut : TMilliSeconds) : boolean; inline;
function  TransferByte(const aWriteByte : byte) : byte; inline;
function  TransferByte(const aWriteByte : byte; out aReadByte : byte; const TimeOut : TMilliSeconds) : boolean; inline;

procedure ReadBytes(out aReadBuffer: array of byte);
procedure ReadBytes(out aReadBuffer: array of byte; aReadCount : integer);
function  ReadBytes(out aReadBuffer: array of byte; var aReadCount : integer; const TimeOut : TMilliSeconds):boolean;

procedure WriteBytes(const aWriteBuffer: array of byte);
procedure WriteBytes(const aWriteBuffer: array of byte; aWriteCount : integer);
function  WriteBytes(const aWriteBuffer: array of byte; aWriteCount : integer; const TimeOut : TMilliSeconds) : boolean;

procedure TransferBytes(const aWriteBuffer: array of byte; out aReadBuffer : array of byte);
procedure TransferBytes(const aWriteBuffer: array of byte; out aReadBuffer : array of byte; aTransferCount : integer);
function  TransferBytes(const aWriteBuffer: array of byte; out aReadBuffer : array of byte; aTransferCount : integer; const TimeOut : TMilliSeconds) : boolean;

function  ReadWord: word; inline;
function  ReadWord(out aReadWord: word; const TimeOut : TMilliSeconds):boolean; inline;

procedure WriteWord(const aWriteWord: word); inline;
function  WriteWord(const aWriteWord: word; const TimeOut : TMilliSeconds) : boolean; inline;

function  TransferWord(const aWriteWord: word) : word; inline;
function  TransferWord(const aWriteWord: word; out aReadWord : word; const TimeOut : TMilliSeconds) : boolean; inline;

procedure ReadWords(out aReadBuffer: array of word);
procedure ReadWords(out aReadBuffer: array of word; const aReadCount : integer);
function  ReadWords(out aReadBuffer: array of word; var aReadCount : integer; const TimeOut : TMilliSeconds):boolean;

procedure WriteWords(const aWriteBuffer: array of word);
procedure WriteWords(const aWriteBuffer: array of word; const aWriteCount : integer);
function  WriteWords(const aWriteBuffer: array of word; var aWriteCount : integer; const TimeOut : TMilliSeconds) : boolean;

procedure TransferWords(const aWriteBuffer: array of word; out aReadBuffer : array of word);
procedure TransferWords(const aWriteBuffer: array of word; out aReadBuffer : array of word; const aTransferCount : integer);
function  TransferWords(const aWriteBuffer: array of word; out aReadBuffer : array of word; var aTransferCount : integer; const TimeOut : TMilliSeconds) : boolean;

procedure WriteBuffer(const pWriteBuffer: pByte; const aWriteCount : Word);
function  WriteBuffer(const pWriteBuffer: pByte; var aWriteCount : Word; const TimeOut : TMilliSeconds) : boolean;
{$ENDIF}

{$IF DEFINED(IMPLEMENTATION)}
function TSPIRegistersHelper.ReadByte : byte; inline;
begin
  WaitForTXReady;
  WriteDR($ff);
  WaitForRXReady;
  Result := ReadDR;
end;

function TSPIRegistersHelper.ReadByte(out aReadByte: byte; const TimeOut : TMilliSeconds):boolean; inline;
var
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  if WaitForTXReady(EndTime) = false then
    exit(false);
  WriteDR($ff);

  if WaitForRXReady(EndTime) = false then
    exit(false);
  aReadByte := ReadDR;
  Result := true;
end;

procedure TSPIRegistersHelper.WriteByte(const aWriteByte: byte);
begin
  WaitForTXReady;
  WriteDR(aWriteByte);
end;

function TSPIRegistersHelper.WriteByte(const aWriteByte: byte; const TimeOut: TMilliSeconds) : boolean;
var
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  if WaitForTXReady(EndTime) = false then
    exit(false);
  WriteDR(aWriteByte);

  Result := true;
end;

function TSPIRegistersHelper.TransferByte(const aWriteByte : byte) : byte; inline;
begin
  WaitForTXReady;
  WriteDR(aWriteByte);

  WaitForRXReady;
  Result := ReadDR;
end;

function TSPIRegistersHelper.TransferByte(const aWriteByte : byte; out aReadByte : byte; const TimeOut : TMilliSeconds) : boolean; inline;
var
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  if WaitForTXReady(EndTime) = false then
    exit(false);
  WriteDR(aWriteByte);

  if WaitForRXReady(EndTime) = false then
    exit(false);
  aReadByte := ReadDR;

  Result := true;
end;

procedure TSPIRegistersHelper.ReadBytes(out aReadBuffer: array of byte);
var
  i : longWord;
begin
  for i := 0 to High(aReadbuffer) do
  begin
    WaitForTXReady;
    WriteDR($ff);

    WaitForRXReady;
    aReadBuffer[i] := ReadDR;
  end;
end;

procedure TSPIRegistersHelper.ReadBytes(out aReadBuffer: array of byte; aReadCount : integer);
var
  i : longWord;
begin
  for i := 0 to aReadCount-1 do
  begin
    WaitForTXReady;
    WriteDR($ff);

    WaitForRXReady;
    aReadBuffer[i] := ReadDR;
  end;
end;

function TSPIRegistersHelper.ReadBytes(out aReadBuffer: array of byte; var aReadCount : integer; const TimeOut : TMilliSeconds):boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  for i := 0 to aReadCount-1 do
  begin
    if WaitForTXReady(EndTime) = false then
    begin
      aReadCount := i;
      exit(false);
    end;
    WriteDR($ff);

    if WaitForRXReady(EndTime) = false then
    begin
      aReadCount := i;
      exit(false);
    end;
    aReadBuffer[i] := ReadDR;
  end;
  Result := true;
end;

procedure TSPIRegistersHelper.WriteBytes(const aWriteBuffer: array of byte);
var
  i : longWord;
begin
  for i := 0 to High(aWritebuffer) do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i]);
  end;
end;

procedure TSPIRegistersHelper.WriteBytes(const aWriteBuffer: array of byte; aWriteCount : integer);
var
  i : longWord;
begin
  for i := 0 to aWriteCount -1  do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i]);
  end;
end;

function TSPIRegistersHelper.WriteBytes(const aWriteBuffer: array of byte; aWriteCount : integer; const TimeOut : TMilliSeconds) : boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  for i := 0 to aWriteCount-1 do
  begin
    if WaitForTXReady(EndTime) = false then
    begin
      aWriteCount := i;
      exit(false);
    end;
    WriteDR(aWriteBuffer[i]);
  end;
  Result := true;
end;

procedure TSPIRegistersHelper.TransferBytes(const aWriteBuffer: array of byte; out aReadBuffer : array of byte);
var
  i : longWord;
begin
  for i := 0 to high(aWriteBuffer) do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i]);

    WaitForRXReady;
    aReadBuffer[i] := ReadDR;
  end;
end;

procedure TSPIRegistersHelper.TransferBytes(const aWriteBuffer: array of byte; out aReadBuffer : array of byte; aTransferCount : integer);
var
  i : longWord;
begin
  for i := 0 to aTransferCount-1 do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i]);

    WaitForRXReady;
    aReadBuffer[i] := ReadDR;
  end;
end;

function TSPIRegistersHelper.TransferBytes(const aWriteBuffer: array of byte; out aReadBuffer : array of byte; aTransferCount : integer; const TimeOut : TMilliSeconds) : boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  for i := 0 to aTransferCount-1 do
  begin
    if WaitForTXReady(EndTime) = false then
    begin
      aTransferCount := i;
      exit(false);
    end;
    WriteDR(aWriteBuffer[i]);

    if WaitForRXReady(EndTime) = false then
    begin
      aTransferCount := i;
      exit(false);
    end;
    aReadBuffer[i] := ReadDR;
  end;
  Result := true;
end;

function TSPIRegistersHelper.ReadWord : word; inline;
begin
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    WaitForTXReady;
    WriteDRWord($ffff);
    WaitForRXReady;
    Result := ReadDRWord;
  end
  else
  {$ENDIF}
  begin
    WaitForTXReady;
    WriteDR($ff);
    WaitForRXReady;
    Result := ReadDR shl 8;
    WaitForTXReady;
    WriteDR($ff);
    WaitForRXReady;
    Result := Result or ReadDR;
  end;
end;

function TSPIRegistersHelper.ReadWord(out aReadWord: word; const TimeOut : TMilliSeconds):boolean; inline;
var
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDRWord($ffff);

    if WaitForRXReady(EndTime) = false then
      exit(false);
    aReadWord := ReadDRWord;
  end
  else
  {$ENDIF}
  begin
    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDR($ff);

    if WaitForRXReady(EndTime) = false then
      exit(false);
    aReadWord := ReadDR shl 8;

    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDR($ff);

    if WaitForRXReady(EndTime) = false then
      exit(false);
    aReadWord := aReadWord or ReadDR;
  end;
  Result := true;
end;

procedure TSPIRegistersHelper.WriteWord(const aWriteWord: word); inline;
begin
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    WaitForTXReady;
    WriteDRWord(aWriteWord);
  end
  else
  {$ENDIF}
  begin
    WaitForTXReady;
    WriteDR(aWriteWord shr 8);
    WaitForTXReady;
    WriteDR(aWriteWord and $ff);
  end;
end;

function TSPIRegistersHelper.WriteWord(const aWriteWord: word; const TimeOut : TMilliSeconds) : boolean; inline;
var
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDRWord(aWriteWord);
  end
  else
  {$ENDIF}
  begin
    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDR(aWriteWord shr 8);

    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDR(aWriteWord and $ff);
  end
end;

function TSPIRegistersHelper.TransferWord(const aWriteWord: word) : word; inline;
begin
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    WaitForTXReady;
    WriteDRWord(aWriteWord);
    WaitForRXReady;
    Result := ReadDRWord;
  end
  else
  {$ENDIF}
  begin
    WaitForTXReady;
    WriteDR(aWriteWord shr 8);

    WaitForRXReady;
    Result := ReadDR shl 8;

    WaitForTXReady;
    WriteDR(aWriteWord and $ff);

    WaitForRXReady;
    Result := Result or ReadDR;
  end;
end;

function TSPIRegistersHelper.TransferWord(const aWriteWord: word; out aReadWord : word; const TimeOut : TMilliSeconds) : boolean; inline;
var
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDRWord(aWriteWord);

    if WaitForRXReady(EndTime) = false then
      exit(false);
    aReadWord := ReadDRWord;
  end
  else
  {$ENDIF}
  begin
    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDR(aWriteWord shr 8);

    if WaitForRXReady(EndTime) = false then
      exit(false);
    aReadWord := ReadDR shl 8;

    if WaitForTXReady(EndTime) = false then
      exit(false);
    WriteDR(aWriteWord and $ff);

    if WaitForRXReady(EndTime) = false then
      exit(false);
    aReadWord := aReadWord or ReadDR;
  end;
  Result := true;
end;

procedure TSPIRegistersHelper.ReadWords(out aReadBuffer: array of word);
var
  i : longWord;
begin
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    for i := 0 to High(aReadBuffer) do
    begin
      WaitForTXReady;
      WriteDRWord($ffff);

      WaitForRXReady;
      aReadBuffer[i] := ReadDRWord;
    end;
  end
  else
  {$ENDIF}
  for i := 0 to High(aReadBuffer) do
  begin
    WaitForTXReady;
    WriteDR($ff);

    WaitForRXReady;
    aReadBuffer[i] := ReadDR shl 8;

    WaitForTXReady;
    WriteDR($ff);

    WaitForRXReady;
    aReadBuffer[i] := aReadBuffer[i] or ReadDR;
  end;
end;

procedure TSPIRegistersHelper.ReadWords(out aReadBuffer: array of word; const aReadCount : integer);
var
  i : longWord;
begin
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    for i := 0 to aReadCount -1 do
    begin
      WaitForTXReady;
      WriteDRWord($ffff);

      WaitForRXReady;
      aReadBuffer[i] := ReadDRWord;
    end;
  end
  else
  {$ENDIF}
  for i := 0 to aReadCount-1 do
  begin
    WaitForTXReady;
    WriteDR($ff);

    WaitForRXReady;
    aReadBuffer[i] := ReadDR shl 8;

    WaitForTXReady;
    WriteDR($ff);

    WaitForRXReady;
    aReadBuffer[i] := aReadBuffer[i] or ReadDR;
  end;
end;

function TSPIRegistersHelper.ReadWords(out aReadBuffer: array of word; var aReadCount : integer; const TimeOut : TMilliSeconds):boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    for i := 0 to aReadCount-1 do
    begin
      if WaitForTXReady(EndTime) = false then
      begin
        aReadCount := i;
        exit(false);
      end;
      WriteDRWord($ffff);

      if WaitForRXReady(EndTime) = false then
      begin
        aReadCount := i;
        exit(false);
      end;
      aReadBuffer[i] := ReadDRWord;
    end;
  end
  else
 {$ENDIF}
  for i := 0 to aReadCount-1 do
  begin
    if WaitForTXReady(EndTime) = false then
    begin
      aReadCount := i;
      exit(false);
    end;
    WriteDR($ff);

    if WaitForRXReady(EndTime) = false then
    begin
      aReadCount := i;
      exit(false);
    end;
    aReadBuffer[i] := ReadDR shl 8;

    if WaitForTXReady(EndTime) = false then
    begin
      aReadCount := i;
      exit(false);
    end;
    WriteDR($ff);

    if WaitForRXReady(EndTime) = false then
    begin
      aReadCount := i;
      exit(false);
    end;
    aReadBuffer[i] := aReadBuffer[i] or (ReadDR and $ff);
  end;
end;

procedure TSPIRegistersHelper.WriteWords(const aWriteBuffer: array of word);
var
  i : longWord;
begin
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    for i := 0 to High(aWriteBuffer) do
    begin
      WaitForTXReady;
      WriteDRWord(aWriteBuffer[i]);
    end;
  end
  else
  {$ENDIF}
  for i := 0 to High(aWriteBuffer) do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i] shr 8);
    WaitForTXReady;
    WriteDR(aWriteBuffer[i] and $ff);
  end;
end;

procedure TSPIRegistersHelper.WriteWords(const aWriteBuffer: array of word; const aWriteCount : integer);
var
  i : longWord;
begin
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    for i := 0 to aWriteCount-1 do
    begin
      WaitForTXReady;
      WriteDRWord(aWriteBuffer[i]);
    end;
  end
  else
  {$ENDIF}
  for i := 0 to aWriteCount-1 do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i] shr 8);

    WaitForTXReady;
    WriteDR(aWriteBuffer[i] and $ff);
  end;
end;

function TSPIRegistersHelper.WriteWords(const aWriteBuffer: array of word; var aWriteCount : integer; const TimeOut : TMilliSeconds) : boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    for i := 0 to aWriteCount-1 do
    begin
      if WaitForTXReady(EndTime) = false then
      begin
        aWriteCount := i;
        exit(false);
      end;
      WriteDRWord(aWriteBuffer[i]);
    end;
  end
  else
 {$ENDIF}
  for i := 0 to aWriteCount-1 do
  begin
    if WaitForTXReady(EndTime) = false then
    begin
      aWriteCount := i;
      exit(false);
    end;
    WriteDR(aWriteBuffer[i] shr 8);

    if WaitForTXReady(EndTime) = false then
    begin
      aWriteCount := i;
      exit(false);
    end;
    WriteDR(aWriteBuffer[i] and $ff);
  end;
  Result := true;
end;

procedure TSPIRegistersHelper.TransferWords(const aWriteBuffer: array of word; out aReadBuffer : array of word);
var
  i : longWord;
begin
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    for i := 0 to High(aWriteBuffer) do
    begin
      WaitForTXReady;
      WriteDRWord(aWritebuffer[i]);

      WaitForRXReady;
      aReadBuffer[i] := ReadDRWord;
    end;
  end
  else
  {$ENDIF}
  for i := 0 to High(aWriteBuffer) do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i] shr 8);

    WaitForRXReady;
    aReadBuffer[i] := ReadDR shl 8;

    WaitForTXReady;
    WriteDR(aWriteBuffer[i] and $ff);

    WaitForRXReady;
    aReadBuffer[i] := aReadBuffer[i] or ReadDR;
  end;
end;

procedure TSPIRegistersHelper.TransferWords(const aWriteBuffer: array of word; out aReadBuffer : array of word; const aTransferCount : integer);
var
  i : longWord;
begin
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    for i := 0 to aTransferCount-1 do
    begin
      WaitForTXReady;
      WriteDRWord(aWritebuffer[i]);

      WaitForRXReady;
      aReadBuffer[i] := ReadDRWord;
    end;
  end
  else
  {$ENDIF}
  for i := 0 to aTransferCount-1 do
  begin
    WaitForTXReady;
    WriteDR(aWriteBuffer[i] shr 8);

    WaitForRXReady;
    aReadBuffer[i] := ReadDR shl 8;

    WaitForTXReady;
    WriteDR(aWriteBuffer[i] and $ff);

    WaitForRXReady;
    aReadBuffer[i] := aReadBuffer[i] or ReadDR;
  end;
end;

function TSPIRegistersHelper.TransferWords(const aWriteBuffer: array of word; out aReadBuffer : array of word; var aTransferCount : integer; const TimeOut : TMilliSeconds) : boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;
  {$IF defined(HAS_SPI_16Bits)}
  if GetBitsPerWord > TSPIBitsPerWord.Eight then
  begin
    for i := 0 to aTransferCount-1 do
    begin
      if WaitForTXReady(EndTime) = false then
      begin
        aTransferCount := i;
        exit(false);
      end;
      WriteDRWord(aWriteBuffer[i]);

      if WaitForRXReady(EndTime) = false then
      begin
        aTransferCount := i;
        exit(false);
      end;
      aReadBuffer[i] := ReadDRWord;
    end;
  end
  else
 {$ENDIF}
  for i := 0 to aTransferCount-1 do
  begin
    if WaitForTXReady(EndTime) = false then
    begin
      aTransferCount := i;
      exit(false);
    end;
    WriteDR(aWriteBuffer[i] shr 8);

    if WaitForRXReady(EndTime) = false then
    begin
      aTransferCount := i;
      exit(false);
    end;
    aReadBuffer[i] := ReadDR shl 8;

    if WaitForTXReady(EndTime) = false then
    begin
      aTransferCount := i;
      exit(false);
    end;
    WriteDR(aWriteBuffer[i] and $ff);

    if WaitForRXReady(EndTime) = false then
    begin
      aTransferCount := i;
      exit(false);
    end;
    aReadBuffer[i] := aReadBuffer[i] or ReadDR;
  end;
  Result := true;
end;

procedure TSPIRegistersHelper.WriteBuffer(const pWriteBuffer: pByte; const aWriteCount : Word);
var
  i : longWord;
begin
  for i := 0 to aWriteCount-1 do
  begin
    WaitForTXReady;
    WriteDR(pTByteArray(pWriteBuffer)^[i]);
  end;
end;

function TSPIRegistersHelper.WriteBuffer(const pWriteBuffer: pByte; var aWriteCount : Word; const TimeOut : TMilliSeconds) : boolean;
var
  i : longWord;
  EndTime : longWord;
begin
  EndTime := SystemCore.GetTickCount + TimeOut;

  for i := 0 to aWriteCount-1 do
  begin
    if WaitForTXReady(EndTime) = false then
    begin
      aWriteCount := i;
      exit(false);
    end;
    WriteDR(pTByteArray(pWriteBuffer)^[i]);
  end;
  Result := true;
end;
{$ENDIF}

