unit MBF.Devices.TM1637;
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

type
   TTM1637Columns = 1..6;
   TTM1637 = record
     FBuffer : array[1..6] of byte;
     FMapping : array[1..6] of TTM1637Columns;
     FCLK : TPinIdentifier;
     FDATA : TPinIdentifier;
     FBrightness : byte;
   private
     procedure WriteStartCode;
     procedure WriteStopCode;
     function WriteByte(Value : Byte):byte;
   public
     procedure Initialize(ClkPin,DataPin : TPinIdentifier);
     procedure Clear;
     procedure Refresh;
     function GetBrightness : byte;
     procedure SetBrightness(Value : byte);
     function GetDigit(Column : TTM1637Columns):byte;
     procedure SetDigit(Column : TTM1637Columns; Value : byte);
     procedure SetCharacter(Column : TTM1637Columns; Value : char);
     //function GetDigitMapping(Column : TTM1637Columns):TTM1637Columns;
     procedure SetColumnMapping(Column : TTM1637Columns; Value : TTM1637Columns);
     procedure Cleardigit(Column : TTM1637Columns);
     property  Digits[Column : TTM1637Columns] : byte write SetDigit;
     property  Character[Column : TTM1637Columns] : char write SetCharacter;
     property ColumnMapping[Column : TTM1637Columns] : TTM1637Columns write SetColumnMapping;
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


procedure TTM1637.initialize(ClkPin,DataPin : TPinIdentifier);
var
  i : byte;
begin
  FCLK := ClkPin;
  FDATA := DataPin;
  FBrightness := 255;
  GPIO.Initialize;
  GPIO.PinMode[FCLK] := TPinMode.Output;
  GPIO.PinMode[FDATA] := TPinMode.Output;
  GPIO.SetPinLevelHigh(FCLK);
  GPIO.SetPinLevelHigh(FDATA);
  for i := 1 to 6 do
    FMapping[i] := i;
  SetBrightness(255);

  Clear;
end;

procedure TTM1637.Clear;
var
  i : byte;
begin
  for i := 1 to 6 do
    FBuffer[i] := 0;
  Refresh;
end;

procedure TTM1637.WriteStartCode;
begin
  //Start Code
  GPIO.SetPinLevelHigh(FCLK);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelHigh(FDATA);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelLow(FDATA);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelLow(FCLK);
  //SystemCore.MicroDelay(5);
end;

procedure TTM1637.WriteStopCode;
begin
  //Stop Code
  GPIO.SetPinLevelLow(FCLK);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelLow(FDATA);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelHigh(FCLK);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelHigh(FDATA);
  //SystemCore.MicroDelay(5);
end;

function TTM1637.WriteByte(Value : Byte):Byte;
var
  i : byte;
begin
  for i := 0 to 7 do
  begin
    GPIO.SetPinLevelLow(FCLK);
    //SystemCore.MicroDelay(5);
    GPIO.PinLevel[FDATA] := TPinLevel((Value shr i) and $1);
    //SystemCore.MicroDelay(5);
    GPIO.SetPinLevelHigh(FCLK);
    //SystemCore.MicroDelay(5);
  end;
  GPIO.SetPinLevelLow(FCLK);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelHigh(FDATA);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelHigh(FCLK);
  //SystemCore.MicroDelay(5);
  GPIO.PinMode[FDATA] := TPinMode.Input;
  //SystemCore.MicroDelay(5);
  Result := GPIO.PinValue[FDATA];
  if Result = 0 then
  begin
    GPIO.PinMode[FDATA] := TPinMode.Output;
    GPIO.SetPinLevelLow(FDATA);
  end;
  //SystemCore.MicroDelay(5);
  GPIO.PinMode[FDATA] := TPinMode.Output;
end;

procedure TTM1637.Refresh;
var
  i : byte;
begin
  WriteStartCode;
  WriteByte($40);   //Write Data to Display, auto increment column
  WriteStopCode;
  WriteStartCode;
  WriteByte($C0);  //Start with Column 0
  SystemCore.MicroDelay(5);
  for i := 1 to 6 do
    WriteByte(FBuffer[i]);
  WriteStopCode;
end;

function TTM1637.GetBrightness:byte;
begin
  Result := FBrightness;
end;

procedure TTM1637.SetBrightness(value : byte);
begin
  FBrightness := value;
  WriteStartCode;
  WriteByte($88 or (Value shr 5));
  WriteStopCode;
end;

function TTM1637.getDigit(Column : TTM1637Columns) : byte;
begin
  Result := FBuffer[FMapping[Column]];
end;

procedure TTM1637.SetDigit(Column : TTM1637Columns; Value : byte);
begin
  FBuffer[FMapping[Column]] := Value;
  Refresh;
end;

procedure TTM1637.SetCharacter(Column : TTM1637Columns; Value : char);
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

procedure TTM1637.SetColumnMapping(Column : TTM1637Columns; Value : TTM1637Columns);
begin
  FMapping[Column] := Value;
end;

procedure TTM1637.ClearDigit(Column : TTM1637Columns);
begin
  FBuffer[FMapping[Column]] := 0;
  Refresh;
end;

end.
