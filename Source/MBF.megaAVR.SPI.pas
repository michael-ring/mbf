unit mbf.megaAVR.spi;
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
interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.megaAVR.GPIO,
  MBF.megaAVR.SystemCore;

{$REGION PinDefinitions}

type
  TSPIMOSIPins = (
                                                    PB3_SPI1 = TNativePin.PB3
  {$if defined(has_arduinopins)                 },  D11_SPI  = TNativePin.PB3  {$endif}
  );


  TSPIMISOPins = (
                                                    PB4_SPI1 = TNativePin.PB4
  {$if defined(has_arduinopins)                 },  D12_SPI  = TNativePin.PB4  {$endif}
  );


  TSPISCLKPins = (
                                                    PB5_SPI1 = TNativePin.PB5
  {$if defined(has_arduinopins)                 },  D13_SPI  = TNativePin.PB5  {$endif}
  );

  TSPINSSPins = (
                                                    PB2_SPI1 = TNativePin.PB2
  {$if defined(has_arduinopins)                 },  D10_SPI  = TNativePin.PB2  {$endif}
  );

{$ENDREGION}

const
  DefaultSPIBaudrate=10000000;
  MaxSPIBaudrate=10000000;

type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    Eight=0
  );

  TSPIOperatingMode = (
    Slave=%0,
    Master=%1
  );

  TSPI_Registers = record
    SPCR : byte;
    SPSR : byte;
    SPDR : byte;
  end;

const
  SPI0_BASE=$4C;
type
  TSPIRegistersHelper = record helper for TSPI_Registers
  protected
    function  FindDividerValue(const Baudrate: longWord) : longWord;
    function  GetBaudrate: longWord;
    procedure SetBaudrate(const aBaudrate: longWord);
    function  GetBitsPerWord: TSPIBitsPerWord;
    procedure SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
    function  GetMode: TSPIMode;
    procedure SetMode(const aMode: TSPIMode);
    function  GetOperatingMode: TSPIOperatingMode;
    procedure SetOperatingMode(const aOperatingMode: TSPIOperatingMode);

    procedure SetMOSIPin(const aMOSIPin : TSPIMOSIPins);
    procedure SetMISOPin(const aMISOPin : TSPIMISOPins);
    procedure SetSCLKPin(const aSCLKPin : TSPISCLKPins);
    procedure SetNSSPin( const aNSSPin : TSPINSSPins);
  public
    procedure Initialize;
    procedure Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins); overload;
    function  Disable : boolean;
    procedure Enable;

    procedure WaitForTXFinished;
    procedure BeginTransaction; inline;
    procedure EndTransaction; inline;
    procedure BeginTransaction(const SoftNSSPin : TPinIdentifier); inline;
    procedure EndTransaction(const SoftNSSPin : TPinIdentifier); inline;

    function ReadByte(var aByte: byte):boolean; inline;
    function ReadByte(var aByte: byte; const TimeOut : TMilliSeconds):boolean; inline;
    function WriteByte(const aByte: byte):boolean; inline;
    function WriteByte(const aByte: byte; const TimeOut : TMilliSeconds) : boolean; inline;
    function TransferByte(const aWriteByte : byte; var aReadByte : byte) : boolean; inline;
    function TransferByte(const aWriteByte : byte; var aReadByte : byte; const TimeOut : TMilliSeconds) : boolean; inline;

    function ReadBytes(var aBuffer: array of byte; aCount : integer):boolean;
    function ReadBytes(var aBuffer: array of byte; aCount : integer; const TimeOut : TMilliSeconds):boolean;
    function WriteBytes(const aBuffer: array of byte; aCount : integer) : boolean;
    function WriteBytes(const aBuffer: array of byte; aCount : integer; const TimeOut : TMilliSeconds) : boolean;
    function TransferBytes(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aCount : integer) : boolean;
    function TransferBytes(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aCount : integer; const TimeOut : TMilliSeconds) : boolean;

    function ReadWord(var aWord: word): boolean; inline;
    function ReadWord(var aWord: word; const TimeOut : TMilliSeconds):boolean; inline;
    function WriteWord(const aWord: word):boolean; inline;
    function WriteWord(const aWord: word; const TimeOut : TMilliSeconds) : boolean; inline;
    function TransferWord(const aWriteWord: word; var aReadWord : word) : boolean; inline;
    function TransferWord(const aWriteWord: word; var aReadWord : word; const TimeOut : TMilliSeconds) : boolean; inline;

    function ReadWords(var aBuffer: array of word; aCount : integer):boolean;
    function ReadWords(var aBuffer: array of word; aCount : integer; const TimeOut : TMilliSeconds):boolean;
    function WriteWords(const aBuffer: array of word; aCount : integer) : boolean;
    function WriteWords(const aBuffer: array of word; aCount : integer; const TimeOut : TMilliSeconds) : boolean;
    function TransferWords(const aWriteBuffer: array of word; var aReadBuffer : array of word; aCount : integer) : boolean;
    function TransferWords(const aWriteBuffer: array of word; var aReadBuffer : array of word; aCount : integer; const TimeOut : TMilliSeconds) : boolean;

    function WriteBuffer(pBuffer: pByte; aCount : Word) : boolean;
    function WriteBuffer(pBuffer: pByte; aCount : Word; const TimeOut : TMilliSeconds) : boolean;

    property Baudrate : longWord read getBaudrate write setBaudrate;
    property Mode : TSPIMode read getMode write setMode;
    //property BitsPerWord : TSPIBitsPerWord read getBitsPerWord write setBitsPerWord;
    property OperatingMode : TSPIOperatingMode read getOperatingMode write setOperatingMode;

    property MOSIPin : TSPIMOSIPins write setMOSIPin;
    property MISOPin : TSPIMISOPins write setMISOPin;
    property SCLKPin : TSPISCLKPins write setSCLKPin;
    property NSSPin  : TSPINSSPins  write setNSSPin;
  end;

  {$IF DEFINED(HAS_ARDUINOPINS)}
  var
    SPI : TSPI_Registers absolute SPI0_BASE;
  {$ENDIF HAS ARDUINOPINS}

implementation
uses
  MBF.BitHelpers;

var
  NSSPins : array[1..1] of TPinIdentifier;

procedure TSPIRegistersHelper.Initialize;
var
  i : byte;
begin
  //We need to save the primary SPI Pin in Memory so that we can reuse it
  for i := 1 to length(NSSPins) do
    NSSPins[i] := TNativePin.None;

  // Set Defaults, Master Mode, SPI disabled
  self.SPCR := 0;

  // Disable Double Speed Mode
  Self.SPSR:= 0;

  // Set Master Mode
  setBit(self.SPCR,4);

  // Set correct Polarity and Phase aka as Mode 0-3
  setBitsMasked(self.SPCR,byte(TSPIMode.Mode0),%11 shl 2,2);
end;

procedure TSPIRegistersHelper.Initialize(const AMosiPin : TSPIMOSIPins;
                     const AMisoPin : TSPIMISOPins;
                     const ASCLKPin : TSPISCLKPins;
                     const ANSSPin  : TSPINSSPins); overload;
begin
  Initialize;
  setBaudRate(DefaultSPIBaudrate);
  setBitsPerWord(TSPIBitsPerWord.Eight);

  //Set configuration as defined by user
  GPIO.PinMode[TPinIdentifier(AMOSIPin)] := TPinMode.Output;
  GPIO.PinMode[TPinIdentifier(AMISOPin)] := TPinMode.Input;
  GPIO.PinMode[TPinIdentifier(ASCLKPin)] := TPinMode.Output;
  // Some special handling needed
  setNSSPin(aNSSPin);
  // Todo Find a better place to Enable the SPI
  Enable;
end;

procedure TSPIRegistersHelper.SetMOSIPin(const aMOSIPin : TSPIMOSIPins);
begin
  GPIO.PinMode[longWord(aMOSIPin) and $ff] := TPinMode.Output;
end;

procedure TSPIRegistersHelper.setMISOPin(const aMISOPIN : TSPIMISOPins);
begin
  GPIO.PinMode[longWord(aMISOPin) and $ff] := TPinMode.Input;
end;

procedure TSPIRegistersHelper.setSCLKPin(const aSCLKPin : TSPISCLKPins);
begin
  GPIO.PinMode[longWord(aSCLKPin) and $ff] := TPinMode.Output;
end;

procedure TSPIRegistersHelper.setNSSPin(const aNSSPin : TSPINSSPins);
begin
  if TPinIdentifier(aNSSPin) <> TNativePin.None then
  begin
    GPIO.PinMode[TPinIdentifier(aNSSPin)] := TPinMode.Output;
    GPIO.SetPinLevelHigh(TPinIdentifier(aNSSPin));
  end;

  NSSPins[1] := TPinIdentifier(aNSSPin);
end;

function TSPIRegistersHelper.Disable : boolean;
begin
  Result := GetBitValue(Self.SPCR,6) > 0;
  SetBitLevelLow(Self.SPCR,6);
end;

procedure TSPIRegistersHelper.Enable;
begin
  SetBitLevelHigh(Self.SPCR,6);
end;

function TSPIRegistersHelper.FindDividerValue(const Baudrate: longWord): longWord;
const
  DividerValues : array[0..7] of byte = (%100,%000,%101,%001,%110,%010,%111,%100);
var
  BaseFrequency : longWord;
begin
  BaseFrequency := SystemCore.GetCPUFrequency;

  for result := 0 to 7 do
    if BaudRate >= (BaseFrequency div word(2 shl result)) then
      break;
  result := DividerValues[Result];
end;

function TSPIRegistersHelper.GetBaudrate: longWord;
var
  BaseFrequency : longWord;
begin
  BaseFrequency := SystemCore.GetCPUFrequency;
  if GetBit(self.SPSR,7) = 0 then
    BaseFrequency := BaseFrequency div 2;
  Result := BaseFrequency shr (GetBitsMasked(self.SPCR,%11 shl 0,0)+1);
end;

procedure TSPIRegistersHelper.SetBaudrate(const aBaudrate: longWord);
var
  Divider : longWord;
  Status : boolean;
begin
  status := Disable;
  Divider := FindDividerValue(aBaudrate);
  SetBitsMasked(self.SPCR,Divider and %11,%11 shl 0,0);
  setBitValue(self.SPSR,Divider shr 2,0);
  if status = true then
    Enable;
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord.Eight;
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const aBitsPerWord: TSPIBitsPerWord);
begin
  //Only Eight Bits are possible
end;

function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode(GetBitsMasked(Self.SPCR,%11 shl 2,2));
end;

procedure TSPIRegistersHelper.SetMode(const aMode: TSPIMode);
var
  Status : boolean;
begin
  status := Disable;
  SetBitsMasked(Self.SPCR,byte(aMode),%11 shl 2,2);
  if status = true then
    Enable;
end;


procedure TSPIRegistersHelper.SetOperatingMode(const aOperatingMode: TSPIOperatingMode);
begin
  //TODO
end;

function TSPIRegistersHelper.GetOperatingMode: TSPIOperatingMode;
begin
  Result := TSPIOperatingMode(GetBitValue(self.SPCR,4));
end;

{$WARN 5027 off : Local variable "$1" is assigned but never used}
procedure TSPIRegistersHelper.WaitForTXFinished;
var
  Dummy : word;
begin
  //Make sure are Data is shifted out
  WaitBitIsSet(Self.SPSR,7);
  dummy := self.SPDR;
end;
{$WARN 5027 on : Local variable "$1" is assigned but never used}

procedure TSPIRegistersHelper.BeginTransaction; inline;
begin
  GPIO.SetPinLevelLow(NSSPins[1] and $ff);
end;

procedure TSPIRegistersHelper.EndTransaction; inline;
begin
  GPIO.SetPinLevelHigh(NSSPins[1] and $ff);
end;

procedure TSPIRegistersHelper.BeginTransaction(const SoftNSSPin : TPinIdentifier); inline;
begin
  GPIO.SetPinLevelLow(SoftNSSPin and $ff);
end;

procedure TSPIRegistersHelper.EndTransaction(const SoftNSSPin : TPinIdentifier); inline;
begin
  GPIO.SetPinLevelHigh(SoftNSSPin and $ff);
end;

function TSPIRegistersHelper.TransferByte(const aWriteByte : Byte; var aReadByte : Byte) : boolean; inline;
begin
  Result := True;
  self.SPDR := aWriteByte;
  WaitBitIsSet(self.SPSR,7);
  aReadByte := self.SPDR;
end;

function TSPIRegistersHelper.TransferByte(const aWriteByte : Byte; var aReadByte : Byte; const TimeOut : TMilliSeconds): boolean; inline;
var
  EndTime : longWord;
begin
  Result := true;
  EndTime := SystemCore.GetTickCount + TimeOut;
  self.SPDR := aWriteByte;
  if WaitBitIsSet(self.SPSR,7,EndTime) = false then
    exit(false);
  aReadByte := self.SPDR;
end;

function TSPIRegistersHelper.WriteByte(const aByte: byte) : boolean; inline;
var
  dummy : byte;
begin
  Result := true;
  self.SPDR := aByte;
  WaitBitIsSet(self.SPSR,7);
  dummy := self.SPDR;
end;

function TSPIRegistersHelper.WriteByte(const aByte: byte; const TimeOut : TMilliSeconds) : boolean;
var
  EndTime : longWord;
  dummy : byte;
begin
  Result := true;
  EndTime := SystemCore.GetTickCount + TimeOut;
  self.SPDR := aByte;
  if WaitBitIsSet(self.SPSR,7,EndTime) = false then
    exit(false);
  dummy := self.SPDR;
end;

function TSPIRegistersHelper.ReadByte(var aByte: byte):boolean; inline;
begin
  Result := TransferByte($ff,aByte);
end;

function TSPIRegistersHelper.ReadByte(var aByte: byte; const TimeOut : TMilliSeconds):boolean;
begin
  Result := TransferByte($ff,aByte,TimeOut);
end;

function TSPIRegistersHelper.TransferBytes(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aCount : integer) : boolean;
var
  i : integer;
begin
  Result := true;
  if length(aWriteBuffer) <> length(aReadBuffer) then
    exit(false);

  if aCount = -1 then
    aCount := High(aWriteBuffer) - Low(aWriteBuffer)
  else
    dec(aCount); // to fix loop count

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aCount do
  begin
    self.SPDR := aWriteBuffer[i];
    WaitBitIsSet(self.SPSR,7);
    aReadBuffer[i] := self.SPDR;
  end;
end;

function TSPIRegistersHelper.TransferBytes(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aCount : integer; const TimeOut : TMilliSeconds) : boolean;
var
  i : integer;
  EndTime : longWord;
begin
  Result := true;
  if length(aWriteBuffer) <> length(aReadBuffer) then
    exit(false);

  if aCount = -1 then
    aCount := High(aWriteBuffer) - Low(aWriteBuffer)
  else
    dec(aCount); // to fix loop count

  EndTime := SystemCore.GetTickCount + TimeOut;
  for i := Low(aWritebuffer) to Low(aWritebuffer)+aCount do
  begin
    self.SPDR := aWriteBuffer[i];
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    aReadBuffer[i] := self.SPDR;
  end;
end;

function TSPIRegistersHelper.WriteBytes(const aBuffer: array of byte; aCount : integer ): boolean;
var
  i : integer;
  dummy : byte;
begin
  Result := true;
  if aCount = -1 then
    aCount := High(aBuffer) - Low(aBuffer)
  else
    dec(aCount); // to fix loop count

  for i := Low(aBuffer) to Low(aBuffer)+aCount do
  begin
    self.SPDR := aBuffer[i];
    WaitBitIsSet(self.SPSR,7);
    dummy := self.SPDR;
  end;
end;

function TSPIRegistersHelper.WriteBytes(const aBuffer: array of byte; aCount : integer; const TimeOut : TMilliSeconds) : boolean;
var
  i : integer;
  EndTime : longWord;
  dummy : byte;
begin
  Result := true;
  if aCount = -1 then
    aCount := High(aBuffer) - Low(aBuffer)
  else
    dec(aCount); // to fix loop count

  EndTime := SystemCore.GetTickCount + TimeOut;
  for i := Low(aBuffer) to Low(aBuffer)+aCount do
  begin
    self.SPDR := aBuffer[i];
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    dummy := self.SPDR;
  end;
end;

function TSPIRegistersHelper.ReadBytes(var aBuffer: array of byte; aCount : integer):boolean;
var
  i : integer;
begin
  Result := true;

  if aCount = -1 then
    aCount := High(aBuffer) - Low(aBuffer)
  else
    dec(aCount); // to fix loop count

  for i := Low(aBuffer) to Low(aBuffer)+aCount do
  begin
    self.SPDR := $ff;
    WaitBitIsSet(self.SPSR,7);
    aBuffer[i] := self.SPDR;
  end;
end;

function TSPIRegistersHelper.ReadBytes(var aBuffer: array of byte; aCount : integer; const TimeOut : TMilliSeconds):boolean;
var
  i : integer;
  EndTime : longWord;
begin
  Result := true;

  if aCount = -1 then
    aCount := High(aBuffer) - Low(aBuffer)
  else
    dec(aCount); // to fix loop count

  EndTime := SystemCore.GetTickCount + TimeOut;
  for i := Low(aBuffer) to Low(aBuffer)+aCount do
  begin
    self.SPDR := $ff;
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    aBuffer[i] := self.SPDR;
  end;
end;

function TSPIRegistersHelper.TransferWord(const aWriteWord : Word; var aReadWord : Word) : boolean ; inline;
begin
  self.SPDR := aWriteWord shr 8;
  WaitBitIsSet(self.SPSR,7);
  aReadWord := self.SPDR shl 8;

  self.SPDR := aWriteWord and $ff;
  WaitBitIsSet(self.SPSR,7);
  aReadWord := aReadWord or self.SPDR;
end;

function TSPIRegistersHelper.TransferWord(const aWriteWord : Word; var aReadWord : Word; const TimeOut : TMilliSeconds): boolean; inline;
var
  EndTime : longWord;
begin
  Result := true;
  // Wait for TX Buffer empty
  EndTime := SystemCore.GetTickCount + TimeOut;

  self.SPDR := aWriteWord shr 8;
  if WaitBitIsSet(self.SPSR,7,EndTime) = false then
    exit(false);
  aReadWord := self.SPDR shl 8;

  self.SPDR := aWriteWord and $ff;
  if WaitBitIsSet(self.SPSR,7,EndTime) = false then
    exit(false);
  aReadWord := aReadWord or self.SPDR;
end;

function TSPIRegistersHelper.WriteWord(const aWord: word) : boolean ; inline;
var
  dummy : word;
begin
  Result := true;
  self.SPDR := aWord shr 8;
  WaitBitIsSet(self.SPSR,7);
  dummy := self.SPDR;

  self.SPDR := aWord and $ff;
  WaitBitIsSet(self.SPSR,7);
  dummy := self.SPDR;
end;

function TSPIRegistersHelper.WriteWord(const aWord: word; const TimeOut : TMilliSeconds) : boolean;
var
  EndTime : longWord;
  dummy : word;
begin
  Result := true;
  EndTime := SystemCore.GetTickCount + TimeOut;

  self.SPDR := aWord shr 8;
  if WaitBitIsSet(self.SPSR,7,EndTime) = false then
    exit(false);
  dummy := self.SPDR;

  self.SPDR := aWord and $ff;
  if WaitBitIsSet(self.SPSR,7,EndTime) = false then
    exit(false);
  dummy := self.SPDR;
end;

function TSPIRegistersHelper.ReadWord(var aWord: word) : boolean;
begin
  Result := TransferWord($ffff,aWord);
end;

function TSPIRegistersHelper.ReadWord(var aWord: word; const TimeOut : TMilliSeconds):boolean;
begin
  Result := TransferWord($ffff,aWord,TimeOut);
end;

function TSPIRegistersHelper.TransferWords(const aWriteBuffer: array of word; var aReadBuffer : array of word; aCount : integer) : boolean;
var
  i : integer;
begin
  Result := true;
  if length(aWriteBuffer) <> length(aReadBuffer) then
    exit(false);
  if aCount = -1 then
    aCount := High(aWriteBuffer) - Low(aWriteBuffer)
  else
    dec(aCount); // to fix loop count

  for i := Low(aWritebuffer) to Low(aWritebuffer)+aCount do
  begin
    self.SPDR := aWriteBuffer[i] shr 8;
    WaitBitIsSet(self.SPSR,7);
    aReadBuffer[i] := self.SPDR shl 8;

    self.SPDR := aWriteBuffer[i] and $ff;
    WaitBitIsSet(self.SPSR,7);
    aReadBuffer[i] := aReadBuffer[i] or self.SPDR;
  end;
end;

function TSPIRegistersHelper.TransferWords(const aWriteBuffer: array of word; var aReadBuffer : array of word; aCount : integer; const TimeOut : TMilliSeconds) : boolean;
var
  i : integer;
  EndTime : longWord;
begin
  Result := true;
  if length(aWriteBuffer) <> length(aReadBuffer) then
    exit(false);
  if aCount = -1 then
    aCount := High(aWriteBuffer) - Low(aWriteBuffer)
  else
    dec(aCount); // to fix loop count

  EndTime := SystemCore.GetTickCount + TimeOut;
  for i := Low(aWriteBuffer) to Low(aWriteBuffer)+aCount do
  begin
    self.SPDR := aWriteBuffer[i] shr 8;
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    aReadBuffer[i] := self.SPDR shl 8;

    self.SPDR := aWriteBuffer[i] and $ff;
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    aReadBuffer[i] := aReadBuffer[i] or self.SPDR;
  end;
end;

function TSPIRegistersHelper.WriteWords(const aBuffer: array of Word; aCount : integer) : boolean;
var
  i : integer;
  dummy : word;
begin
  Result := true;
  if aCount = -1 then
    aCount := High(aBuffer) - Low(aBuffer)
  else
    dec(aCount); // to fix loop count

  for i := Low(aBuffer) to Low(aBuffer)+aCount do
  begin
    self.SPDR := aBuffer[i] shr 8;
    WaitBitIsSet(self.SPSR,7);
    dummy := self.SPDR shl 8;

    self.SPDR := aBuffer[i] and $ff;
    WaitBitIsSet(self.SPSR,7);
    dummy := self.SPDR;
  end;
end;

function TSPIRegistersHelper.WriteWords(const aBuffer: array of Word; aCount : integer; const TimeOut : TMilliSeconds) : boolean;
var
  i : integer;
  EndTime : longWord;
  dummy : word;
begin
  Result := true;
  if aCount = -1 then
    aCount := High(aBuffer) - Low(aBuffer)
  else
    dec(aCount); // to fix loop count

  EndTime := SystemCore.GetTickCount + TimeOut;
  for i := Low(aBuffer) to Low(aBuffer)+aCount do
  begin
    self.SPDR := aBuffer[i] shr 8;
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    dummy := self.SPDR shl 8;

    self.SPDR := aBuffer[i] and $ff;
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    dummy := self.SPDR;
  end;
end;

function TSPIRegistersHelper.ReadWords(var aBuffer: array of word; aCount : integer):boolean;
var
  i : integer;
begin
  Result := true;
  if aCount = -1 then
    aCount := High(aBuffer) - Low(aBuffer)
  else
    dec(aCount); // to fix loop count

  for i := Low(aBuffer) to Low(aBuffer)+aCount do
  begin
    self.SPDR := $ff;
    WaitBitIsSet(self.SPSR,7);
    aBuffer[i] := self.SPDR shl 8;

    self.SPDR := $ff;
    WaitBitIsSet(self.SPSR,7);
    aBuffer[i] := aBuffer[i] or self.SPDR;
  end;
end;

function TSPIRegistersHelper.ReadWords(var aBuffer: array of word; aCount : integer; const TimeOut : TMilliSeconds):boolean;
var
  i : integer;
  EndTime : longWord;
begin
  Result := true;
  if aCount = -1 then
    aCount := High(aBuffer) - Low(aBuffer)
  else
    dec(aCount); // to fix loop count

  EndTime := SystemCore.GetTickCount + TimeOut;
  for i := Low(aBuffer) to Low(aBuffer)+aCount do
  begin
    self.SPDR := $ff;
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    aBuffer[i] := self.SPDR shl 8;

    self.SPDR := $ff;
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    aBuffer[i] := aBuffer[i] or self.SPDR;
  end;
end;

function TSPIRegistersHelper.WriteBuffer(pBuffer: pByte; aCount : Word) : boolean;
var
  i : Word;
  dummy : byte;
begin
  Result := true;
  for i := 1 to aCount do
  begin
    self.SPDR := pBuffer^;
    WaitBitIsSet(self.SPSR,7);
    inc(pBuffer);
    dummy := self.SPDR;
  end;
end;

function TSPIRegistersHelper.WriteBuffer(pBuffer: pByte; aCount : Word; const TimeOut : TMilliSeconds) : boolean;
var
  i : Word;
  EndTime : longWord;
  dummy : byte;
begin
  Result := true;
  EndTime := SystemCore.GetTickCount + TimeOut;
  for i := 1 to aCount do
  begin
    self.SPDR := pBuffer^;
    if WaitBitIsSet(self.SPSR,7,EndTime) = false then
      exit(false);
    inc(pBuffer);
    dummy := self.SPDR;
  end;
end;

end.

