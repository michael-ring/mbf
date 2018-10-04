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

//SPI includes are complex and automagically created, so include them to keep Sourcecode clean
{$include MBF.SAMCD.SPI.inc}

type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    Eight=0,
    Nine=1
  );

type
  TSPI_Registers = record helper for TSercomSPI_Registers
  strict private type
  strict private const
    DEFAULT_SPI_FREQUENCY=100000;
  strict private
    function TXC_Ready:boolean;
    function DRE_Ready:boolean;
    function RXC_Ready:boolean;
    procedure WriteSingle(aData:word);
    function ReadSingle:word;
    function GetFrequency: Cardinal;
    procedure SetFrequency(const Value: Cardinal);
    function GetBitsPerWord: TSPIBitsPerWord;
    procedure SetBitsPerWord(const Value: TSPIBitsPerWord);
    function GetMode: TSPIMode;
    procedure SetMode(const Value: TSPIMode);
    procedure SetMOSIPin(const Value : TSPIMOSIPins);
    procedure SetMISOPin(const Value : TSPIMISOPins);
    procedure SetSCLKPin(const Value : TSPISCLKPins);
    procedure SetNSSPin( const Value : TSPINSSPins);
  public
    //procedure Initialize;
    procedure Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins); overload;
  procedure Initialize(const AMosiPin : TSPIMOSIPins;
                       const AMisoPin : TSPIMISOPins;
                       const ASCLKPin : TSPISCLKPins;
                       const ANSSPin  : TPinIdentifier); overload;
    procedure Write(const aByte: byte; const SoftNSSPin : TPinIdentifier = TNativePin.None);
    procedure WriteWord(const aWord: word; const SoftNSSPin : TPinIdentifier = TNativePin.None);
    procedure Write(const WriteBuffer: array of byte; WriteCount : integer = -1; const SoftNSSPin : TPinIdentifier = TNativePin.None);
    procedure Write(const WriteBuffer: array of word; WriteCount : integer = -1; const SoftNSSPin : TPinIdentifier = TNativePin.None);
    property MOSIPin : TSPIMOSIPins write setMOSIPin;
    property MISOPin : TSPIMISOPins write setMISOPin;
    property SCLKPin : TSPISCLKPins write setSCLKPin;
    property NSSPin  : TSPINSSPins  write setNSSPin;
    property Frequency : Cardinal read getFrequency write setFrequency;
    property Mode : TSPIMode read getMode write setMode;
    property BitsPerWord : TSPIBitsPerWord read getBitsPerWord write setBitsPerWord;
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
  {$if defined(SAMD10XMINI) }SPI : TSercomSpi_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(SAMD11XPRO)  }SPI : TSercomSpi_Registers absolute SERCOM0_BASE;{$endif}
  {$if defined(SAMD20XPRO)  }SPI : TSercomSpi_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(SAMD21XPRO)  }SPI : TSercomSpi_Registers absolute SERCOM4_BASE;{$endif}
  {$if defined(ARDUINOZERO) }SPI : TSercomSpi_Registers absolute SERCOM0_BASE;{$endif}

implementation

uses
  MBF.BitHelpers,
  MBF.SAMCD.SystemCore;

procedure TSPI_Registers.Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TPinIdentifier); overload;
begin
 //TODO
end;

procedure TSPI_Registers.Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins); overload;
var
  aDIPO,aDOPO : byte;
  Speed : longWord;
begin
  TSerCom_Registers(Self).Initialize;
  TSerCom_Registers(Self).SetCoreClockSource(GCLK_CLKCTRL_GEN_GCLK0); // use gclk0

  //Configure the provided Pins
  GPIO.PinMux[longWord(AMosiPin) and $ff] := TPinMux((longWord(AMosiPin) shr 8) and %111);
  GPIO.PinMux[longWord(AMisoPin) and $ff] := TPinMux((longWord(AMisoPin) shr 8) and %111);
  GPIO.PinMux[longWord(ASCLKPin) and $ff] := TPinMux((longWord(ASCLKPin) shr 8) and %111);
  GPIO.PinMux[longWord(ANSSPin) and $ff] := TPinMux((longWord(ANSSPin) shr 8) and %111);

  aDIPO := (longword(AMisoPin) shr 16) and %11;
  aDOPO := (longword(AMosiPin) shr 16) and %11;
  speed := DEFAULT_SPI_FREQUENCY;

  CTRLA:=
    (SERCOM_SPI_CTRLA_DIPO_Msk AND ((aDIPO) shl SERCOM_SPI_CTRLA_DIPO_Pos)) OR
    (SERCOM_SPI_CTRLA_DOPO_Msk AND ((aDOPO) shl SERCOM_SPI_CTRLA_DOPO_Pos)) OR
    SERCOM_MODE_SPI_MASTER;
  TSerCom_Registers(Self).SyncWait;

  // Set character size (8=0)
  //PutValue(CTRLB,SERCOM_SPI_CTRLB_CHSIZE_Msk,0,SERCOM_SPI_CTRLB_CHSIZE_Pos);
  //FSerCom.SyncWait;

  //SetBit(CTRLB,SERCOM_SPI_CTRLB_MSSEN_Pos);
  //FSerCom.SyncWait;

  //SetBit(FSerCom.PSerComRegisters^.SPI.CTRLB,SERCOM_SPI_CTRLB_RXEN_Pos); //RX_EN
  //FSerCom.SyncWait;

  BAUD := (SystemCore.CPUFrequency DIV (2*Speed)) - 1;
  TSerCom_Registers(Self).SyncWait;

  TSerCom_Registers(Self).Enable;
end;

function TSPI_Registers.TXC_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_SPI_INTFLAG_TXC_Pos);
end;

function TSPI_Registers.DRE_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_SPI_INTFLAG_DRE_Pos);
end;

function TSPI_Registers.RXC_Ready:boolean;
begin
  result:=GetBit(INTFLAG,SERCOM_SPI_INTFLAG_RXC_Pos);
end;

procedure TSPI_Registers.WriteSingle(aData:word);
begin
  while (NOT DRE_Ready) do begin end;
  DATA := aData;
  while (NOT TXC_Ready) do begin end;
end;

function TSPI_Registers.ReadSingle:word;
begin
  while (NOT RXC_Ready) do begin end;
  result:=DATA;
end;

procedure TSPI_Registers.Write(const aByte: byte; const SoftNSSPin : TPinIdentifier = TNativePin.None);
begin
  WriteSingle(aByte);
end;

procedure TSPI_Registers.WriteWord(const aWord: word; const SoftNSSPin : TPinIdentifier = TNativePin.None);
begin
  //TODO
end;

procedure TSPI_Registers.Write(const WriteBuffer: array of byte; WriteCount : integer = -1; const SoftNSSPin : TPinIdentifier = TNativePin.None);
var
  i:longword;
begin
  for i:=low(WriteBuffer) to high(WriteBuffer) do WriteSingle(WriteBuffer[i]);
end;

procedure TSPI_Registers.Write(const WriteBuffer: array of word; WriteCount : integer = -1; const SoftNSSPin : TPinIdentifier = TNativePin.None);
var
  i:longword;
begin
  for i:=low(WriteBuffer) to high(WriteBuffer) do WriteWord(WriteBuffer[i]);
end;

function TSPI_Registers.GetMode: TSPIMode;
begin
  //TODO
end;

procedure TSPI_Registers.SetMode(const Value: TSPIMode);
begin
  //TODO
end;

function TSPI_Registers.GetFrequency: Cardinal;
begin
  //TODO
end;

procedure TSPI_Registers.SetFrequency(const Value: Cardinal);
begin
//TODO
end;

function TSPI_Registers.GetBitsPerWord: TSPIBitsPerWord;
begin
  //TODO
end;

procedure TSPI_Registers.SetBitsPerWord(const Value: TSPIBitsPerWord);
begin
//TODO
end;

procedure TSPI_Registers.SetMOSIPin(const value : TSPIMOSIPins);
begin
  //TODO
end;

procedure TSPI_Registers.setMISOPin(const value : TSPIMISOPins);
begin
  //TODO
end;

procedure TSPI_Registers.setSCLKPin(const value : TSPISCLKPins);
begin
  //TODO
end;

procedure TSPI_Registers.setNSSPin(const value : TSPINSSPins);
begin
  //TODO
end;


end.
