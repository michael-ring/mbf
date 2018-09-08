unit MBF.Devices.APA106;

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
  MBF.Types,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI;

type
  TPixelCount = 1..100;

  TAPA106 = object
    FRGBPixel: array of TColor;
    MaxPixelCount: longword;
    FPin: TPinIdentifier;
    pFSPI: ^TSPI_Registers;
    FUseSPI : boolean;
    ZeroPattern, OnePattern: word;
    constructor Initialize(Pin: TPinIdentifier; PixelCount: TPixelCount);
    constructor Initialize(var SPI: TSPI_Registers; PixelCount: TPixelCount;
      MOSIPin: TSPIMOSIPins; MISOPin: TSPIMISOPins; CLKPin: TSPISCLKPins;
      NSSPin: TSPINSSPins);
      overload;
    procedure Clear;
    procedure Refresh;
    procedure setRGBPixel(Position: TPixelCount; Value: TColor);
    function getRGBPixel(Position: TPixelCount): TColor;
    property RGBPixel[Position: TPixelCount]: TColor read getRGBPixel write SetRGBPixel;
  end;

implementation

constructor TAPA106.Initialize(Pin: TPinIdentifier; PixelCount: TPixelCount);
begin
  SetLength(FRGBPixel, PixelCount);
  MaxPixelCount := PixelCount;
  FPin := Pin;
  GPIO.Initialize;
  GPIO.PinMode[FPin] := TPinMode.Output;
  GPIO.SetPinLevelLow(FPin);
  FUseSPI := false;
end;

constructor TAPA106.Initialize(var SPI: TSPI_Registers; PixelCount: TPixelCount;
  MOSIPin: TSPIMOSIPins; MISOPin: TSPIMISOPins; CLKPin: TSPISCLKPins;
  NSSPin: TSPINSSPins);
begin
  SetLength(FRGBPixel, PixelCount);
  MaxPixelCount := PixelCount;
  pFSPI := @SPI;
  pFSPI^.Initialize(MOSIPin, MISOPin, CLKPin, NSSPin);
  pFSPI^.BitsPerWord := TSPIBitsPerWord.Sixteen;
  ZeroPattern := %0111000000000000;
  OnePattern  := %0111111000000000;
  FUseSPI := true;
end;

procedure TAPA106.Clear;
var
  i: longword;
begin
  for i := 0 to MaxPixelCount - 1 do
    FRGBPixel[i] := clBlack;
  Refresh;
end;

procedure TAPA106.Refresh;
var
  i, j, k, Value, Mask: longword;
  WriteBuffer: array[0..24*16-1] of word;

begin
  if FUseSPI = true then
  begin
    for i := 0 to MaxPixelCount - 1 do
    begin
      //BRG
      Value := ((FRGBPixel[i] shl 8) and $00ffff00) or ((FRGBPixel[i] shr 16) and $ff);
      Mask := 1 shl 23;
      for j := 0 to 23 do
      begin
        if (Value and Mask) = 0 then
          WriteBuffer[j+i*24] := ZeroPattern
        else
          // Send 1 Bit
          WriteBuffer[j+i*24] := OnePattern;
        Mask := Mask shr 1;
      end;
    end;
    pFSPI^.Write(WriteBuffer, length(WriteBuffer));
  end
  else
  begin
    for i := 0 to MaxPixelCount - 1 do
    begin
      //BRG
      Value := ((FRGBPixel[i] shl 8) and $00ffff00) or ((FRGBPixel[i] shr 16) and $ff);
      Mask := 1 shl 23;
      for j := 0 to 23 do
      begin
        //GPIOA.SetPortBits([TBit.Bit0]);
        //GPIOA.ClearPortBits([TBit.Bit0]);
        //GPIOA.SetPortBits([TBit.Bit0]);
        //GPIOA.ClearPortBits([TBit.Bit0]);

        if (Value and Mask) = 0 then
        begin
          //Send 0 Bit
          GPIO.SetPinLevelHigh(FPin);
          asm
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
          end;
          GPIO.SetPinLevelLow(FPin);
          asm
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
          end;
        end
        else
        begin
          // Send 1 Bit
          GPIO.SetPinLevelHigh(FPin);
          asm
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
          end;
          GPIO.SetPinLevelLow(FPin);
          asm
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
                   NOP
          end;
        end;
        Mask := Mask shr 1;
      end;
    end;
  end;
end;

procedure TAPA106.setRGBPixel(Position: TPixelCount; Value: TColor);
begin
  FRGBPixel[Position - 1] := Value;
end;

function TAPA106.getRGBPixel(Position: TPixelCount): TColor;
begin
  Result := FRGBPixel[Position - 1];
end;

end.
