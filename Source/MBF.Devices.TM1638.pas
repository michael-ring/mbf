unit MBF.Devices.TM1638;
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
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO;

const
  TM1638MaxSegments = 10;
  TM1638_CMD_DATA = $40;
  TM1638_CMD_CTRL = $80;
  TM1638_CMD_ADDR = $C0;
  TM1638_CTRL_DISPLAY_ON = $08;
  TM1638_CTRL_DISPLAY_OFF = $00;

type
   TTM1638Columns = 1..TM1638MaxSegments;
   TTM1638 = record
     FBuffer : array[1..TM1638MaxSegments] of byte;
     FMapping : array[1..TM1638MaxSegments] of TTM1638Columns;
     FCLK : TPinIdentifier;
     FDATA : TPinIdentifier;
     FCS : TPinIdentifier;
     FBrightness : byte;
   private
     procedure WriteByte(Value : Byte);
   public
     procedure Initialize(ClkPin,DataPin,CSPin : TPinIdentifier);
     procedure Clear;
     procedure Refresh;
     function GetBrightness : byte;
     procedure SetBrightness(Value : byte);
     function GetDigit(Column : TTM1638Columns):byte;
     procedure SetDigit(Column : TTM1638Columns; Value : byte);
     procedure SetCharacter(Column : TTM1638Columns; Value : char);
     //function GetDigitMapping(Column : TTM1638Columns):TTM1638Columns;
     procedure SetColumnMapping(Column : TTM1638Columns; Value : TTM1638Columns);
     procedure Cleardigit(Column : TTM1638Columns);
     property  Digits[Column : TTM1638Columns] : byte write SetDigit;
     property  Character[Column : TTM1638Columns] : char write SetCharacter;
     property ColumnMapping[Column : TTM1638Columns] : TTM1638Columns write SetColumnMapping;
   end;

implementation
//   Bit0
// B      B
// i      i
// t      t
// 5      1
//   Bit6
// B      B
// i      i
// t      t
// 4      2
//   Bit3    Bit7

type
   TCharToDigits = record
     C : char;
     D : byte;
   end;


procedure TTM1638.initialize(ClkPin,DataPin,CSPin : TPinIdentifier);
var
  i : byte;
begin
  FCLK := ClkPin;
  FDATA := DataPin;
  FCS := CSPin;
  FBrightness := 255;
  GPIO.Initialize;
  GPIO.PinMode[FCLK] := TPinMode.Output;
  GPIO.PinMode[FDATA] := TPinMode.Output;
  GPIO.PinMode[FCS] := TPinMode.Output;
  GPIO.SetPinLevelHigh(FCS);
  GPIO.SetPinLevelHigh(FCLK);
  GPIO.SetPinLevelHigh(FDATA);
  for i := 1 to TM1638MaxSegments do
    FMapping[i] := i;
  SetBrightness(255);
  Clear;
end;

procedure TTM1638.Clear;
var
  i : byte;
begin
  for i := 1 to TM1638MaxSegments do
    FBuffer[i] := 0;
  Refresh;
end;

procedure TTM1638.WriteByte(Value : Byte);
var
  i : byte;
begin
  for i := 0 to 7 do
  begin
    GPIO.SetPinLevelLow(FCLK);
    GPIO.PinLevel[FDATA] := TPinLevel((Value shr i) and $1);
    GPIO.SetPinLevelHigh(FCLK);
  end;
end;

procedure TTM1638.Refresh;
var
  i : byte;
begin
  GPIO.SetPinLevelLow(FCS);
  WriteByte(TM1638_CMD_DATA);   //Write Data to Display, auto increment column
  GPIO.SetPinLevelHigh(FCS);

  for i := 0 to 7 do
  begin
    GPIO.SetPinLevelLow(FCS);
    WriteByte(TM1638_CMD_ADDR or (i shl 1));   //Start Writing at Col 0
    WriteByte(FBuffer[i+1]);
    GPIO.SetPinLevelHigh(FCS);
  end;

  for i := 0 to 7 do
  begin
    GPIO.SetPinLevelLow(FCS);
    WriteByte(TM1638_CMD_ADDR or ((i shl 1)+1));   //Start Writing at Col 0
    WriteByte((FBuffer[9] shr i) and $1);
    GPIO.SetPinLevelHigh(FCS);
  end;

  GPIO.SetPinLevelLow(FCS);
  WriteByte(TM1638_CMD_CTRL or TM1638_CTRL_DISPLAY_ON or (FBrightness shr 5));
  GPIO.SetPinLevelHigh(FCS);
end;

function TTM1638.GetBrightness:byte;
begin
  Result := FBrightness;
end;

procedure TTM1638.SetBrightness(value : byte);
begin
  FBrightness := value;
  GPIO.SetPinLevelLow(FCS);
  WriteByte(TM1638_CMD_CTRL or TM1638_CTRL_DISPLAY_ON or (Value shr 5));
  GPIO.SetPinLevelHigh(FCS);
end;

function TTM1638.getDigit(Column : TTM1638Columns) : byte;
begin
  Result := FBuffer[FMapping[Column]];
end;

procedure TTM1638.SetDigit(Column : TTM1638Columns; Value : byte);
begin
  FBuffer[FMapping[Column]] := Value;
  Refresh;
end;

procedure TTM1638.SetCharacter(Column : TTM1638Columns; Value : char);
const
  CharToDigits : array[32..127] of byte = (
	$00, // (space)
	$86, // !
	$22, // "
	$7E, // #
	$6D, // $
	$D2, // %
	$46, // &
	$20, // '
	$29, // (
	$0B, // )
	$21, // *
	$70, // +
	$10, // ,
	$40, // -
	$80, // .
	$52, // /
	$3F, // 0
	$06, // 1
	$5B, // 2
	$4F, // 3
	$66, // 4
	$6D, // 5
	$7D, // 6
	$07, // 7
	$7F, // 8
	$6F, // 9
	$09, // :
	$0D, // ;
	$61, // <
	$48, // =
	$43, // >
	$D3, // ?
	$5F, // @
	$77, // A
	$7C, // B
	$39, // C
	$5E, // D
	$79, // E
	$71, // F
	$3D, // G
	$76, // H
	$30, // I
	$1E, // J
	$75, // K
	$38, // L
	$15, // M
	$37, // N
	$3F, // O
	$73, // P
	$6B, // Q
	$33, // R
	$6D, // S
	$78, // T
	$3E, // U
	$3E, // V
	$2A, // W
	$76, // X
	$6E, // Y
	$5B, // Z
	$39, // [
	$64, // \
	$0F, // ]
	$23, // ^
	$08, // _
	$02, // `
	$5F, // a
	$7C, // b
	$58, // c
	$5E, // d
	$7B, // e
	$71, // f
	$6F, // g
	$74, // h
	$10, // i
	$0C, // j
	$75, // k
	$30, // l
	$14, // m
	$54, // n
	$5C, // o
	$73, // p
	$67, // q
	$50, // r
	$6D, // s
	$78, // t
	$1C, // u
	$1C, // v
	$14, // w
	$76, // x
	$6E, // y
	$5B, // z
	$46, // {
	$30, // |
	$70, // }
	$01, // ~
        $00 // (del)
    );
var
  _Digits : byte;
begin
  if (Ord(Value) < 32) or (ord(Value) > 127) then
    _Digits := $00
  else
    _Digits := CharToDigits[ord(Value)];
  FBuffer[FMapping[Column]] := _Digits;
  Refresh;
end;

procedure TTM1638.SetColumnMapping(Column : TTM1638Columns; Value : TTM1638Columns);
begin
  FMapping[Column] := Value;
end;

procedure TTM1638.ClearDigit(Column : TTM1638Columns);
begin
  FBuffer[FMapping[Column]] := 0;
  Refresh;
end;

end.
