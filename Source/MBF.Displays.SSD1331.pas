unit MBF.Displays.SSD1331;
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
  ScreenSize96x64x16: TScreenInfo =
    (Width: 96; Height: 64; Depth: TDisplayBitDepth.SixteenBits);

type
  TSSD1331 = object(TCustomSPIDisplay)
    procedure InitSequence;
    procedure ClearScreen;
    procedure setFont(TheFontInfo : TFontInfo);
    function setDrawArea(X,Y,Width,Height : word):longWord;
    procedure drawText(TheText : String; x,y : longWord);
  end;

implementation
uses
  MBF.__CONTROLLERTYPE__.SystemCore;

{$WARN 5028 off : Local $1 "$2" is not used}
const
  CMD_SETCOLUMN     =$15;
  CMD_DRAWLINE      =$21;
  CMD_DRAWRECT      =$22;
  CMD_COPY          =$23;
  CMD_DIM           =$24;
  CMD_CLEAR         =$25;
  CMD_FILL          =$26;
  CMD_SCROLLSETUP   =$27;
  CMD_SCROLLOFF     =$2E;
  CMD_SCROLLON      =$2F;
  CMD_SETROW        =$75;
  CMD_CONTRASTA     =$81;
  CMD_CONTRASTB     =$82;
  CMD_CONTRASTC     =$83;
  CMD_MASTERCURRENT =$87;
  CMD_PRECHARGEA    =$8A;
  CMD_PRECHARGEB    =$8B;
  CMD_PRECHARGEC    =$8C;
  CMD_SETREMAP      =$A0;
  CMD_STARTLINE     =$A1;
  CMD_DISPLAYOFFSET =$A2;
  CMD_NORMALDISPLAY =$A4;
  CMD_DISPLAYALLON  =$A5;
  CMD_DISPLAYALLOFF =$A6;
  CMD_INVERTDISPLAY =$A7;
  CMD_SETMULTIPLEX  =$A8;
  CMD_DIMMODE       =$AB;
  CMD_DISPLAYDIMON  =$AC;
  CMD_SETMASTER     =$AD;
  CMD_DISPLAYOFF    =$AE;
  CMD_DISPLAYON     =$AF;
  CMD_POWERMODE     =$B0;
  CMD_PRECHARGE     =$B1;
  CMD_CLOCKDIV      =$B3;
  CMD_SETGREYSCALE  =$B8;
  CMD_LINEARGREYSCALE=$B9;
  CMD_PRECHARGELEVEL=$BB;
  CMD_NOP           =$DC;
  CMD_VCOMH         =$BE;
  CMD_SETLOCK       =$FD;
  {$WARN 5028 off : Local $1 "$2" is not used}

var
  FontInfo : TFontInfo;

procedure TSSD1331.InitSequence;
begin
  beginTransaction;
// Initialization Sequence
  writeCommand(CMD_DISPLAYOFF);
  writeCommand(CMD_SETREMAP,$72);     // RGB Color
  //writeCommand(CMD_SETREMAP,$76);   // BGR Color
  writeCommand(CMD_STARTLINE,$00);
  writeCommand(CMD_DISPLAYOFFSET,$00);
  writeCommand(CMD_NORMALDISPLAY);
  writeCommand(CMD_SETMULTIPLEX,$3F); //=$3F 1/64 duty
  //writeCommand(CMD_SETMASTER,$8E);
  writeCommand(CMD_SETMASTER,$8F);
  //writeCommand(CMD_POWERMODE,$0B);
  writeCommand(CMD_POWERMODE,$1A);
  //writeCommand(CMD_PRECHARGE,$31);
  writeCommand(CMD_PRECHARGE,$74);
  writeCommand(CMD_CLOCKDIV,$F0);     // 7:4 = Oscillator Frequency, 3:0 = CLK Div Ratio (A[3:0]+1 = 1..16)
  //writeCommand(CMD_PRECHARGEA,$64);
  //writeCommand(CMD_PRECHARGEB,$78);
  //writeCommand(CMD_PRECHARGEC,$64);
  writeCommand(CMD_PRECHARGEA,$81);
  writeCommand(CMD_PRECHARGEB,$82);
  writeCommand(CMD_PRECHARGEC,$83);
  //writeCommand(CMD_PRECHARGELEVEL,$3A);
  writeCommand(CMD_PRECHARGELEVEL,$3E);
  writeCommand(CMD_VCOMH,$3E);
  //writeCommand(CMD_MASTERCURRENT,$06);
  writeCommand(CMD_MASTERCURRENT,$0F);
  //writeCommand(CMD_CONTRASTA,$91);
  //writeCommand(CMD_CONTRASTB,$50);
  //writeCommand(CMD_CONTRASTC,$7D);
  writeCommand(CMD_CONTRASTA,$80);
  writeCommand(CMD_CONTRASTB,$80);
  writeCommand(CMD_CONTRASTC,$80);
  writeCommand(CMD_DISPLAYON);        //--turn on oled panel
  endTransaction;
end;

procedure TSSD1331.clearScreen;
var
  i : integer;
  buffer : array[0..15] of word;
begin
  BeginTransaction;
  setDrawArea(0,0,ScreenInfo.Width,ScreenInfo.Height);
  for i := low(buffer) to high(buffer) do
      buffer[i] := FNativeBackgroundColor;
  //Increase Performance by writing larger chunks of data
  for i := 1 to (ScreenInfo.Width*ScreenInfo.Height) div length(buffer) do
  begin
    writeData(buffer,length(buffer));
  end;
  EndTransaction;
end;

procedure TSSD1331.setFont(TheFontInfo : TFontInfo);
begin
  FontInfo := TheFontInfo;
end;

function TSSD1331.setDrawArea(X,Y,Width,Height : word):longWord;
begin
  Result := 0;
  if (X >=ScreenInfo.Width) or (Y >=ScreenInfo.Height) then
    exit;

  if X+Width >ScreenInfo.Width then
    Width := ScreenInfo.Width-X;
  if Y+Height >ScreenInfo.Height then
    Height := ScreenInfo.Height-Y;
  BeginTransaction;
  WriteCommand(CMD_SETCOLUMN,X,X+Width-1);
  WriteCommand(CMD_SETROW,Y,Y+Height-1);
  Result := Width*Height*2;
end;

procedure TSSD1331.drawText(TheText : String; x,y : longWord);
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
