unit MBF.SAMCD.SPI;
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
{< Atmel SAMD series GPIO functions. }

interface

{$include MBF.Config.inc}

uses
  MBF.SAMCD.Helpers,
  MBF.SAMCD.SerCom;

type
  TSPI_Registers = record
  strict private type
  strict private const
    DEFAULT_SPI_FREQUENCY=100000;
  strict private
    FSerCom:TSerCom;
    procedure SetPort(aPort:TPortIdentifier);
    function TXC_Ready:boolean;
    function DRE_Ready:boolean;
    function RXC_Ready:boolean;
    procedure WriteSingle(aData:word);
    function ReadSingle:word;
  public
    procedure Initialize(const aPort:TPortIdentifier;const Speed:cardinal;aDIPO,aDOPO:byte);
    procedure Write(const buffer: pointer; const length: longword);

  end;

implementation

uses
  MBF.BitHelpers,
  MBF.SAMCD.SystemCore;

procedure TSPI_Registers.SetPort(aPort:TPortIdentifier);
begin
  FSerCom.Initialize(aPort);
  FSerCom.SetCoreClockSource(GCLK_CLKCTRL_GEN_GCLK0); // use gclk0
end;

procedure TSPI_Registers.Initialize(const aPort:TPortIdentifier;const Speed:cardinal;aDIPO,aDOPO:byte);
begin
  SetPort(aPort);

  FSerCom.PSerComRegisters^.SPI.CTRLA:=
    (SERCOM_SPI_CTRLA_DIPO_Msk AND ((aDIPO) shl SERCOM_SPI_CTRLA_DIPO_Pos)) OR
    (SERCOM_SPI_CTRLA_DOPO_Msk AND ((aDOPO) shl SERCOM_SPI_CTRLA_DOPO_Pos)) OR
    SERCOM_MODE_SPI_MASTER;
  FSerCom.SyncWait;

  // Set character size (8=0)
  //PutValue(FSerCom.PSerComRegisters^.SPI.CTRLB,SERCOM_SPI_CTRLB_CHSIZE_Msk,0,SERCOM_SPI_CTRLB_CHSIZE_Pos);
  //FSerCom.SyncWait;

  //SetBit(FSerCom.PSerComRegisters^.SPI.CTRLB,SERCOM_SPI_CTRLB_MSSEN_Pos);
  //FSerCom.SyncWait;

  //SetBit(FSerCom.PSerComRegisters^.SPI.CTRLB,SERCOM_SPI_CTRLB_RXEN_Pos); //RX_EN
  //FSerCom.SyncWait;

  FSerCom.PSerComRegisters^.SPI.BAUD := (SystemCore.CPUFrequency DIV (2*Speed)) - 1;
  FSerCom.SyncWait;

  FSerCom.Enable;
end;

function TSPI_Registers.TXC_Ready:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.SPI.INTFLAG,SERCOM_SPI_INTFLAG_TXC_Pos);
end;

function TSPI_Registers.DRE_Ready:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.SPI.INTFLAG,SERCOM_SPI_INTFLAG_DRE_Pos);
end;

function TSPI_Registers.RXC_Ready:boolean;
begin
  result:=GetBit(FSerCom.PSerComRegisters^.SPI.INTFLAG,SERCOM_SPI_INTFLAG_RXC_Pos);
end;

procedure TSPI_Registers.WriteSingle(aData:word);
begin
  while (NOT DRE_Ready) do begin end;
  FSerCom.PSerComRegisters^.SPI.DATA := aData;
  while (NOT TXC_Ready) do begin end;
end;

function TSPI_Registers.ReadSingle:word;
begin
  while (NOT RXC_Ready) do begin end;
  result:=FSerCom.PSerComRegisters^.SPI.DATA;
end;

procedure TSPI_Registers.Write(const buffer: pointer; const length: longword);
var
  i:longword;
begin
  for i:=0 to (length-1) do WriteSingle(PByte(buffer+i)^);
end;


end.
