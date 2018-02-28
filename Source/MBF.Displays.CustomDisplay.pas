unit MBF.Displays.CustomDisplay;
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

{$INCLUDE MBF.Config.inc}

interface

uses
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI;

type
  TPoint2px = record
    { The coordinate in 2D space. }
    X, Y: Word;
  end;
  TDisplayBitDepth = (OneBit=1,TwoBits=2,FourBits=4,EightBits=8);

  //operator = (a,b:TPoint2px) : boolean;
  //begin
  //  Result := (a.X = b.X) and (a.Y = b.Y);
  //end;

type TCustomDisplay = record
  private
    FScreenSize : TPoint2px;
    FBitDepth : TDisplayBitDepth;
    FpSPI : ^TSPI_Registers;
    FPinDC : TPinIdentifier;
    FPinRST : TPinIdentifier;
    procedure setPinDC(const Value : TPinIdentifier);
    procedure setPinRST(const Value : TPinIdentifier);
    procedure setScreenSize(const Value : TPoint2px);
  public
    procedure WriteCommand(const value : byte);
    procedure WriteCommand(const Values: array of Byte);
    procedure WriteData(const value : byte);
    procedure WriteData(const Values: array of Byte);
    procedure Initialize(var SPI : TSpi_Registers);
    procedure Initialize(var SPI : TSpi_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier;AScreenSize : TPoint2px; ABitDepth : TDisplayBitDepth);
    procedure Reset;
    procedure InitSequence;
    procedure clearScreen;
    procedure setBitDepth(const Value : TDisplayBitDepth);
    property PinDC : TPinIdentifier read FPinDC write setPinDC;
    property PinRST : TPinIdentifier read FPinRST write setPinRST;
    property ScreenSize : TPoint2px read FScreenSize write setScreenSize;
    property BitDepth : TDisplayBitDepth read FBitDepth write setBitDepth;
end;

implementation

procedure TCustomDisplay.Initialize(var SPI : TSpi_Registers);
begin
  FpSPI := @SPI;
  FPinDC := TNativePin.NONE;
  FPinRST := TNativePin.NONE;
  FScreenSize.X := 0;
  FScreenSize.Y := 0;
end;

procedure TCustomDisplay.Initialize(var SPI : TSpi_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier;AScreenSize : TPoint2px;ABitDepth : TDisplayBitDepth);
begin
  FpSPI := @SPI;
  FPinDC := APinDC;
  FPinRST := APinRST;
  FScreenSize :=  AScreenSize;
  FBitDepth := ABitDepth
end;

procedure TCustomDisplay.Reset;
begin
  if FPinRST <> TNativePin.None then
  begin
    GPIO.PinValue[FPinRST] := 1;
    SystemCore.Delay(10);
    GPIO.PinValue[FPinRST] := 0;
    SystemCore.Delay(10);
    GPIO.PinValue[FPinRST] := 1;
  end;
end;

procedure TCustomDisplay.InitSequence;
begin
end;

procedure TCustomDisplay.WriteCommand(const Value: Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.Write(@Value, 1);
end;

procedure TCustomDisplay.WriteCommand(const Values: array of Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  if Length(Values) > 0 then
    FpSPI^.Write(@Values[0], Length(Values));
end;

procedure TCustomDisplay.WriteData(const Value: Byte);
begin
  GPIO.PinValue[FPinDC] := 1;
  FpSPI^.Write(@Value, 1);
end;

procedure TCustomDisplay.WriteData(const Values: array of Byte);
begin
  GPIO.PinValue[FPinDC] := 1;
  if Length(Values) > 0 then
    FpSPI^.Write(@Values[0], Length(Values));
end;

procedure TCustomDisplay.setPinDC(const Value : TPinIdentifier);
begin
  FPinDC := Value;
end;

procedure TCustomDisplay.setPinRST(const Value : TPinIdentifier);
begin
  FPinRST := Value;
end;

procedure TCustomDisplay.clearScreen;
begin
end;

procedure TCustomDisplay.setScreenSize(const Value : TPoint2px);
begin
  FScreenSize := Value;
end;

procedure TCustomDisplay.setBitDepth(const Value : TDisplayBitDepth);
begin
  FBitDepth := Value;
end;
end.
