unit MBF.Displays.SSD1306;
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
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI,
  MBF.Displays.CustomDisplay;

const
  ScreenSize128x64x1: TScreenInfo =
    (Width: 128; Height: 64; Depth: TDisplayBitDepth.OneBit);
  ScreenSize128x32x1: TScreenInfo =
    (Width: 128; Height: 32; Depth: TDisplayBitDepth.OneBit);
  ScreenSize96x16x1: TScreenInfo =
    (Width: 96; Height: 16; Depth: TDisplayBitDepth.OneBit);
  ScreenSize64x48x1: TScreenInfo =
    (Width: 64; Height: 48; Depth: TDisplayBitDepth.OneBit);

type
  TSSD1306 = object(TCustomSPIDisplay)
    FInternalVcc : boolean;
    procedure InitSequence;
    procedure ClearScreen;
    procedure setFont(TheFontInfo : TFontInfo);
    function setDrawArea(X,Y,Width,Height : word):longWord;
    //procedure drawText(TheText : String; x,y : longWord);
  end;

implementation

uses
  MBF.Types,
  MBF.__CONTROLLERTYPE__.SystemCore;

const
  CMD_CHARGE_PUMP = $8D;
  CMD_COLUMN_ADDRESS = $21;
  CMD_COM_SCAN_DEC = $C8;
  CMD_DISPLAY_ALL_ON_RESUME = $A4;
  CMD_DISPLAY_OFF = $AE;
  CMD_DISPLAY_ON = $AF;
  CMD_MEMORY_MODE = $20;
  CMD_NORMAL_DISPLAY = $A6;
  CMD_PAGE_ADDRESS   = $22;
  CMD_SEGMENT_REMAP = $A0;
  CMD_SET_COM_PINS = $DA;
  CMD_SET_CONTRAST = $81;
  CMD_SET_DISPLAY_CLOCK_DIV = $D5;
  CMD_SET_DISPLAY_OFFSET = $D3;
  CMD_SET_MULTIPLEX = $A8;
  CMD_SET_PRECHARGE = $D9;
  CMD_SET_START_LINE = $40;
  CMD_SET_VCOM_DETECT = $DB;

var
  FontInfo : TFontInfo;

procedure TSSD1306.InitSequence;
begin
  FInternalVCC := true;
  //Set Display off
  WriteCommand(CMD_DISPLAY_OFF);
  Systemcore.Delay(10);

  // Set Display Clock Divide Ratio / OSC Frequency
  WriteCommand([CMD_SET_DISPLAY_CLOCK_DIV, $80]);

  // Set Multiplex Ratio
  WriteCommand(CMD_SET_MULTIPLEX);
  if ScreenInfo = ScreenSize128x32x1 then
    WriteCommand($1F)
  else if ScreenInfo = ScreenSize96x16x1 then
    WriteCommand($0F)
  else if ScreenInfo = ScreenSize64x48x1 then
    WriteCommand($2F)
  else
    WriteCommand($3F);

  // Set Display Offset
  WriteCommand([CMD_SET_DISPLAY_OFFSET, $00]);

  // Set Display Start Line
  WriteCommand(CMD_SET_START_LINE);

  // Set Charge Pump
  WriteCommand(CMD_CHARGE_PUMP);
  if FInternalVCC then
    WriteCommand($14)
  else
    WriteCommand($10);

  WriteCommand([CMD_MEMORY_MODE, $00]);

  // Set Segment Re-Map
  WriteCommand(CMD_SEGMENT_REMAP or $01);

  // Set Com Output Scan Direction
  WriteCommand(CMD_COM_SCAN_DEC);

  // Set COM Hardware Configuration
  WriteCommand(CMD_SET_COM_PINS);
  if (ScreenInfo = ScreenSize128x32x1) or (ScreenInfo = ScreenSize96x16x1) then
    WriteCommand($02)
  else
    WriteCommand($12);

  // Set Contrast
  WriteCommand(CMD_SET_CONTRAST);
  if (ScreenInfo = ScreenSize128x32x1) or (ScreenInfo = ScreenSize64x48x1) then
    WriteCommand($8F)
  else if ScreenInfo = ScreenSize96x16x1 then
  begin
    if FInternalVCC then
      WriteCommand($AF)
    else
      WriteCommand($10);
  end
  else
  begin
    if FInternalVCC then
      WriteCommand($CF)
    else
      WriteCommand($9F);
  end;

   // Set Pre-Charge Period
  WriteCommand(CMD_SET_PRECHARGE);

  if FInternalVCC then
    WriteCommand($F1)
  else
    WriteCommand($22);

  // Set VCOMH Deselect Level
  WriteCommand([CMD_SET_VCOM_DETECT, $40]);

  // Set all pixels OFF
  WriteCommand(CMD_DISPLAY_ALL_ON_RESUME);

  // Set display not inverted
  WriteCommand(CMD_NORMAL_DISPLAY);
  Systemcore.Delay(10);

  // Set display On
  WriteCommand(CMD_DISPLAY_ON);
end;

procedure TSSD1306.clearScreen;
const
  black : array[0..15] of byte = ($00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);
  white : array[0..15] of byte = ($ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff);
var
  i : integer;
  pixel : byte;
begin
  WriteCommand([CMD_COLUMN_ADDRESS,0,ScreenInfo.Width-1]);
  WriteCommand([CMD_PAGE_ADDRESS,0,(ScreenInfo.Height div 8)-1]);
  //Increase Performance by writing larger chunks of data
  for i := 1 to (ScreenInfo.Width*ScreenInfo.Height) div (8*16) do
  begin
    if BackgroundColor = clBlack then
      writeData(black)
    else
      writeData(white);
  end;
end;

procedure TSSD1306.setFont(TheFontInfo : TFontInfo);
begin
  FontInfo := TheFontInfo;
end;

function TSSD1306.setDrawArea(X,Y,Width,Height : word):longWord;
begin
  if X >=ScreenInfo.Width then
    X := ScreenInfo.Width-1;
  if Y >=ScreenInfo.Height then
    Y := ScreenInfo.Height-1;

  if X+Width >=ScreenInfo.Width then
    Width := ScreenInfo.Width-1-X;
  if Y+Height >=ScreenInfo.Height then
    Height := ScreenInfo.Height-Y;

  WriteCommand([CMD_COLUMN_ADDRESS,X,X+Width-1]);
  WriteCommand([CMD_PAGE_ADDRESS,Y div 8,(((Y+Height) div 8)-1)]);
  Result := Width*Height div 8;
end;


(*
procedure TSSD1306.drawText(TheText : String; x,y : longWord);
var
  i,j : integer;
  charstart : integer;
  PixelBudget,fx,fy : longWord;
  PixelBuffer : array of word;
  Pixel : byte;
begin
  // To ease up things allow caracters only on Segment boundaries
  y := (y div 8) shl 3;
  for i := 1 to length(TheText) do
  begin
    charstart := pos(TheText[i],FontInfo.Charmap);
    if charstart > 0 then
    begin
      setDrawArea(x+(i-1)*FontInfo.Width,y,FontInfo.Width,FontInfo.Height);
      charstart := (charstart-1) * FontInfo.BytesPerChar;

      for row := 7 downto 0 do
      begin
        FontInfo.pFontData^[charstart + (fy*fontInfo.Width+fx)];
        PixelBuffer[0] :=
        FontInfo.pFontData^[charstart + ((fy*fontInfo.Width+fx) div 4)];
          pixel := (pixel shr ((3-(fx and %11)) * 2)) and %11;
          PixelBuffer[fy*FontInfo.Width+fx] := AntialiasColors[pixel];
      end;
    end
    else
    begin
      for j := 0 to FontInfo.Width*FontInfo.Height-1 do
        PixelBuffer[j] := BackgroundColor;
    end;
  end;
end;
*)
end.
