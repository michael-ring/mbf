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
    FExternalVCC : boolean;
    procedure InitSequence;
    procedure ClearScreen;
    procedure setFont(const TheFontInfo : TFontInfo);
    function setDrawArea(X,Y,Width,Height : word):longWord;
    procedure drawText(const TheText : String; x,y : longWord);
  end;

implementation

uses
  MBF.Types;

const
  {%H-}CMD_SET_LOW_COLUMN = $00;
  //CMD_EXTERNAL_VCC = $01;
  //CMD_SWITCH_CAP_VCC = $02;
  {%H-}CMD_SET_HIGH_COLUMN = $10;

  CMD_MEMORY_MODE = $20;
  CMD_COLUMN_ADDRESS = $21;
  CMD_PAGE_ADDRESS   = $22;
  {%H-}CMD_RIGHT_HORIZONTAL_SCROLL = $26;
  {%H-}CMD_LEFT_HORIZONTAL_SCROLL = $27;
  {%H-}CMD_VERTICAL_AND_RIGHT_HORIZONTAL_SCROLL = $29;
  {%H-}CMD_VERTICAL_AND_LEFT_HORIZONTAL_SCROLL = $2A;
  CMD_DEACTIVATE_SCROLL = $2E;
  {%H-}CMD_ACTIVATE_SCROLL = $2F;
  CMD_SET_START_LINE = $40;
  CMD_SET_CONTRAST = $81;
  CMD_CHARGE_PUMP = $8D;
  CMD_SEGMENT_REMAP = $A0;
  {%H-}CMD_SET_VERTICAL_SCROLL_AREA = $A3;
  CMD_DISPLAY_ALL_ON_RESUME = $A4;
  {%H-}CMD_DISPLAY_ALL_ON =$A5;
  CMD_NORMAL_DISPLAY = $A6;
  {%H-}CMD_INVERT_DISPLAY = $A7;
  CMD_SET_MULTIPLEX_RATIO = $A8;
  CMD_DISPLAY_OFF = $AE;
  CMD_DISPLAY_ON = $AF;
  {%H-}CMD_SET_PAGE_START = $B0;
  {%H-}CMD_COM_SCAN_INC = $C0;
  CMD_COM_SCAN_DEC = $C8;
  CMD_SET_DISPLAY_OFFSET = $D3;
  CMD_SET_DISPLAY_CLOCK_DIV = $D5;
  CMD_SET_PRECHARGE = $D9;
  CMD_SET_COM_PINS = $DA;
  CMD_SET_VCOM_DETECT = $DB;
  {%H-}CMD_NOP = $E3;

var
  FontInfo : TFontInfo;

procedure TSSD1306.InitSequence;
begin
  FExternalVCC := false;

  BeginTransaction;
  //Set Display off
  WriteCommand(CMD_DISPLAY_OFF);

  // Set Display Clock Divide Ratio / OSC Frequency
  WriteCommand(CMD_SET_DISPLAY_CLOCK_DIV, $80);

  // Set Multiplex Ratio
  WriteCommand(CMD_SET_MULTIPLEX_RATIO,ScreenInfo.Height-1);

  // Set Display Offset
  WriteCommand(CMD_SET_DISPLAY_OFFSET, $00);

  // Set Display Start Line
  WriteCommand(CMD_SET_START_LINE or $00);

  // Set Charge Pump
  if FExternalVCC then
    WriteCommand(CMD_CHARGE_PUMP,$10)
  else
    WriteCommand(CMD_CHARGE_PUMP,$14);

  WriteCommand(CMD_MEMORY_MODE, $00);

  // Set Segment Re-Map
  WriteCommand(CMD_SEGMENT_REMAP or $01);

  // Set Com Output Scan Direction
  WriteCommand(CMD_COM_SCAN_DEC);

  // Set COM Hardware Configuration
  if (ScreenInfo = ScreenSize128x32x1) then
  begin
    WriteCommand(CMD_SET_COM_PINS,$02);
    WriteCommand(CMD_SET_CONTRAST,$8F)
  end
  else if (ScreenInfo = ScreenSize128x64x1) then
  begin
    WriteCommand(CMD_SET_COM_PINS,$12);
    if FExternalVCC then
      WriteCommand(CMD_SET_CONTRAST,$9F)
    else
      WriteCommand(CMD_SET_CONTRAST,$CF);
  end
  else if (ScreenInfo = ScreenSize96x16x1) then
  begin
    WriteCommand(CMD_SET_COM_PINS,$02);
    if FExternalVCC then
      WriteCommand(CMD_SET_CONTRAST,$10)
    else
      WriteCommand(CMD_SET_CONTRAST,$AF);
  end;

   // Set Pre-Charge Period
  if FExternalVCC then
    WriteCommand(CMD_SET_PRECHARGE,$22)
  else
    WriteCommand(CMD_SET_PRECHARGE,$F1);

  // Set VCOMH Deselect Level
  WriteCommand(CMD_SET_VCOM_DETECT, $40);

  // Set all pixels OFF
  WriteCommand(CMD_DISPLAY_ALL_ON_RESUME);

  // Set display not inverted
  WriteCommand(CMD_NORMAL_DISPLAY);
  WriteCommand(CMD_DEACTIVATE_SCROLL);
  // Set display On
  WriteCommand(CMD_DISPLAY_ON);
  EndTransaction;
end;

procedure TSSD1306.clearScreen;
const
  black : array[0..15] of byte = ($00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);
  white : array[0..15] of byte = ($ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff);
var
  i : integer;
begin
  beginTransaction;
  setDrawArea(0,0,ScreenInfo.Width,ScreenInfo.Height);
  //Increase Performance by writing larger chunks of data
  for i := 1 to (ScreenInfo.Width*ScreenInfo.Height) div (8*16) do
  begin
    if BackgroundColor = clBlack then
      writeData(black,length(black))
    else
      writeData(white,length(white));
  end;
  endTransaction;
end;

procedure TSSD1306.setFont(const TheFontInfo : TFontInfo);
begin
  FontInfo := TheFontInfo;
end;

function TSSD1306.setDrawArea(X,Y,Width,Height : word):longWord;
begin
  Result := 0;
  if (X >=ScreenInfo.Width) or (Y >=ScreenInfo.Height) then
    exit;

  if X+Width >ScreenInfo.Width then
    Width := ScreenInfo.Width-X;
  if Y+Height >ScreenInfo.Height then
    Height := ScreenInfo.Height-Y;

  beginTransAction;
  WriteCommand(CMD_PAGE_ADDRESS,Y shr 3,(Y+Height{%H-}-1) shr 3);
  WriteCommand(CMD_COLUMN_ADDRESS,X,X+Width{%H-}-1);
  Result := Width*Height shr 3;
end;

procedure TSSD1306.drawText(const TheText : String; x,y : longWord);
var
  x1,y1,i,j : longWord;
  theChar : char;
  charstart,charStartPos : word;
  boxedHeight,boxedWidth,lineIncrement : word;
  offset,bit : byte;

{$if defined(CPUAVR_HAS_LPMX)}
function read_progmem_char(constref v: char): char;  assembler;  nostackframe;
asm
  movw ZL, r24
  lpm r24, Z
end;

function read_progmem_byte(constref v: byte): byte;  assembler;  nostackframe;
asm
  movw ZL, r24
  lpm r24, Z
end;

function pos(const needle: char;const haystack:String):byte;
var
  i,Length : byte;
begin
  Result := 0;
  Length := read_progmem_byte(byte(haystack[0]));
  for i := 1 to Length do
    if read_progmem_char(haystack[i]) = needle then
    begin
      Result := i;
      exit;
    end;
end;
{$endif}
begin
  //Make the font Width and Height a multiple of 8
  boxedHeight := (((FontInfo.Height-1) shr 3)+1) shl 3;
  boxedWidth := (((FontInfo.Width-1) shr 3)+1) shl 3;
  lineIncrement := fontInfo.BytesPerChar div fontInfo.Height;
  //We handle 8 rows on the display at once as they are stored in a single byte
  for i := 1 to length(TheText) do
  begin
    //only compute when char is completely visible
    if (x+i*fontInfo.Width <= ScreenInfo.Width) and (y+fontInfo.Height <= ScreenInfo.Height) then
    begin
      theChar := TheText[i];
      charstart := pos(theChar,FontInfo.pCharmap^);
      //The char was found in the list of a available chars
      if charstart > 0 then
      begin
        charStartPos := (charstart-1)*FontInfo.BytesPerChar;
        x1 := 0;
        y1 := 0;
        for y1 := 0 to (boxedHeight shr 3)-1 do
        begin
          for x1 := 0 to (boxedWidth shr 3)-1 do
          begin
            for bit := 7 downto 0 do
            begin
              FontInfo.pRowBuffer^[7-bit{%H-}+x1 shl 3] := 0;
              for offset := 7 downto 0 do
              begin
                {$if defined(CPUAVR_HAS_LPMX)}
                if odd(read_progmem_byte(FontInfo.pFontData^[charStartPos+x1+((y1 shl 3)+offset)*lineIncrement]) shr bit) and ((y1 shl 3)+offset <= FontInfo.Height) then
                {$else}
                if odd(FontInfo.pFontData^[charStartPos+x1+((y1 shl 3)+offset)*lineIncrement] shr bit) and ((y1 shl 3)+offset <= FontInfo.Height) then
                {$endif}
                FontInfo.pRowBuffer^[7-bit{%H-}+(x1 shl 3)] := FontInfo.pRowBuffer^[7-bit{%H-}+(x1 shl 3)] or (1 shl offset);
              end;
              if BackgroundColor = clWhite then
                FontInfo.pRowBuffer^[7-bit{%H-}{%H-}+(x1 shl 3)] := not FontInfo.pRowBuffer^[7-bit{%H-}{%H-}+(x1 shl 3)];
            end;
          end;
          SetDrawArea(x+(i-1)*FontInfo.Width,y+(y1 shl 3),FontInfo.Width,8);
          WriteData(FontInfo.pRowBuffer^,FontInfo.Width);
        end;
      end
      else
      begin
        for j := 0 to FontInfo.Width-1 do
          FontInfo.pRowBuffer^[j] := byte(FNativeBackgroundColor);
        for j := 0 to (FontInfo.Height-1) shr 3 do
        begin
          SetDrawArea(x+(i-1)*FontInfo.Width,y+j*8,FontInfo.Width,8);
          WriteData(FontInfo.pRowBuffer^,FontInfo.Width);
        end;
      end;
    end;
  end;
  EndTransaction;
end;

end.
