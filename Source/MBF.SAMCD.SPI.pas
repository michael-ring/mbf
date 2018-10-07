unit MBF.SAMCD.SPI;
{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  Copyright (c) 2018 -  Alfred Glänzer

  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}
{< Atmel SAMD series GPIO functions. }

interface

{$include MBF.Config.inc}

uses
  MBF.SAMCD.Helpers,
  MBF.SAMCD.GPIO,
  MBF.SAMCD.SerCom;

//We do not implement 9 Bits support in this code
{$undefine has_spi_implementation_9bits}

//SPI includes are complex and automagically created, so include them to keep Sourcecode clean
{$include MBF.SAMCD.SPI.inc}
const
  DefaultSPIFrequency=100000;

type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    Eight=0,
    {$if defined(has_spi_implementation_9bits) }
    Nine=1,
    {$endif}
    Sixteen=2
  );

  TSPIOperatingMode = (
    Slave=%010,
    Master=%011
  );


type
  TSPI_Registers = TSercomSPI_Registers;
  TSPIRegistersHelper = record helper for TSercomSPI_Registers
  strict private
    function TXC_Ready:boolean;
    function DRE_Ready:boolean;
    function RXC_Ready:boolean;
    procedure SetNSSPinLow(const SoftNSSPin : TPinIdentifier);
    procedure SetNSSPinHigh(const SoftNSSPin : TPinIdentifier);
    procedure WriteSingleByte(aData:byte);
    {$if defined(has_spi_implementation_9bits) }
    procedure WriteSingleWord(aData:word);
    {$endif}
    function ReadSingleByte:byte;
    {$if defined(has_spi_implementation_9bits) }
    function ReadSingleWord:word;
    {$endif}
    function GetBaudrate: Cardinal;
    procedure SetBaudrate(const aFrequency: Cardinal);
    function GetBitsPerWord: TSPIBitsPerWord;
    procedure SetBitsPerWord(const aSPIBitsPerWord: TSPIBitsPerWord);
    function GetMode: TSPIMode;
    procedure SetMode(const aSPIMode: TSPIMode);
    function GetOperatingMode: TSPIOperatingMode;
    procedure SetOperatingMode(const aSPIOperatingMode: TSPIOperatingMode);
    procedure SetMOSIPin(const AMosiPin : TSPIMOSIPins);
    procedure SetMISOPin(const AMisoPin : TSPIMISOPins);
    procedure SetSCLKPin(const ASCLKPin : TSPISCLKPins);
    procedure SetNSSPin( const ANSSPin : TSPINSSPins);
  public
    procedure Initialize;
    procedure Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins);

    function Disable:boolean;
    procedure Enable;
    property MOSIPin : TSPIMOSIPins write setMOSIPin;
    property MISOPin : TSPIMISOPins write setMISOPin;
    property SCLKPin : TSPISCLKPins write setSCLKPin;
    property NSSPin  : TSPINSSPins  write setNSSPin;
    property Baudrate : Cardinal read getBaudrate write setBaudrate;
    property Mode : TSPIMode read getMode write setMode;
    property OperatingMode : TSPIOperatingMode read getOperatingMode write setOperatingMode;

    {$if defined(has_spi_implementation_9bits) }
    property BitsPerWord : TSPIBitsPerWord read getBitsPerWord write setBitsPerWord;
    {$endif}

    function ReadByte(var aReadByte: byte; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
    function ReadWord(var aReadWord: word; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
    function ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
    function ReadWord(var aReadBuffer: array of word; aReadCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;

    function WriteByte(const aWriteByte: byte; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteWord(const aWriteWord: word; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function WriteWord(const aWriteBuffer: array of word; aWriteCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;

    function TransferByte(const aWriteByte : byte; var aReadByte : byte; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function TransferWord(const aWriteWord: word; var aReadWord : word; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function TransferByte(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aTransferCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
    function TransferWord(const aWriteBuffer: array of word; var aReadBuffer : array of word; aTransferCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
end;

var
  {$if defined(has_spi0)}SPI0 : TSercomSpi_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(has_spi1)}SPI1 : TSercomSpi_Registers absolute SERCOM1_BASE;{$endif}
  {$if defined(has_spi2)}SPI2 : TSercomSpi_Registers absolute SERCOM2_BASE;{$endif}
  {$if defined(has_spi3)}SPI3 : TSercomSpi_Registers absolute SERCOM3_BASE;{$endif}
  {$if defined(has_spi4)}SPI4 : TSercomSpi_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(has_spi5)}SPI5 : TSercomSpi_Registers absolute SERCOM5_BASE;{$endif}
  {$if defined(has_spi6)}SPI6 : TSercomSpi_Registers absolute SERCOM6_BASE;{$endif}

  {$if defined(SAMC21XPRO)  }SPI : TSercomSpi_Registers absolute SERCOM3_BASE;{$endif}
  {$if defined(SAMD10XMINI) }SPI : TSercomSpi_Registers absolute SERCOM1_BASE;{$endif}
  {$if defined(SAMD11XPRO)  }SPI : TSercomSpi_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(SAMD20XPRO)  }SPI : TSercomSpi_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(SAMD21XPRO)  }SPI : TSercomSpi_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(ARDUINOZERO) }SPI : TSercomSpi_Registers absolute SERCOM1_BASE;{$endif}

implementation

uses
  MBF.BitHelpers,
  MBF.SAMCD.SystemCore;

var
  NSSPins : array[0..6] of TPinIdentifier;

procedure TSPIRegistersHelper.Initialize;
var
  i : byte;
begin
  //Clear all Registers and turn SPI off
  TSerCom_Registers(Self).Initialize;
  TSerCom_Registers(Self).SetCoreClockSource(GCLK_CLKCTRL_GEN_GCLK0); // use gclk0

  //Configure Mode0, Master, MSB First, Default SPI Frame Format, Run in Standby disabled
  CTRLA := longWord(TSPIOperatingMode.Master) shl 2;

  //Set 8-Bit Mode and Enable Receiver
  CTRLB := (longWord(TSPIBitsPerWord.Eight) shl 0) or (%1 shl 17);

  setBaudrate(DefaultSPIFrequency);

  for i := low(NSSPins) to high(NSSPins) do
    NSSPins[i] := -1;
end;

procedure TSPIRegistersHelper.Initialize(const AMosiPin : TSPIMOSIPins;
                                    const AMisoPin : TSPIMISOPins;
                                    const ASCLKPin : TSPISCLKPins;
                                    const ANSSPin  : TSPINSSPins);
var
  aDIPO,aDOPO : byte;
  PadLayout : byte;
begin
  Initialize;
  //Configure the provided Pins
  SetMOSIPin(AMOSIPin);
  SetMISOPin(AMISOPin);
  SetSCLKPin(ASCLKPin);
  SetNSSPin(ANSSPin);

  PadLayout :=              (longword(AMisoPin) shr 10) and %11000000;
  PadLayout := PadLayout or (longword(AMosiPin) shr 12) and %00110000;
  PadLayout := PadLayout or (longword(ASclkPin) shr 14) and %00001100;
  PadLayout := PadLayout or (longword(ANssPin)  shr 16) and %00000011;

  case PadLayout of
    //MISO=Pad[3] MOSI=Pad[0] SCLK=Pad[1] SS=Pad[2] or GPIO
    %11000110,
    %11000100: begin
        aDIPO := 3;
        aDOPO := 0;
      end;
    //MISO=Pad[0] MOSI=Pad[2] SCLK=Pad[3] SS=Pad[1] or GPIO
    %00101101,
    %00101100: begin
        aDIPO := 0;
        aDOPO := 1;
      end;
    //MISO=Pad[0] MOSI=Pad[3] SCLK=Pad[1] SS=Pad[2] or GPIO
    %00110110,
    %00110100: begin
        aDIPO := 0;
        aDOPO := 2;
      end;
    //MISO=Pad[2] MOSI=Pad[0] SCLK=Pad[3] SS=Pad[1] or GPIO
    %10001101,
    %10001100: begin
        aDIPO := 2;
        aDOPO := 3;
      end;
    else
      //TODO
      Halt;
  end;

  CTRLA:= (CTRLA and not((%11 shl 16) or (%11 shl 20))) or (aDipo shl 20) or (aDOPO shl 16);
end;

function TSPIRegistersHelper.Disable : boolean; inline;
begin
  //TODO check if making this local saves some CPU cycles
  //Save current status
  Result := (CTRLA and %10)<>0;
  //Clear Enable Bit
  CTRLA := CTRLA and (not %10);
  {$IF DEFINED(SAMD20)}
  WaitBitCleared(STATUS,15);
  {$ELSE}
  WaitBitCleared(SYNCBUSY,1);
  {$ENDIF}
end;

procedure TSPIRegistersHelper.Enable; inline;
begin
  //TODO check if making this local saves some CPU cycles
  CTRLA := CTRLA or %10;
  {$IF DEFINED(SAMD20)}
  WaitBitCleared(STATUS,15);
  {$ELSE}
  WaitBitCleared(SYNCBUSY,1);
  {$ENDIF}
end;

procedure TSPIRegistersHelper.SetMOSIPin(const AMosiPin : TSPIMOSIPins);
begin
  GPIO.PinMux[longWord(AMosiPin) and $ff] := TPinMux((longWord(AMosiPin) shr 8) and %111);
end;

procedure TSPIRegistersHelper.setMISOPin(const AMisoPin : TSPIMISOPins);
begin
  GPIO.PinMux[longWord(AMisoPin) and $ff] := TPinMux((longWord(AMisoPin) shr 8) and %111);
end;

procedure TSPIRegistersHelper.setSCLKPin(const ASCLKPin : TSPISCLKPins);
begin
  GPIO.PinMux[longWord(ASCLKPin) and $ff] := TPinMux((longWord(ASCLKPin) shr 8) and %111);
end;

procedure TSPIRegistersHelper.setNSSPin(const ANSSPin : TSPINSSPins);
var
  Index : longWord;
begin
  if longInt(ANSSPin) >=MuxA then
  begin
    //TODO Hardware NSS Mode does not work yet on SAMD21
    //{$if defined(SAMD20)}
      GPIO.PinMode[longWord(ANSSPin) and $ff] := TPinMode.Output;
      GPIO.SetPinLevelHigh(longWord(ANSSPin) and $ff);
    //{$else}
    //  GPIO.PinMux[longWord(ANSSPin) and $ff] := TPinMux((longWord(ANSSPin) shr 8) and %111);
    //{$endif}
  end
  else
  begin
    //The Pin we want to use is GPIO anyway (like on SAMC21's Arduino Pin)
    if longInt(ANSSPin) >= 0 then
    begin
      GPIO.PinMode[longWord(ANSSPin)] := TPinMode.Output;
      GPIO.SetPinLevelHigh(longWord(ANSSPin));
    end;
  end;
  //Save away the configuration of thos Sercom Instance
  NSSPins[(longWord(@Self) - SERCOM0_BASE) shr 10] := integer(ANSSPin);
end;


function TSPIRegistersHelper.TXC_Ready:boolean; inline;
begin
  result:=GetBit(INTFLAG,SERCOM_SPI_INTFLAG_TXC_Pos);
end;

function TSPIRegistersHelper.DRE_Ready:boolean; inline;
begin
  result:=GetBit(INTFLAG,SERCOM_SPI_INTFLAG_DRE_Pos);
end;

function TSPIRegistersHelper.RXC_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_SPI_INTFLAG_RXC_Pos);
end;

procedure TSPIRegistersHelper.WriteSingleByte(aData:byte);
begin
  WaitBitSet(INTFLAG,SERCOM_SPI_INTFLAG_DRE_Pos);
  DATA := aData;
  WaitBitSet(INTFLAG,SERCOM_SPI_INTFLAG_TXC_Pos);
end;

// This procedure should only get used for native 9-Bit mode which we do not support by default
{$if defined(has_spi_implementation_9bits) }
procedure TSPIRegistersHelper.WriteSingleWord(aData:word);
begin
  WaitBitSet(INTFLAG,SERCOM_SPI_INTFLAG_DRE_Pos);
  DATA := aData;
  WaitBitSet(INTFLAG,SERCOM_SPI_INTFLAG_TXC_Pos);
end;
{$endif}

function TSPIRegistersHelper.ReadSingleByte:byte;
begin
  WaitBitSet(INTFLAG,SERCOM_SPI_INTFLAG_RXC_Pos);
  result:=DATA;
end;

// This procedure should only get used for native 9-Bit mode which we do not support by default
{$if defined(has_spi_implementation_9bits) }
function TSPIRegistersHelper.ReadSingleWord:word;
begin
  WaitBitSet(INTFLAG,SERCOM_SPI_INTFLAG_RXC_Pos);
  result:=DATA;
end;
{$endif}

procedure TSPIRegistersHelper.SetNSSPinLow(const SoftNSSPin : TPinIdentifier);
var
  _NSSPin : TPinIdentifier;
begin
  //SAMD20 does not support Hardware Slave Select in Master Mode, so we need to mask out the extra data in the PinIdentifier
  //_NSSPin := NSSPins[(longWord(@Self) - SERCOM0_BASE) shr 10]{$if defined(SAMD20)} and $ff{$endif};
  //For now I have not yet figured out Hardware Slave Select at all, so make everything Software Slave Select
  _NSSPin := NSSPins[(longWord(@Self) - SERCOM0_BASE) shr 10] and $ff;

  if (SoftNSSPin = TNativePin.None) and (_NSSPin >=MuxA)  then
  begin
    {$if not defined(SAMD20)}
    //Turn Hardware NSS on
    CTRLB := CTRLB or (1 shl 13);
    WaitBitCleared(SYNCBUSY,2);
    {$ENDIF}
    exit;
  end;
  if SoftNSSPin = TNativePin.None then
    GPIO.SetPinLevelLow(_NSSPin)
  else
    GPIO.SetPinLevelLow(SoftNSSPin);
end;

procedure TSPIRegistersHelper.SetNSSPinHigh(const SoftNSSPin : TPinIdentifier);
var
  _NSSPin : TPinIdentifier;
begin
  //We have Hardware flow control active, bail out as fast as we can
  if (CTRLB shr 13) and %1 = %1 then
    exit;

  // We explicitly want Soft-Slave Select, handle it quickly
  if SoftNSSPin > TNativePin.None then
  begin
    GPIO.SetPinLevelHigh(_NSSPin);
    exit;
  end;

  _NSSPin := NSSPins[(longWord(@Self) - SERCOM0_BASE) shr 10];

  //TODO Hardware NSS not figured out yet, use Software NSS all the time
  //{$if defined(SAMD20)}
    //SAMD20 does not support Hardware NSS, change the pin to SoftNSS)
     _NSSPin := _NSSPin and $ff;
  //{$endif}

  //For SoftSPI we need to maually handle the SS Pin
  //if _NSSPin < MuxA then
  //Nothing special to check as we only can come here via Software Slave-Select
    GPIO.SetPinLevelHigh(_NSSPin);
end;

function TSPIRegistersHelper.WriteByte(const aWriteByte: byte; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
begin
  //TODO implement Timeout
  Enable;
  SetNSSPinLow(SoftNSSPin);
  WriteSingleByte(aWriteByte);
  SetNSSPinHigh(SoftNSSPin);
  Disable;
end;

function TSPIRegistersHelper.WriteWord(const aWriteWord: word; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
begin
  //TODO implement Timeout
  Enable;
  SetNSSPinLow(SoftNSSPin);
  writeSingleByte(aWriteWord and $ff);
  writeSingleByte((aWriteWord shr 8) and $ff);
  SetNSSPinHigh(SoftNSSPin);
  Disable;
end;

function TSPIRegistersHelper.WriteByte(const aWriteBuffer: array of byte; aWriteCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  i:longword;
begin
  //TODO implement Timeout and WriteCount
  Enable;
  SetNSSPinLow(SoftNSSPin);
  for i:=low(aWriteBuffer) to high(aWriteBuffer) do WriteSingleByte(aWriteBuffer[i]);
  SetNSSPinHigh(SoftNSSPin);
  Disable;
end;

function TSPIRegistersHelper.WriteWord(const aWriteBuffer: array of word; aWriteCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
var
  i:longword;
begin
  //TODO implement Timeout and WriteCount
  Enable;
  SetNSSPinLow(SoftNSSPin);
  for i:=low(aWriteBuffer) to high(aWriteBuffer) do
  begin
    writeSingleByte(aWriteBuffer[i] and $ff);
    writeSingleByte((aWriteBuffer[i] shr 8) and $ff);
  end;
  SetNSSPinHigh(SoftNSSPin);
  Disable;
end;

function TSPIRegistersHelper.ReadByte(var aReadByte: byte; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
begin
  //TODO
end;

function TSPIRegistersHelper.ReadWord(var aReadWord: word; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
begin
  //TODO
end;

function TSPIRegistersHelper.ReadByte(var aReadBuffer: array of byte; aReadCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
begin
  //TODO
end;

function TSPIRegistersHelper.ReadWord(var aReadBuffer: array of word; aReadCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None):boolean;
begin
  //TODO
end;


function TSPIRegistersHelper.TransferByte(const aWriteByte : byte; var aReadByte : byte; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
begin
  //TODO
end;

function TSPIRegistersHelper.TransferWord(const aWriteWord: word; var aReadWord : word; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
begin
  //TODO
end;

function TSPIRegistersHelper.TransferByte(const aWriteBuffer: array of byte; var aReadBuffer : array of byte; aTransferCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
begin
  //TODO
end;

function TSPIRegistersHelper.TransferWord(const aWriteBuffer: array of word; var aReadBuffer : array of word; aTransferCount : integer=-1; const Timeout : Cardinal=0; const SoftNSSPin : TPinIdentifier = TNativePin.None) : boolean;
begin
  //TODO
end;


function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode((CTRLA shr 28) and %11);
end;

procedure TSPIRegistersHelper.SetMode(const aSPIMode: TSPIMode);
var
  WasEnabled : boolean;
begin
  WasEnabled := Disable;
  CTRLA := (CTRLA and not(%11 shl 28)) or (longWord(aSPIMode) shl 28);
  if WasEnabled then
    enable;
end;

function TSPIRegistersHelper.GetBaudrate: Cardinal;
begin
  Result := SystemCore.CPUFrequency div (2*(BAUD+1));
end;

procedure TSPIRegistersHelper.SetBaudrate(const aFrequency: Cardinal);
var
  WasEnabled : boolean;
begin
  WasEnabled := Disable;
  BAUD := (SystemCore.CPUFrequency DIV (2*aFrequency)) - 1;
  if WasEnabled then
    enable;
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord(CTRLB and %111);
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const aSPIBitsPerWord: TSPIBitsPerWord);
var
  WasEnabled : boolean;
begin
  WasEnabled := Disable;
  CTRLB := (CTRLB and not(%111)) or longWord(aSPIBitsPerWord);
  if WasEnabled then
    enable;
end;

function TSPIRegistersHelper.GetOperatingMode: TSPIOperatingMode;
begin
  Result := TSPIOperatingMode((CTRLA shr 2) and %111);
end;

procedure TSPIRegistersHelper.SetOperatingMode(const aSPIOperatingMode: TSPIOperatingMode);
//var
//  WasEnabled : boolean;
begin
  //TODO proerly handle the switch between Master and Slave Node
  //WasEnabled := Disable;
  //CTRLB := (CTRLB and not(%111 shl 2)) or longWord(TSPIOperatingMode);
  //if WasEnabled then
  //  enable;
end;

end.
