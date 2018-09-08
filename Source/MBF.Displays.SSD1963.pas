unit MBF.Displays.SSD1963;

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
  MBF.Displays.CustomDisplay,
  MBF.TypeHelpers;

const
  ScreenSize480x272x16: TScreenInfo =
    (Width: 480; Height: 272; Depth: TDisplayBitDepth.SixteenBits);
  ScreenSize640x480x16: TScreenInfo =
    (Width: 640; Height: 480; Depth: TDisplayBitDepth.SixteenBits);
  ScreenSize800x480x16: TScreenInfo =
    (Width: 800; Height: 480; Depth: TDisplayBitDepth.SixteenBits);

type
  TSSD1963 = object(TCustomGPIODisplay)
    procedure InitSequence;
    procedure ClearScreen;
    procedure CalculateAntialiasColors;
    procedure setFont(TheFontInfo : TFontInfo);
    function setDrawArea(X,Y,Width,Height : word):longWord;
    procedure drawText(TheText : String; x,y : longWord);
  end;

implementation
uses
  MBF.__CONTROLLERTYPE__.SystemCore;

var
  FontInfo : TFontInfo;
  AntiAliasColors : array[0..3] of word;


const
  TFT_FPS=60;
  SSD1963_NOP = $00;
  SSD1963_SOFT_RESET = $01;
  SSD1963_GET_POWER_MODE = $0A;
  SSD1963_GET_ADDRESS_MODE = $0B;
  SSD1963_GET_DISPLAY_MODE = $0D;
  SSD1963_GET_TEAR_EFFECT_STATUS = $0E;
  SSD1963_ENTER_SLEEP_MODE = $10;
  SSD1963_EXIT_SLEEP_MODE = $11;
  SSD1963_ENTER_PARTIAL_MODE = $12;
  SSD1963_ENTER_NORMAL_MODE = $13;
  SSD1963_EXIT_INVERT_MODE = $20;
  SSD1963_ENTER_INVERT_MODE = $21;
  SSD1963_SET_GAMMA_CURVE = $26;
  SSD1963_SET_DISPLAY_OFF = $28;
  SSD1963_SET_DISPLAY_ON = $29;
  SSD1963_SET_COLUMN_ADDRESS = $2A;
  SSD1963_SET_PAGE_ADDRESS = $2B;
  SSD1963_WRITE_MEMORY_START = $2C;
  SSD1963_READ_MEMORY_START = $2E;
  SSD1963_SET_PARTIAL_AREA = $30;
  SSD1963_SET_SCROLL_AREA = $33;
  SSD1963_SET_TEAR_OFF = $34;
  SSD1963_SET_REAR_ON = $35;
  SSD1963_SET_ADDRESS_MODE = $36;
  SSD1963_SET_SCROLL_START = $37;
  SSD1963_EXIT_IDLE_MODE = $38;
  SSD1963_ENTER_IDLE_MODE = $39;
  SSD1963_WRITE_MEMORY_CONTINUE = $3C;
  SSD1963_READ_MEMORY_CONTINUE = $3E;
  SSD1963_SET_TEAR_SCANLINE = $44;
  SSD1963_GET_SCANLINE = $45;
  SSD1963_READ_DDB = $A1;
  SSD1963_SET_LCD_MODE = $B0;
  SSD1963_GET_LCD_MODE = $B1;
  SSD1963_SET_HORI_PERIOD = $B4;
  SSD1963_GET_HORI_PERIOD = $B5;
  SSD1963_SET_VERT_PERIOD = $B6;
  SSD1963_GET_VERT_PERIOD = $B7;
  SSD1963_SET_GPIO_CONF = $B8;
  SSD1963_GET_GPIO_CONF = $B9;
  SSD1963_SET_GPIO_VALUE = $BA;
  SSD1963_GET_GPIO_STATUS = $BB;
  SSD1963_SET_POST_PROC = $BC;
  SSD1963_GET_POST_PROC = $BD;
  SSD1963_SET_PWM_CONF = $BE;
  SSD1963_GET_PWM_CONF = $BF;
  SSD1963_GET_LCD_GEN0 = $C0;
  SSD1963_SET_LCD_GEN0 = $C1;
  SSD1963_GET_LCD_GEN1 = $C2;
  SSD1963_SET_LCD_GEN1 = $C3;
  SSD1963_GET_LCD_GEN2 = $C4;
  SSD1963_SET_LCD_GEN2 = $C5;
  SSD1963_GET_LCD_GEN3 = $C6;
  SSD1963_SET_LCD_GEN3 = $C7;
  SSD1963_SET_GPIO0_ROP = $C8;
  SSD1963_GET_GPIO0_ROP = $C9;
  SSD1963_SET_GPIO1_ROP = $CA;
  SSD1963_GET_GPIO1_ROP = $CB;
  SSD1963_SET_GPIO2_ROP = $CC;
  SSD1963_GET_GPIO2_ROP = $CD;
  SSD1963_SET_GPIO3_ROP = $CE;
  SSD1963_GET_GPIO3_ROP = $CF;
  SSD1963_SET_DBC_CONF = $D0;
  SSD1963_GET_DBC_CONF = $D1;
  SSD1963_SET_DBC_TH = $D4;
  SSD1963_GET_DBC_TH = $D5;
  SSD1963_SET_PLL = $E0;
  SSD1963_SET_PLL_MN = $E2;
  SSD1963_GET_PLL_MN = $E3;
  SSD1963_GET_PLL_STATUS = $E4;
  SSD1963_SET_DEEP_SLEEP = $E5;
  SSD1963_SET_LSHIFT_FREQ = $E6;
  SSD1963_GET_LSHIFT_FREQ = $E7;
  SSD1963_SET_PIXEL_DATA_INTERFACE = $F0;
  SSD1963_GET_PIXEL_DATA_INTERFACE = $F1;

  SSD1963_PDI_8BIT = 0;
  SSD1963_PDI_12BIT = 1;
  SSD1963_PDI_16BIT = 2;
  SSD1963_PDI_16BIT565 = 3;
  SSD1963_PDI_18BIT = 4;
  SSD1963_PDI_24BIT = 5;
  SSD1963_PDI_9BIT = 6;


procedure TSSD1963.InitSequence;
(*var
  TFT_HSYNC_BACK_PORCH,
  TFT_HSYNC_FRONT_PORCH,
  TFT_HSYNC_PULSE,
  TFT_VSYNC_BACK_PORCH,
  TFT_VSYNC_FRONT_PORCH,
  TFT_VSYNC_PULSE,
  TFT_HSYNC_PERIOD,
  TFT_VSYNC_PERIOD : word;
  TFT_PCLK,
  LCD_FPR : longWord;
*)
begin
  (*
  if ScreenInfo = ScreenSize640x480x16 then
  begin
    TFT_HSYNC_BACK_PORCH := 56;
  	TFT_HSYNC_FRONT_PORCH := 8;
  	TFT_HSYNC_PULSE := 96;
  	TFT_VSYNC_BACK_PORCH :=	41;
  	TFT_VSYNC_FRONT_PORCH := 2;
  	TFT_VSYNC_PULSE := 2;
  end
  else if ScreenInfo = ScreenSize800x480x16 then
  begin
	  TFT_HSYNC_BACK_PORCH := 30;
	  TFT_HSYNC_FRONT_PORCH := 0;
	  TFT_HSYNC_PULSE := 0;
	  TFT_VSYNC_BACK_PORCH := 10;
	  TFT_VSYNC_FRONT_PORCH := 0;
	  TFT_VSYNC_PULSE := 0;
  end
  else if ScreenInfo = ScreenSize480x272x16 then
  begin
	  TFT_HSYNC_BACK_PORCH := 43;
	  TFT_HSYNC_FRONT_PORCH := 8;
	  TFT_HSYNC_PULSE := 2;
	  TFT_VSYNC_BACK_PORCH := 12;
	  TFT_VSYNC_FRONT_PORCH := 4;
	  TFT_VSYNC_PULSE := 10;
  end;


  TFT_HSYNC_PERIOD := TFT_HSYNC_PULSE + TFT_HSYNC_BACK_PORCH + ScreenInfo.Width + TFT_HSYNC_FRONT_PORCH;
  TFT_VSYNC_PERIOD := TFT_VSYNC_PULSE + TFT_VSYNC_BACK_PORCH + ScreenInfo.Height + TFT_VSYNC_FRONT_PORCH;

  TFT_PCLK := TFT_HSYNC_PERIOD * TFT_VSYNC_PERIOD * TFT_FPS;
  LCD_FPR := TFT_PCLK * 1048576 div 100000000;

  Reset;
  WriteCommand(SSD1963_SOFT_RESET);

  WriteCommand(SSD1963_SET_PLL_MN);
  WriteData(49);  // PLLclk = REFclk * 50 (500MHz)
  WriteData(4);   // SYSclk = PLLclk / 5  (100MHz)
  WriteData(4);   // dummy

  WriteCommand(SSD1963_SET_PLL);
  WriteData($01);
  SystemCore.Delay(10);

  WriteCommand(SSD1963_SET_PLL);
  WriteData($03);

  WriteCommand(SSD1963_SET_LCD_MODE);
  WriteData($0C);
  WriteData($00);
  WriteData((ScreenInfo.Width-1) shr 8);
  WriteData((ScreenInfo.Height-1) and $ff);
  WriteData($00);

  WriteCommand(SSD1963_SET_PIXEL_DATA_INTERFACE);
  WriteData(SSD1963_PDI_16BIT565);

  WriteCommand(SSD1963_SET_LSHIFT_FREQ);
  WriteData((LCD_FPR shr 16));
  WriteData((LCD_FPR shr  8) and $FF);
  WriteData(LCD_FPR and $FF);

  WriteCommand(SSD1963_SET_HORI_PERIOD);
  WriteData(TFT_HSYNC_PERIOD shr 8);
  WriteData(TFT_HSYNC_PERIOD and $FF);
  WriteData((TFT_HSYNC_PULSE + TFT_HSYNC_BACK_PORCH) shr 8);
  WriteData((TFT_HSYNC_PULSE + TFT_HSYNC_BACK_PORCH) and $FF);
  WriteData(TFT_HSYNC_PULSE);
  WriteData($00);
  WriteData($00);
  WriteData($00);

  WriteCommand(SSD1963_SET_VERT_PERIOD);
  WriteData(TFT_VSYNC_PERIOD shr 8);
  WriteData(TFT_VSYNC_PERIOD and $FF);
  WriteData((TFT_VSYNC_PULSE + TFT_VSYNC_BACK_PORCH) shr 8);
  WriteData((TFT_VSYNC_PULSE + TFT_VSYNC_BACK_PORCH) and $FF);
  WriteData(TFT_VSYNC_PULSE);
  WriteData($00);
  WriteData($00);

  WriteCommand(SSD1963_SET_DISPLAY_ON);    //SET display on
  *)

  WriteCommand($E2);		//PLL multiplier, set PLL clock to 120M
  WriteData($23);	    //N=$36 for 6.5M, $23 for 10M crystal
  WriteData($02);
  WriteData($54);
  WriteCommand($E0);		// PLL enable
  WriteData($01);
  SystemCore.delay(10);
  WriteCommand($E0);
  WriteData($03);
  SystemCore.delay(10);
  WriteCommand($01);		// software reset
  SystemCore.delay(100);
  WriteCommand($E6);		//PLL setting for PCLK, depends on resolution
  WriteData($01);
  WriteData($1F);
  WriteData($FF);

  WriteCommand($B0);		//LCD SPECIFICATION
  WriteData($20);
  WriteData($00);
  WriteData($01);		//Set HDP	479
  WriteData($DF);
  WriteData($01);		//Set VDP	271
  WriteData($0F);
  WriteData($00);

  WriteCommand($B4);		//HSYNC
  WriteData($02);		//Set HT	531
  WriteData($13);
  WriteData($00);		//Set HPS	8
  WriteData($08);
  WriteData($2B);		//Set HPW	43
  WriteData($00);		//Set LPS	2
  WriteData($02);
  WriteData($00);

  WriteCommand($B6);		//VSYNC
  WriteData($01);		//Set VT	288
  WriteData($20);
  WriteData($00);		//Set VPS	4
  WriteData($04);
  WriteData($0c);		//Set VPW	12
  WriteData($00);		//Set FPS	2
  WriteData($02);

  WriteCommand($BA);
  WriteData($0F);		//GPIO[3:0] out 1

  WriteCommand($B8);
  WriteData($07);	    //GPIO3=input, GPIO[2:0]=output
  WriteData($01);		//GPIO0 normal

  WriteCommand($36);		//rotation
  WriteData($22);

  WriteCommand($F0);		//pixel data interface
  WriteData($03);


  SystemCore.delay(10);

//setXY(0, 0, 479, 271);
  WriteCommand($29);		//display on

  WriteCommand($BE);		//set PWM for B/L
  WriteData($06);
  WriteData($f0);
  WriteData($01);
  WriteData($f0);
  WriteData($00);
  WriteData($00);

  WriteCommand($d0);
  WriteData($0d);

  WriteCommand($2C);

end;

procedure TSSD1963.ClearScreen;
var
  i,j : integer;
  color : word;
  buffer : array[0..63] of word;
begin
  color := ((BackgroundColor shr 19) and %11111) or ((BackgroundColor shr 5) and %11111100000)  or ((BackgroundColor shl 8) and %1111100000000000);
  for i := 0 to 63 do
    buffer[i] := color;
  WriteCommand(SSD1963_ENTER_NORMAL_MODE);
  WriteCommand($36);		//rotation
  WriteData($22);
  WriteCommand(SSD1963_SET_COLUMN_ADDRESS);
  WriteData(0);
  WriteData(0);
  WriteData((ScreenInfo.Width-1) shr 8);
  WriteData((ScreenInfo.Width-1) and $ff);
  WriteCommand(SSD1963_SET_PAGE_ADDRESS);
  WriteData(0);
  WriteData(0);
  WriteData((ScreenInfo.Height-1) shr 8);
  WriteData((ScreenInfo.Height-1) and $ff);
  WriteCommand(SSD1963_WRITE_MEMORY_START);
  for i := 1 to ScreenInfo.Height*ScreenInfo.Width div 64 do
      WriteDataWord(buffer);
end;

procedure TSSD1963.setFont(TheFontInfo : TFontInfo);
begin
  FontInfo := TheFontInfo;
end;

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
function ColorMix(Color1,Color2 : TColor;Percentage : byte) : TColor;
var
  Red,Green,Blue : Byte;
  RedDiff,GreenDiff,BlueDiff : shortInt;
begin
  Red := Color1 and $ff;
  RedDiff := Red - Color2 and $ff;
  Green := (Color1 shr  8) and $ff;
  GreenDiff := Green - (Color2 shr  8) and $ff;
  Blue := (Color1 shr 16) and $ff;
  BlueDiff := Blue - (Color2 shr 16) and $ff;
  Result := Red + RedDiff*Percentage div 100;
  Result := Result + (Green + GreenDiff*Percentage div 100) shl 8;
  Result := Result + (Blue + BlueDiff*Percentage div 100) shl 16;
end;

procedure TSSD1963.CalculateAntialiasColors;
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

procedure TSSD1963.drawText(TheText : String; x,y : longWord);
var
  i,j : integer;
  charstart : integer;
  PixelBudget,fx,fy : longWord;
  PixelBuffer : array of word;
  Pixel : byte;
begin
  SetLength(PixelBuffer,FontInfo.Width*FontInfo.Height);
  CalculateAntialiasColors;
  WriteCommand(SSD1963_SET_ADDRESS_MODE);
  WriteData(%10000010);
  for i := 1 to length(TheText) do
  begin
    charstart := pos(TheText[i],FontInfo.Charmap);
    if charstart > 0 then
    begin
      charstart := (charstart-1) * FontInfo.BytesPerChar;
      for fy := 0 to FontInfo.Height-1 do
      begin
        for fx := 0 to FontInfo.width-1 do
        begin
          pixel := FontInfo.pFontData^[charstart + ((fy*fontInfo.Width+fx) div 4)];
          pixel := (pixel shr ((3-(fx and %11)) * 2)) and %11;
          PixelBuffer[fy*FontInfo.Width+fx] := AntialiasColors[pixel];
        end;
      end;
    end
    else
    begin
      for j := 0 to FontInfo.Width*FontInfo.Height-1 do
        PixelBuffer[j] := BackgroundColor;
    end;
    SetDrawArea(x+(i-1)*fontInfo.Width,y,FontInfo.Width,FontInfo.Height);
    WriteCommand(SSD1963_WRITE_MEMORY_START);
    WriteDataWord(PixelBuffer);
  end;
end;

end.
