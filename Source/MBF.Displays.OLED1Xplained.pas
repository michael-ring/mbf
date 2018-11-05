unit MBF.Displays.OLED1Xplained;
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
  ScreenSize128x32x1: TScreenInfo =
    (Width: 128; Height: 32; Depth: TDisplayBitDepth.OneBit);

type
  TOLED1 = object(TCustomSPIDisplay)
  private const
    FPageMap       : array[0..7] of byte = ( 3, 2, 1, 0, 7, 6, 5, 4);
  private var
    FInternalVcc   : boolean;
    FScreenBuffer  : Pointer;
    FScreenBuffer2 : packed array [0..511] of byte;
  public
    procedure InitSequence;
    procedure PresentBuffer;
    procedure ClearScreen;
    procedure setFont(TheFontInfo : TFontInfo);
    procedure DrawCharacter(const X, Line: word; const aChar: byte);
    procedure DrawString(const X, Line: word; const aString: string);
  end;

implementation

uses
  MBF.Types,
  MBF.__CONTROLLERTYPE__.SystemCore;

const
  CMD_CHARGE_PUMP            = $8D;
  CMD_SET_COLUMN_UPPER       = $10;
  CMD_SET_COLUMN_LOWER       = $00;
  CMD_COLUMN_ADDRESS         = $21;
  CMD_COM_SCAN_NORMAL        = $C0;
  CMD_COM_SCAN_DEC           = $C8;
  CMD_DISPLAY_ALL_ON_RESUME  = $A4;
  CMD_DISPLAY_OFF            = $AE;
  CMD_DISPLAY_ON             = $AF;
  CMD_MEMORY_MODE            = $20;
  CMD_NORMAL_DISPLAY         = $A6;
  CMD_INVERSE_DISPLAY        = $A7;
  CMD_PAGE_ADDRESS           = $22;
  CMD_SEGMENT_REMAP          = $A0;
  CMD_SET_COM_PINS           = $DA;
  CMD_SET_CONTRAST           = $81;
  CMD_SET_DISPLAY_CLOCK_DIV  = $D5;
  CMD_SET_DISPLAY_OFFSET     = $D3;
  CMD_SET_MULTIPLEX          = $A8;
  CMD_SET_PRECHARGE          = $D9;
  CMD_SET_START_LINE         = $40;
  CMD_SET_VCOM_DETECT        = $DB;

var
  FontInfo : TFontInfo;

procedure TOLED1.InitSequence;
begin
  Reset;

  //Does not work !!
  //FScreenBuffer := GetMem(FScreenBufferSize);
  FScreenBuffer := @FScreenBuffer2;

  FInternalVCC := true;
  //Set Display off
  WriteCommand(CMD_DISPLAY_OFF);
  SystemCore.Delay(10);

  // Set Display Clock Divide Ratio / OSC Frequency
  WriteCommand([CMD_SET_DISPLAY_CLOCK_DIV, $80]);

  // Set Multiplex Ratio
  WriteCommand(CMD_SET_MULTIPLEX);
  WriteCommand($1F);

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
  WriteCommand(CMD_COM_SCAN_NORMAL);

  // Set COM Hardware Configuration
  WriteCommand(CMD_SET_COM_PINS);
  WriteCommand($02);

  // Set Contrast
  WriteCommand(CMD_SET_CONTRAST);
  WriteCommand($8F);

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

procedure TOLED1.PresentBuffer;
var
  p,col,maxcol:byte;
begin
  for p:=0 to 3 do
  begin
    col:=0;
    maxcol:=(ScreenInfo.Width);

    WriteCommand(CMD_SET_COLUMN_LOWER OR ((col) AND $0F));
    WriteCommand(CMD_SET_COLUMN_UPPER OR (((col) shr 4) AND $0F));
    //WriteCommand([CMD_COLUMN_ADDRESS,0,ScreenInfo.Width-1]);
    WriteCommand([CMD_PAGE_ADDRESS,FPageMap[p],FPageMap[p]]);
    WriteBuffer(FScreenBuffer+(ScreenInfo.Width*p+col),ScreenInfo.Width);
    {
    while (col<=maxcol) do
    begin
      WriteData(FScreenBuffer2[(FScreenSize.X*p)+col]);
      Inc(col);
    end;
    }
  end;
end;


procedure TOLED1.clearScreen;
begin
  FillChar(FScreenBuffer^, ScreenInfo.Width*ScreenInfo.Height, 0);
end;

procedure TOLED1.setFont(TheFontInfo : TFontInfo);
begin
  FontInfo := TheFontInfo;
end;

procedure TOLED1.DrawCharacter(const X, Line: word; const aChar: byte);
var
  i:byte;
  index:word;
begin
  index:=Line * ScreenInfo.Width + X;
  for i:=0 to 4 do
  begin
    if (index+i)>=(ScreenInfo.Width*ScreenInfo.Height) then break;
    PByte(FScreenBuffer+index+i)^:=FontInfo.pFontData^[(aChar*5)+i];
  end;
end;

procedure TOLED1.DrawString(const X, Line: word; const aString: string);
const
  FONTWIDTH=6;
var
  i:byte;
  localX, localLine: longword;
begin
  localX:=X;
  localLine:=Line;
  for i:=1 to Length(aString) do
  begin
    if ((localX+FONTWIDTH)>=ScreenInfo.Width) then
    begin
      localX:=0;
      Inc(localLine);
    end;
    DrawCharacter(localX,localLine,Ord(aString[i]));
    Inc(localX,FONTWIDTH);
  end;
end;

end.
