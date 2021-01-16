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
{$WARN 6058 off : Call to subroutine "$1" marked as inline is not inlined}
{$INCLUDE MBF.Config.inc}

interface

uses
  MBF.Types,
  MBF.__CONTROLLERTYPE__.SystemCore,
  {$IF DEFINED(HAS_IMPLEMENTATION_SPI)}
  MBF.__CONTROLLERTYPE__.SPI,
  {$ENDIF}
  {$IF DEFINED(HAS_IMPLEMENTATION_I2C)}
  MBF.__CONTROLLERTYPE__.I2C,
  {$ENDIF}
  MBF.__CONTROLLERTYPE__.GPIO;

type
  TDisplayBitDepth = (OneBit=1,TwoBits=2,SixteenBits=16);

  TFontData = array [0..MaxInt-1] of byte;
  TRowBuffer = array [0..MaxInt-1] of byte;
  TFontInfo = record
    Width,Height : Word;
    BitsPerPixel : byte;
    BytesPerChar : Word;
    pCharmap : ^String;
    pFontData : ^TFontData;
    pRowBuffer : ^TRowBuffer;
  end;

  TScreenInfo = record
    { The coordinate in 2D space. }
    Width, Height: Word;
    Depth : TDisplayBitDepth;
    class operator =(a,b : TScreenInfo) : boolean;
  end;

type TCustomDisplay = object
  protected
    FScreenInfo : TScreenInfo;
    FPinCS : TPinIdentifier;
    FPinDC : TPinIdentifier;
    FForegroundColor : TColor;
    FBackgroundColor : TColor;
    FNativeForegroundColor : longWord;
    FNativeBackgroundColor : longWord;
    FPinRST : TPinIdentifier;
    procedure setPinDC(const Value : TPinIdentifier);
    procedure setPinRST(const Value : TPinIdentifier);
    procedure setScreenInfo(const Value : TScreenInfo);
    procedure CalculateAntialiasColors(out AntiAliasColors : array of word);
    procedure setForegroundColor(const Color : TColor);
    procedure setBackgroundColor(const Color : TColor);
  public
    property ForegroundColor: TColor read FForegroundColor write setForegroundColor;
    property BackgroundColor : TColor read FBackgroundColor write setBackgroundColor;
    property PinRST : TPinIdentifier read FPinRST write setPinRST;
    property PinDC : TPinIdentifier read FPinDC write setPinDC;
    property ScreenInfo : TScreenInfo read FScreenInfo write setScreenInfo;
end;

{$IF DEFINED(HAS_IMPLEMENTATION_SPI)}
type
  TCustomSPIDisplay = object(TCustomDisplay)
  private
      FpSPI : ^TSPI_Registers;
  public
    procedure BeginTransaction;
    procedure EndTransaction;
    procedure WriteCommand(const value : byte);
    procedure WriteCommand(const value: Byte; const param1 : Byte);
    procedure WriteCommand(const value: Byte; const param1,param2 : Byte);
    procedure WriteCommand(const value: Byte; const param1,param2,param3 : Byte);
    procedure WriteCommand2(const value : byte);
    procedure WriteCommand2(const value: Byte; const param1 : Byte);
    procedure WriteCommand2(const value: Byte; const param1,param2 : Byte);
    procedure WriteCommand2(const value: Byte; const param1,param2,param3 : Byte);
    procedure WriteData(const value : byte);
    procedure WriteData(const Values: array of Byte;aCount:integer);
    procedure WriteData(const Values: array of Word;aCount:integer);
    procedure WriteBuffer(const aBuffer: pointer; aCount : integer);
    //procedure Initialize(var SPI : TSpi_Registers);
    procedure Initialize(var SPI : TSpi_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier;AScreenInfo : TScreenInfo);
    procedure Reset;
  end;
{$ENDIF}
{$IF DEFINED(HAS_IMPLEMENTATION_I2C)}
type
  TCustomI2CDisplay = object(TCustomDisplay)
  private
      FpI2C : ^TI2C_Registers;
  public
    procedure WriteCommand(const value : byte);
    procedure WriteCommand(const Values: array of Byte);
    procedure WriteData(const value : byte);
    procedure WriteData(const Values: array of Byte);
    procedure WriteBuffer(const aWriteBuffer: pointer; aWriteCount : integer);
    //procedure Initialize(var I2C : TI2C_Registers);
    procedure Initialize(var I2C : TI2C_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier;AScreenInfo : TScreenInfo);
    procedure Reset;
  end;
{$ENDIF}
{$IF DEFINED(HAS_IMPLEMENTATION_GPIOPORT)}
type
  TCustomGPIODisplay = object(TCustomDisplay)
  private
    FPinWR : TPinIdentifier;
    FPinRD : TPinIdentifier;
    //FPinCS : TPinIdentifier;
    FpGPIOPort : ^TGPIO_Registers;
  public
    procedure Initialize(var GPIOPort : TGPIO_Registers;const APinDC,APinWR,APinRD,aPinCS,APinRST : TPinIdentifier;AScreenInfo : TScreenInfo);
    procedure WriteCommand(const value : byte);
    procedure WriteCommand(const Values: array of Byte);
    procedure WriteData(const value : byte);
    procedure WriteDataWord(const value : word);
    procedure WriteData(const Values: array of Byte);
    procedure WriteDataWord(const Values : array of word);
  end;
{$ENDIF}
implementation

class operator TScreenInfo.= (a,b : TScreenInfo) : boolean;
begin
  Result := (a.Width = b.Width) and (a.Height = b.Height) and (a.Depth = b.Depth);
end;

procedure TCustomDisplay.setPinRST(const Value : TPinIdentifier);
begin
  FPinRST := Value;
end;

procedure TCustomDisplay.setPinDC(const Value : TPinIdentifier);
begin
  FPinDC := Value;
end;

procedure TCustomDisplay.setScreenInfo(const Value : TScreenInfo);
begin
  FScreenInfo := Value;
end;

procedure TCustomDisplay.setForegroundColor(const Color : TColor);
begin
  FForegroundColor := Color;
  if FScreenInfo.Depth = TDisplayBitDepth.SixteenBits then
    FNativeForegroundColor := ((Color shr 19) and %11111) or ((Color shr 5) and %11111100000)  or ((Color shl 8) and %1111100000000000)
  else if FScreenInfo.Depth = TDisplayBitDepth.OneBit then
    if Color = 0 then
      FNativeForegroundColor := 0
    else
      FNativeForegroundColor := $ff;
end;

procedure TCustomDisplay.setBackgroundColor(const Color : TColor);
begin
  FBackgroundColor := Color;
  if FScreenInfo.Depth = TDisplayBitDepth.SixteenBits then
    FNativeBackgroundColor := ((Color shr 19) and %11111) or ((Color shr 5) and %11111100000)  or ((Color shl 8) and %1111100000000000)
  else if FScreenInfo.Depth = TDisplayBitDepth.OneBit then
    if Color = 0 then
      FNativeBackgroundColor := 0
    else
      FNativeBackgroundColor := $ff;
end;

procedure TCustomDisplay.CalculateAntialiasColors(out AntiAliasColors : array of word);
begin
  AntiAliasColors[%00] := ((BackgroundColor shr 19) and %11111) or ((BackgroundColor shr 5) and %11111100000)  or ((BackgroundColor shl 8) and %1111100000000000);
  AntiAliasColors[%11] := ((ForegroundColor shr 19) and %11111) or ((ForegroundColor shr 5) and %11111100000)  or ((ForegroundColor shl 8) and %1111100000000000);

  //Set some simple defaults (effectively kills antialiasing)
  AntiAliasColors[%01] := AntiAliasColors[%00];
  AntiAliasColors[%10] := AntiAliasColors[%11];

  case BackgroundColor of
    clWhite:
      case ForeGroundColor of
        clBlack : begin
                    AntiAliasColors[%01] := 20 + 42 shl 5 + 20 shl 11;
                    AntiAliasColors[%10] := 10 + 21 shl 5 + 10 shl 11;
                  end;
        clBlue : begin
                    AntiAliasColors[%01] := 31 + 40 shl 5 + 20 shl 11;
                    AntiAliasColors[%10] := 31 + 20 shl 5 + 10 shl 11;
                  end;
        clLime : begin
                    AntiAliasColors[%01] := 20 + 63 shl 5 + 20 shl 11;
                    AntiAliasColors[%10] := 10 + 63 shl 5 + 10 shl 11;
                  end;
        clGreen : begin
                    AntiAliasColors[%01] := 20 + 63 shl 5 + 20 shl 11;
                    AntiAliasColors[%10] := 10 + 47 shl 5 + 10 shl 11;
                  end;
        clRed : begin
                    AntiAliasColors[%01] := 20 + 40 shl 5 + 31 shl 11;
                    AntiAliasColors[%10] := 10 + 20 shl 5 + 31 shl 11;
                  end;
      end;

    clBlack: begin
      case ForeGroundColor of
        clWhite : begin
                    AntiAliasColors[%01] := 10 + 21 shl 5 + 10 shl 11;
                    AntiAliasColors[%10] := 20 + 42 shl 5 + 20 shl 11;
                  end;
        clBlue : begin
                    AntiAliasColors[%01] := 10 +  0 shl 5 +  0 shl 11;
                    AntiAliasColors[%10] := 20 +  0 shl 5 +  0 shl 11;
                  end;
        clLime : begin
                    AntiAliasColors[%01] :=  0 + 21 shl 5 +  0 shl 11;
                    AntiAliasColors[%10] :=  0 + 42 shl 5 +  0 shl 11;
                  end;
        clGreen : begin
                    AntiAliasColors[%01] :=  0 + 10 shl 5 +  0 shl 11;
                    AntiAliasColors[%10] :=  0 + 20 shl 5 +  0 shl 11;
                  end;
        clRed : begin
                    AntiAliasColors[%01] :=  0 +  0 shl 5 + 10 shl 11;
                    AntiAliasColors[%10] :=  0 +  0 shl 5 + 20 shl 11;
                  end;
      end;
    end;
  end;
end;

{$IF DEFINED(HAS_IMPLEMENTATION_SPI)}
procedure TCustomSPIDisplay.Initialize(var SPI : TSpi_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier;AScreenInfo : TScreenInfo);
begin
  FpSPI := @SPI;
  FPinDC := APinDC;
  FPinRST := APinRST;
  FScreenInfo :=  AScreenInfo;
  FBackgroundColor := clBlack;
  FForegroundColor := clWhite;

  GPIO.PinMode[APinDC] := TPinMode.Output;
  GPIO.PinMode[APinRST] := TPinMode.Output;
  GPIO.PinValue[APinDC] := 1;
  GPIO.PinValue[APinRST] := 1;
end;

procedure TCustomSPIDisplay.Reset;
begin
  if FPinDC <> TNativePin.None then
    GPIO.SetPinLevelHigh(FPinDC);
  if FPinRST <> TNativePin.None then
  begin
    GPIO.PinValue[FPinRST] := 1;
    SystemCore.Delay(100);
    GPIO.PinValue[FPinRST] := 0;
    SystemCore.Delay(100);
    GPIO.PinValue[FPinRST] := 1;
    SystemCore.Delay(200);
  end;
end;

procedure TCustomSPIDisplay.BeginTransaction;
begin
  FpSPI^.BeginTransaction;
end;

procedure TCustomSPIDisplay.EndTransaction;
begin
  FpSPI^.EndTransaction;
end;

procedure TCustomSPIDisplay.WriteCommand(const Value: Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.WriteByte(Value);
end;

procedure TCustomSPIDisplay.WriteCommand(const Value: Byte; const Param1 : Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.WriteBytes([Value,Param1],2);
end;

procedure TCustomSPIDisplay.WriteCommand(const Value: Byte; const Param1,Param2 : Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.WriteBytes([Value,Param1,Param2],3);
end;

procedure TCustomSPIDisplay.WriteCommand(const Value: Byte; const Param1,Param2,Param3 : Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.WriteBytes([Value,Param1,Param2,Param3],4);
end;

procedure TCustomSPIDisplay.WriteCommand2(const Value: Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.WriteByte(Value);
end;

procedure TCustomSPIDisplay.WriteCommand2(const Value: Byte; const Param1 : Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.WriteByte(Value);
  GPIO.PinValue[FPinDC] := 1;
  FpSPI^.WriteByte(Param1);
end;

procedure TCustomSPIDisplay.WriteCommand2(const Value: Byte; const Param1,Param2 : Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.WriteByte(Value);
  GPIO.PinValue[FPinDC] := 1;
  FpSPI^.WriteByte(Param1);
  FpSPI^.WriteByte(Param2);
end;

procedure TCustomSPIDisplay.WriteCommand2(const Value: Byte; const Param1,Param2,Param3 : Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpSPI^.WriteByte(Value);
  GPIO.PinValue[FPinDC] := 1;
  FpSPI^.WriteByte(Param1);
  FpSPI^.WriteByte(Param2);
  FpSPI^.WriteByte(Param3);
end;

procedure TCustomSPIDisplay.WriteData(const Value: Byte);
begin
  GPIO.PinValue[FPinDC] := 1;
  FpSPI^.WriteByte(Value);
end;

procedure TCustomSPIDisplay.WriteData(const Values: array of Byte;aCount:integer);
begin
  GPIO.PinValue[FPinDC] := 1;
  if Length(Values) > 0 then
    FpSPI^.WriteBytes(Values,aCount);
end;

procedure TCustomSPIDisplay.WriteData(const Values: array of Word;aCount:integer);
begin
  GPIO.PinValue[FPinDC] := 1;
  if Length(Values) > 0 then
    FpSPI^.WriteWords(Values,aCount);
end;

procedure TCustomSPIDisplay.WriteBuffer(const aBuffer: pointer; aCount : integer);
begin
  GPIO.PinValue[FPinDC] := 1;
  if aCount > 0 then
    FpSPI^.WriteBuffer(aBuffer,aCount);
end;

{$ENDIF}

{$IF DEFINED(HAS_IMPLEMENTATION_I2C)}
procedure TCustomI2CDisplay.Initialize(var I2C : TI2C_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier;AScreenInfo : TScreenInfo);
begin
  FpI2C := @I2C;
  FPinDC := APinDC;
  FPinRST := APinRST;
  FScreenInfo :=  AScreenInfo;
  FBackgroundColor := clBlack;
  FForegroundColor := clWhite;

  GPIO.PinMode[APinDC] := TPinMode.Output;
  GPIO.PinMode[APinRST] := TPinMode.Output;
  GPIO.PinValue[APinDC] := 1;
  GPIO.PinValue[APinRST] := 1;
end;

procedure TCustomI2CDisplay.Reset;
begin
  if FPinDC <> TNativePin.None then
    GPIO.SetPinLevelHigh(FPinDC);
  if FPinRST <> TNativePin.None then
  begin
    GPIO.PinValue[FPinRST] := 1;
    SystemCore.Delay(10);
    GPIO.PinValue[FPinRST] := 0;
    SystemCore.Delay(10);
    GPIO.PinValue[FPinRST] := 1;
  end;
end;

procedure TCustomI2CDisplay.WriteCommand(const Value: Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  FpI2C^.WriteByte(Value, 1);
end;

procedure TCustomI2CDisplay.WriteCommand(const Values: array of Byte);
begin
  GPIO.PinValue[FPinDC] := 0;
  if Length(Values) > 0 then
    FpI2C^.WriteByte(Values);
end;

procedure TCustomI2CDisplay.WriteData(const Value: Byte);
begin
  GPIO.PinValue[FPinDC] := 1;
  FpI2C^.WriteByte(Value);
end;

procedure TCustomI2CDisplay.WriteData(const Values: array of Byte);
begin
  GPIO.PinValue[FPinDC] := 1;
  if Length(Values) > 0 then
    FpI2C^.WriteByte(Values);
end;

procedure TCustomI2CDisplay.WriteBuffer(const aWriteBuffer: pointer; aWriteCount : integer);
begin
  GPIO.PinValue[FPinDC] := 1;
  if aWriteCount > 0 then
    FpI2C^.WriteBuffer(aWriteBuffer,aWriteCount);
end;
{$ENDIF}

{$IF DEFINED(HAS_IMPLEMENTATION_GPIOPORT)}
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
{$ENDIF}
end.
