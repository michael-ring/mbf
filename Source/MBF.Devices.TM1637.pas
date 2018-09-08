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
   TTM1637Columns = 1..4;
   TTM1637 = record
     FBuffer : array[1..4] of byte;
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
     procedure Cleardigit(Column : TTM1637Columns);
     property  Digits[Column : TTM1637Columns] : byte write SetDigit;
   end;

implementation

procedure TTM1637.initialize(ClkPin,DataPin : TPinIdentifier);
begin
  FCLK := ClkPin;
  FDATA := DataPin;
  FBrightness := 255;
  GPIO.Initialize;
  GPIO.PinMode[FCLK] := TPinMode.Output;
  GPIO.PinMode[FDATA] := TPinMode.Output;
  GPIO.SetPinLevelHigh(FCLK);
  GPIO.SetPinLevelHigh(FDATA);
  SetBrightness(255);
  Clear;
end;

procedure TTM1637.Clear;
var
  i : byte;
begin
  FBuffer[1] := 0;
  FBuffer[2] := 0;
  FBuffer[3] := 0;
  FBuffer[4] := 0;
  Refresh;
end;

procedure TTM1637.WriteStartCode;
begin
  //Start Code
  GPIO.SetPinLevelHigh(FCLK);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelHigh(FDATA);
  SystemCore.MicroDelay(5);
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
  SystemCore.MicroDelay(5);
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
    SystemCore.MicroDelay(5);
  end;
  GPIO.SetPinLevelLow(FCLK);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelHigh(FDATA);
  //SystemCore.MicroDelay(5);
  GPIO.SetPinLevelHigh(FCLK);
  SystemCore.MicroDelay(5);
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
  i,j : byte;
begin
  WriteStartCode;
  WriteByte($40);   //Write Data to Display, auto increment column
  WriteStopCode;
  WriteStartCode;
  WriteByte($C0);  //Start with Column 0
  SystemCore.MicroDelay(5);
  for i := 1 to 4 do
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
  Result := FBuffer[Column];
end;

procedure TTM1637.SetDigit(Column : TTM1637Columns; Value : byte);
begin
  FBuffer[Column] := Value;
  Refresh;
end;

procedure TTM1637.ClearDigit(Column : TTM1637Columns);
begin
  FBuffer[Column] := 0;
  Refresh;
end;

end.
