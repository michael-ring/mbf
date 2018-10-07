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
  MBF.Types,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI;

type
  TDisplayBitDepth = (OneBit=1,TwoBits=2,FourBits=4,EightBits=8,SixteenBits=16);

  TFontData = array[0..2047] of byte;
  TFontInfo = record
    Width,Height : Word;
    BitsPerPixel : byte;
    BytesPerChar : Word;
    Charmap : String;
    pFontData : ^TFontData;
  end;

  TScreenInfo = record
    { The coordinate in 2D space. }
    Width, Height: Word;
    Depth : TDisplayBitDepth;
    class operator =(a,b : TScreenInfo) : boolean;
  end;

type TCustomDisplay = object
  private
    FScreenInfo : TScreenInfo;
    FpSPI : ^TSPI_Registers;
    FpGPIOPort : ^TGPIO_Registers;
    FPinDC : TPinIdentifier;
    FPinWR : TPinIdentifier;
    FPinRD : TPinIdentifier;
    FPinCS : TPinIdentifier;
    FPinRST : TPinIdentifier;
    FForegroundColor : TColor;
    FBackgroundColor : TColor;
    procedure setPinDC(const Value : TPinIdentifier);
    procedure setPinRST(const Value : TPinIdentifier);
    procedure setScreenInfo(const Value : TScreenInfo);
  public
    procedure Reset;
    procedure InitSequence;
    procedure clearScreen;
    property ForegroundColor: TColor read FForegroundColor write FForegroundColor;
    property BackgroundColor : TColor read FBackgroundColor write FBackgroundColor;
    property PinDC : TPinIdentifier read FPinDC write setPinDC;
    property PinRST : TPinIdentifier read FPinRST write setPinRST;
    property ScreenInfo : TScreenInfo read FScreenInfo write setScreenInfo;
end;

  TCustomSPIDisplay = object(TCustomDisplay)
    procedure WriteCommand(const value : byte);
    procedure WriteCommand(const Values: array of Byte);
    procedure WriteData(const value : byte);
    procedure WriteData(const Values: array of Byte);
    //procedure Initialize(var SPI : TSpi_Registers);
    procedure Initialize(var SPI : TSpi_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier;AScreenInfo : TScreenInfo);
  end;
  (*
  TCustomGPIODisplay = object(TCustomDisplay)
  var
    procedure Initialize(var GPIOPort : TGPIO_Registers;const APinDC,APinWR,APinRD,aPinCS,APinRST : TPinIdentifier;AScreenInfo : TScreenInfo);
    procedure WriteCommand(const value : byte);
    procedure WriteCommand(const Values: array of Byte);
    procedure WriteData(const value : byte);
    procedure WriteDataWord(const value : word);
    procedure WriteData(const Values: array of Byte);
    procedure WriteDataWord(const Values : array of word);
  end;
  *)
implementation

class operator TScreenInfo.= (a,b : TScreenInfo) : boolean;
begin
  Result := (a.Width = b.Width) and (a.Height = b.Height) and (a.Depth = b.Depth);
end;

//procedure TCustomSPIDisplay.Initialize(var SPI : TSpi_Registers);
//begin
//  FpSPI := @SPI;
//  FPinDC := TNativePin.NONE;
//  FPinRST := TNativePin.NONE;
//  FScreenSize.X := 0;
//  FScreenSize.Y := 0;
//end;

procedure TCustomSPIDisplay.Initialize(var SPI : TSpi_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier;AScreenInfo : TScreenInfo);
begin
  FpSPI := @SPI;
  FPinDC := APinDC;
  FPinRST := APinRST;
  FPinWR := TNativePin.None;
  FPinRD := TNativePin.None;
  FPinCS := TNativePin.None;
  FScreenInfo :=  AScreenInfo;
  FBackgroundColor := clBlack;
  FForegroundColor := clWhite;

  GPIO.PinMode[APinDC] := TPinMode.Output;
  GPIO.PinMode[APinRST] := TPinMode.Output;
  GPIO.PinValue[APinDC] := 1;
  GPIO.PinValue[APinRST] := 1;
end;
(*
procedure TCustomGPIODisplay.Initialize(var GPIOPort : TGPIO_Registers;const APinDC,APinWR,APinRD,aPinCS,APinRST : TPinIdentifier;AScreenInfo : TScreenInfo);
begin
  FpGPIOPort := @GPIOPort;
  FPinDC := APinDC;
  FPinWR := APinWR;
  FPinRD := APinRD;
  FPinCS := APinCS;
  FPinRST := APinRST;
  FScreenInfo :=  AScreenInfo;
  FBackgroundColor := clBlack;
  FForegroundColor := clWhite;

  FpGPIOPort^.Initialize;
  FpGPIOPort^.SetPortMode(TPinMode.Output);
  FpGPIOPort^.SetPortOutputSpeed(TPinOutputSpeed.Slow);
  FpGPIOPort^.SetPortOutputMode(TPinOutputmode.PushPull);
  FpGPIOPort^.SetPortDrive(TPinDrive.None);

  //Arduino Pins D10-D13 are connected to the additional Signal needed
  GPIO.PinMode[FPinDC] := TPinMode.Output; //RS D/~C
  GPIO.PinMode[FPinWR] := TPinMode.Output; //WR
  GPIO.PinMode[FPinRD] := TPinMode.Output; //RD
  GPIO.PinMode[FPinCS] := TPinMode.Output; //~CS
  GPIO.PinMode[FPinRST] := TPinMode.Output; //~Reset
end;
*)
procedure TCustomDisplay.Reset;
begin
  if FPinDC <> TNativePin.None then
    GPIO.SetPinLevelHigh(FPinDC);
  if FPinWR <> TNativePin.None then
    GPIO.SetPinLevelHigh(FPinWR);
  if FPinRD <> TNativePin.None then
    GPIO.SetPinLevelHigh(FPinRD);
  if FPinCS <> TNativePin.None then
    GPIO.SetPinLevelHigh(FPinCS);
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

procedure TCustomSPIDisplay.WriteCommand(const Value: Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.WriteByte(Value, 1);
end;

procedure TCustomSPIDisplay.WriteCommand(const Values: array of Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  if Length(Values) > 0 then
    FpSPI^.WriteByte(Values);
end;

procedure TCustomSPIDisplay.WriteData(const Value: Byte);
begin
  GPIO.PinValue[FPinDC] := 1;
  FpSPI^.WriteByte(Value);
end;

procedure TCustomSPIDisplay.WriteData(const Values: array of Byte);
begin
  GPIO.PinValue[FPinDC] := 1;
  if Length(Values) > 0 then
    FpSPI^.WriteByte(Values);
end;
(*
procedure TCustomGPIODisplay.WriteCommand(const Value: Byte);
begin
  GPIO.SetPinLevelHigh(FPinRD);
  GPIO.SetPinLevelLow (FPinWR);
  GPIO.SetPinLevelLow (FPinDC);
  FpGPIOPort^.SetPortValues(Value);
  GPIO.SetPinLevelLow(FPinCS);
  GPIO.SetPinLevelHigh(FPinCS);
  GPIO.SetPinLevelHigh(FPinDC);
  GPIO.SetPinLevelHigh(FPinWR);
end;

procedure TCustomGPIODisplay.WriteCommand(const Values: array of Byte);
var
  i : integer;
begin
  if Length(Values) > 0 then
  begin
    GPIO.SetPinLevelHigh(FPinRD);
    GPIO.SetPinLevelLow (FPinWR);
    GPIO.SetPinLevelLow (FPinDC);
    begin
      for i := 0 to Length(Values)-1 do
      begin
        FpGPIOPort^.SetPortValues(Values[i]);
        GPIO.SetPinLevelLow(FPinCS);
        GPIO.SetPinLevelHigh(FPinCS);
      end;
    end;
    GPIO.SetPinLevelHigh(FPinDC);
    GPIO.SetPinLevelHigh(FPinWR);
  end;
end;

procedure TCustomGPIODisplay.WriteData(const Value: Byte);
begin
  GPIO.SetPinLevelHigh(FPinRD);
  FpGPIOPort^.SetPortValues(Value);
  GPIO.SetPinLevelLow(FPinWR);
  GPIO.SetPinLevelHigh(FPinDC);
  GPIO.SetPinLevelLow(FPinCS);
  GPIO.SetPinLevelHigh(FPinCS);
  GPIO.SetPinLevelHigh(FPinWR);
end;

procedure TCustomGPIODisplay.WriteDataWord(const Value: Word);
begin
  GPIO.SetPinLevelHigh(FPinRD);
  FpGPIOPort^.SetPortValues(Value);
  GPIO.SetPinLevelLow(FPinWR);
  GPIO.SetPinLevelHigh(FPinDC);
  GPIO.SetPinLevelLow(FPinCS);
  GPIO.SetPinLevelHigh(FPinCS);
  GPIO.SetPinLevelHigh(FPinWR);
end;

procedure TCustomGPIODisplay.WriteData(const Values: array of Byte);
var
  i : integer;
begin
  if Length(Values) > 0 then
  begin
    GPIO.SetPinLevelHigh(FPinRD);
    GPIO.SetPinLevelLow (FPinWR);
    GPIO.SetPinLevelHigh(FPinDC);
    begin
      for i := 0 to Length(Values)-1 do
      begin
        FpGPIOPort^.SetPortValues(Values[i]);
        GPIO.SetPinLevelLow(FPinCS);
        GPIO.SetPinLevelHigh(FPinCS);
      end;
    end;
    GPIO.SetPinLevelHigh(FPinWR);
  end;
end;

procedure TCustomGPIODisplay.WriteDataWord(const Values: array of Word);
var
  i : integer;
begin
  if Length(Values) > 0 then
  begin
    GPIO.SetPinLevelHigh(FPinRD);
    GPIO.SetPinLevelLow (FPinWR);
    GPIO.SetPinLevelHigh(FPinDC);
    begin
      for i := 0 to Length(Values)-1 do
      begin
        FpGPIOPort^.SetPortValues(Values[i]);
        GPIO.SetPinLevelLow(FPinCS);
        GPIO.SetPinLevelHigh(FPinCS);
      end;
    end;
    GPIO.SetPinLevelHigh(FPinWR);
  end;
end;
*)
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

procedure TCustomDisplay.setScreenInfo(const Value : TScreenInfo);
begin
  FScreenInfo := Value;
end;

end.
