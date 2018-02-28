unit MBF.Devices.MAX7219;
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
  MBF.__CONTROLLERTYPE__.SPI;
type
   TMaxValue = 1..8;
   TMax7219 = record
     FBuffer : array[1..8] of byte;
     FSPI : TSPI_Registers;
     procedure Initialize(var SPI : TSPI_Registers);
     procedure Clear;
     procedure Refresh;
     procedure SetBrightness(Value : byte);
     procedure SetBit(Row,Column : TMaxValue);
     procedure ClearBit(Row,Column : TMaxValue);
     function  getBit(Row,Column : TMaxValue) : byte;
     procedure setRow(Row:TMaxValue; Value : byte);
     function  getRow(Row: TMaxValue) : byte;
     property  Rows[Row : TMaxValue] : byte read getRow write SetRow;
   end;

implementation

procedure TMax7219.initialize(var SPI : TSPI_Registers);
begin
  FSPI := SPI;
  FSPI.TransferWord($0900); //Do not decode bits
  FSPI.TransferWord($0a05); //Brightness of LED's
  FSPI.TransferWord($0b07); //Show all scan lines
  FSPI.TransferWord($0c01); //Display on
  FSPI.TransferWord($0f00); //TestMode off
  Clear;
end;

procedure TMax7219.Clear;
var
  i : byte;
begin
  for i := 1 to 8 do
  begin
    FBuffer[i] := 0;
    FSPI.TransferWord((i shl 8) or 0);
  end;
end;

procedure TMax7219.Refresh;
var
  i : byte;
begin
  for i := 1 to 8 do
    FSPI.TransferWord((i shl 8) or FBuffer[i]);
end;

procedure TMax7219.SetBrightness(value : byte);
begin
  FSPI.TransferWord($0a00 or (value shr 4)); //Brightness of LED's
end;

procedure TMax7219.SetBit(Row,Column : TMaxValue);
begin
  FBuffer[Row] := FBuffer[Row] or (1 shl (Column-1));
end;

procedure TMax7219.ClearBit(Row,Column : TMaxValue);
begin
  FBuffer[Row] := FBuffer[Row] and (not (1 shl (Column-1)));
end;

function TMax7219.getBit(Row,Column : TMaxValue) : byte;
begin
  Result := FBuffer[Row] and (1 shl (Column-1)) shr (Column-1);
end;

procedure TMax7219.setRow(Row:TMaxValue; Value : byte);
begin
  FBuffer[Row] := Value;
  FSPI.TransferWord((Row shl 8) or Value);
end;

function  TMax7219.getRow(Row: TMaxValue) : byte;
begin
  Result := FBuffer[Row];
end;

end.
