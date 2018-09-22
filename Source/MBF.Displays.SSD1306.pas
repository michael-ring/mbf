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
    (Width: 64; Height: 16; Depth: TDisplayBitDepth.OneBit);

type
  TSSD1306 = object(TCustomSPIDisplay)
    FInternalVcc : boolean;
    procedure InitSequence;
    procedure ClearScreen;
    //procedure setFont(TheFontInfo : TFontInfo);
    //function setDrawArea(X,Y,Width,Height : word):longWord;
    //procedure drawText(TheText : String; x,y : longWord);
  end;

implementation

uses
  MBF.__CONTROLLERTYPE__.SystemCore;

procedure TSSD1306.InitSequence;
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
begin
  //Set Display off
  WriteCommand(CMD_DISPLAY_OFF);
  Systemcore.Delay(5);

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
  Systemcore.Delay(5);

  // Set display On
  WriteCommand(CMD_DISPLAY_ON);
end;

procedure TSSD1306.clearScreen;
begin
  WriteCommand([SSD1306_COLUMNADDR,0,ScreenInfo.Width-1]);
  WriteCommand([SSD1306_PAGEADDR,0,(ScreenInfo.Height div 8)-1]);

end;

(*
function TSSD1963.setDrawArea(X,Y,Width,Height : word):longWord;
begin
  if X >=ScreenInfo.Width then
    X := ScreenInfo.Width-1;
  if Y >=ScreenInfo.Height then
    Y := ScreenInfo.Height-1;

  if X+Width >=ScreenInfo.Width then
    Width := ScreenInfo.Width-1-X;
  if Y+Height >=ScreenInfo.Height then
    Height := ScreenInfo.Height-Y;

  WriteCommand(SSD1963_ENTER_NORMAL_MODE);
  WriteCommand(SSD1963_SET_COLUMN_ADDRESS);
  WriteData(X shr 8);
  WriteData(X and $ff);
  WriteData((X+Width-1) shr 8);
  WriteData((X+Width-1) and $ff);

  WriteCommand(SSD1963_SET_PAGE_ADDRESS);
  WriteData(Y shr 8);
  WriteData(Y and $ff);
  WriteData((Y+Height-1) shr 8);
  WriteData((Y+Height-1) and $ff);
  Result := Width*Height;
end;

procedure TSSD1306.SetWriteWindow(const WriteRect: TIntRect);
const
  VirtualWidth = 128;
var
  InitOffset: Integer;
begin
  InitOffset := (VirtualWidth - FScreenSize.X) div 2;

  WriteCommand([CMD_COLUMN_ADDRESS, InitOffset, InitOffset + FScreenSize.X - 1, CMD_PAGE_ADDRESS, 0,
    (FPhysicalSize.Y div 8) - 1]);

  if (FPinDC <> -1) and (FDataPort is TCustomPortSPI) then
    FGPIO.PinValue[FPinDC] := 1;
end;
*)
end.
