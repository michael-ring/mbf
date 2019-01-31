unit MBF.SAMCD.Helpers;
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

interface

{$INCLUDE MBF.Config.inc}

{$i atsamcd/samcd-adc.inc}
{$i atsamcd/samcd-gclk.inc}
{$i atsamcd/samcd-mclk.inc}
{$i atsamcd/samcd-nvmctrl.inc}
{$i atsamcd/samcd-pm.inc}
{$i atsamcd/samcd-port.inc}
{$i atsamcd/samcd-sercom.inc}
{$i atsamcd/samcd-sysctrl.inc}
{$i atsamcd/samcd-tc.inc}

function ReadCal(Position,Size:byte):longword;
function DivCeiling(a,b:longint):longint;
function GetCrc8(const pData: Pointer; nLength: Integer): byte;
function CheckCRC8(const pData: Pointer; nLength: Integer; CrcValue: byte): Boolean;

implementation

const
  CRCTable8: array[0..255] of byte = (
      $00, $31, $62, $53, $C4, $F5, $A6, $97,
      $B9, $88, $DB, $EA, $7D, $4C, $1F, $2E,
      $43, $72, $21, $10, $87, $B6, $E5, $D4,
      $FA, $CB, $98, $A9, $3E, $0F, $5C, $6D,
      $86, $B7, $E4, $D5, $42, $73, $20, $11,
      $3F, $0E, $5D, $6C, $FB, $CA, $99, $A8,
      $C5, $F4, $A7, $96, $01, $30, $63, $52,
      $7C, $4D, $1E, $2F, $B8, $89, $DA, $EB,
      $3D, $0C, $5F, $6E, $F9, $C8, $9B, $AA,
      $84, $B5, $E6, $D7, $40, $71, $22, $13,
      $7E, $4F, $1C, $2D, $BA, $8B, $D8, $E9,
      $C7, $F6, $A5, $94, $03, $32, $61, $50,
      $BB, $8A, $D9, $E8, $7F, $4E, $1D, $2C,
      $02, $33, $60, $51, $C6, $F7, $A4, $95,
      $F8, $C9, $9A, $AB, $3C, $0D, $5E, $6F,
      $41, $70, $23, $12, $85, $B4, $E7, $D6,
      $7A, $4B, $18, $29, $BE, $8F, $DC, $ED,
      $C3, $F2, $A1, $90, $07, $36, $65, $54,
      $39, $08, $5B, $6A, $FD, $CC, $9F, $AE,
      $80, $B1, $E2, $D3, $44, $75, $26, $17,
      $FC, $CD, $9E, $AF, $38, $09, $5A, $6B,
      $45, $74, $27, $16, $81, $B0, $E3, $D2,
      $BF, $8E, $DD, $EC, $7B, $4A, $19, $28,
      $06, $37, $64, $55, $C2, $F3, $A0, $91,
      $47, $76, $25, $14, $83, $B2, $E1, $D0,
      $FE, $CF, $9C, $AD, $3A, $0B, $58, $69,
      $04, $35, $66, $57, $C0, $F1, $A2, $93,
      $BD, $8C, $DF, $EE, $79, $48, $1B, $2A,
      $C1, $F0, $A3, $92, $05, $34, $67, $56,
      $78, $49, $1A, $2B, $BC, $8D, $DE, $EF,
      $82, $B3, $E0, $D1, $46, $77, $24, $15,
      $3B, $0A, $59, $68, $FF, $CE, $9D, $AC);

function ReadCal(Position,Size:byte):longword;
begin
  //result:=(({%H-}plongword(NVMCTRL_OTP4+(Position DIV 32))^ shr (Position MOD 32)) AND (1 shl Size));
  result:=(({%H-}plongword(NVMCTRL_OTP4+((Position shr 5) shl 3))^ shr (Position MOD 32)) AND ((1 shl Size)-1));
end;

function DivCeiling(a,b:longint):longint;
begin
  result:=(((a) + (b) - 1) DIV (b));
end;

function GetCrc8(const pData: Pointer; nLength: Integer): byte;
var
  fcs: byte;
  p: PByte;
begin
  p:=PByte(PData);
  fcs:=$FF;
  while (nLength > 0) do
  begin
    fcs:=CRCTable8[fcs xor p^];
    Dec(nLength);
    Inc(p);
  end;
  result:=fcs;
end;

function CheckCRC8(const pData: Pointer; nLength: Integer; CrcValue: byte): Boolean;
var
  fcs: byte;
begin
  fcs:=GetCrc8(pData,nLength);
  Result:=(fcs=CrcValue);
end;


end.

