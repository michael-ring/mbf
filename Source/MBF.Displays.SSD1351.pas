unit MBF.Displays.SSD1351;
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
  //MBF.__CONTROLLERTYPE__.GPIO,
  MBF.Displays.CustomDisplay;
const
  //ScreenSize96x64x8: TScreenInfo =
  //  (Width: 96; Height: 64; Depth: TDisplayBitDepth.SixteenBits);
  ScreenSize128x128x16: TScreenInfo =
    (Width: 128; Height: 128; Depth: TDisplayBitDepth.SixteenBits);

type
  TSSD1351 = object(TCustomSPIDisplay)
    procedure InitSequence;
    procedure ClearScreen;
    procedure setFont(TheFontInfo : TFontInfo);
    function setDrawArea(X,Y,Width,Height : word):longWord;
    procedure drawText(TheText : String; x,y : longWord);
  end;

implementation

uses
  //MBF.Types,
  MBF.__CONTROLLERTYPE__.SystemCore;

const
  CMD_SETCOLUMN      =$15;
  CMD_WRITERAM       =$5C;
  CMD_READRAM        =$5D;
  CMD_SETROW         =$75;
  CMD_HORIZSCROLL    =$96;
  CMD_STOPSCROLL     =$9E;
  CMD_STARTSCROLL    =$9F;
  CMD_SETREMAP       =$A0;
  CMD_STARTLINE      =$A1;
  CMD_DISPLAYOFFSET  =$A2;
  CMD_DISPLAYALLOFF  =$A4;
  CMD_DISPLAYALLON   =$A5;
  CMD_NORMALDISPLAY  =$A6;
  CMD_INVERTDISPLAY  =$A7;
  CMD_FUNCTIONSELECT =$AB;
  CMD_DISPLAYOFF     =$AE;
  CMD_DISPLAYON      =$AF;
  CMD_PRECHARGE      =$B1;
  CMD_DISPLAYENHANCE =$B2;
  CMD_CLOCKDIV       =$B3;
  CMD_SETVSL         =$B4;
  CMD_SETGPIO        =$B5;
  CMD_PRECHARGE2     =$B6;
  CMD_SETGRAY        =$B8;
  CMD_USELUT         =$B9;
  CMD_PRECHARGELEVEL =$BB;
  CMD_VCOMH          =$BE;
  CMD_CONTRASTABC    =$C1;
  CMD_CONTRASTMASTER =$C7;
  CMD_MUXRATIO       =$CA;
  CMD_COMMANDLOCK    =$FD;

var
  FontInfo : TFontInfo;

procedure TSSD1351.InitSequence;
begin
  beginTransaction;
  // Initialization Sequence
  writeCommand(CMD_COMMANDLOCK,$12);
  writeCommand(CMD_COMMANDLOCK,$B1);
  writeCommand(CMD_DISPLAYOFF);
  writeCommand(CMD_CLOCKDIV,$F1);
  writeCommand(CMD_MUXRATIO,$7F);
  writeCommand(CMD_DISPLAYOFFSET,$00);
  writeCommand(CMD_SETGPIO,$00);
  writeCommand(CMD_FUNCTIONSELECT,$01);
  writeCommand(CMD_PRECHARGE,$32);
  writeCommand(CMD_VCOMH,$05);
  writeCommand(CMD_NORMALDISPLAY);
  writeCommand(CMD_CONTRASTABC,$C8,$80,$C8);
  writeCommand(CMD_CONTRASTMASTER,$0F);
  writeCommand(CMD_SETVSL,$A0,$B5,$55);
  writeCommand(CMD_PRECHARGE2,$01);
  writeCommand(CMD_DISPLAYON);

  writeCommand(CMD_SETREMAP,%01100000);
  writeCommand(CMD_STARTLINE,$00);
  endTransaction;
end;

procedure TSSD1351.clearScreen;
var
  i : integer;
  buffer : array[0..31] of word;
begin
  beginTransaction;
  setDrawArea(0,0,ScreenInfo.Width,ScreenInfo.Height);
  for i := low(buffer) to high(buffer) do
      buffer[i] := FNativeBackgroundColor;
  //Increase Performance by writing larger chunks of data
  for i := 1 to (ScreenInfo.Width*ScreenInfo.Height) div length(buffer) do
    writeData(buffer,length(buffer));
  endTransaction;
end;

procedure TSSD1351.setFont(TheFontInfo : TFontInfo);
begin
  FontInfo := TheFontInfo;
end;

function TSSD1351.setDrawArea(X,Y,Width,Height : word):longWord;
begin
  Result := 0;
  if (X >=ScreenInfo.Width) or (Y >=ScreenInfo.Height) then
    exit;

  if X+Width >ScreenInfo.Width then
    Width := ScreenInfo.Width-X;
  if Y+Height >ScreenInfo.Height then
    Height := ScreenInfo.Height-Y;

  beginTransaction;
  WriteCommand(CMD_SETCOLUMN,X,X+Width-1);
  WriteCommand(CMD_SETROW,Y,Y+Height-1);
  WriteCommand(CMD_WRITERAM);
  Result := Width*Height;
end;

procedure TSSD1351.drawText(TheText : String; x,y : longWord);
var
  i,j : longWord;
  charstart,pixelPos : longWord;
  fx,fy : longWord;
  PixelBuffer : array of word;
  divFactor,pixel,pixels : byte;
  AntialiasColors : array[0..3] of word;
begin
  SetLength(PixelBuffer,FontInfo.Width*FontInfo.Height);
  divFactor := 8;
  if FontInfo.BitsPerPixel = 2 then
  begin
    CalculateAntialiasColors(AntialiasColors);
    divFactor := 4;
  end;
  for i := 1 to length(TheText) do
  begin
    if (x+i*fontInfo.Width <= ScreenInfo.Width) and (y+fontInfo.Height <= ScreenInfo.Height) then
    begin
      charstart := pos(TheText[i],FontInfo.pCharmap^)-1;
      if charstart > 0 then
      begin
        for fy := 0 to FontInfo.Height-1 do
        begin
          pixelPos := charStart * fontInfo.BytesPerChar+fy*(fontInfo.BytesPerChar div fontInfo.Height);
          for fx := 0 to FontInfo.width-1 do
          begin
            pixels := FontInfo.pFontData^[pixelPos + (fx div divFactor)];
            if FontInfo.BitsPerPixel = 2 then
            begin
              pixel := (pixels shr ((3-(fx and %11)) * 2)) and %11;
              PixelBuffer[fy*FontInfo.Width+fx] := AntialiasColors[pixel];
            end
            else
            begin
              pixel := (pixels shr ((7-(fx and %111)))) and %1;
              if pixel = 0 then
                PixelBuffer[fy*FontInfo.Width+fx] := FNativeBackgroundColor
              else
                PixelBuffer[fy*FontInfo.Width+fx] := FNativeForegroundColor
            end;
          end;
        end;
      end
      else
      begin
        for j := 0 to FontInfo.Width*FontInfo.Height-1 do
          PixelBuffer[j] := FNativeBackgroundColor;
      end;
      SetDrawArea(x+(i-1)*fontInfo.Width,y,FontInfo.Width,FontInfo.Height);
      WriteData(PixelBuffer,length(pixelbuffer));
    end;
  end;
  EndTransaction;
end;

end.
