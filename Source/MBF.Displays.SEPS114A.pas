unit MBF.Displays.SEPS114A;
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
  ScreenSize96x96x16: TScreenInfo =
    (Width: 96; Height: 96; Depth: TDisplayBitDepth.SixteenBits);

type
  TSEPS114A = object(TCustomSPIDisplay)
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
  CMD_SOFT_RESET             = $01;
  CMD_DISPLAY_ON_OFF         = $02;
  CMD_DDRAM_DATA_ACCESS_PORT = $08;
  CMD_ROW_SCAN_DIRECTION     = $09;
  CMD_CPU_IF                 = $0D;
  CMD_ANALOG_CONTROL         = $0F;
  CMD_ROW_SCAN_MODE          = $13;
  CMD_STANDBY_ON_OFF         = $14;
  CMD_PEAK_PULSE_DELAY       = $16;
  CMD_ROW_SCAN_ON_OFF        = $17;
  CMD_DISCHARGE_TIME         = $18;
  CMD_OSC_ADJUST             = $1A;
  CMD_MEMORY_WRITE_READ      = $1D;
  CMD_DISPLAY_X1             = $30;
  CMD_DISPLAY_X2             = $31;
  CMD_DISPLAY_Y1             = $32;
  CMD_DISPLAY_Y2             = $33;
  CMD_MEM_X1                 = $34;
  CMD_MEM_X2                 = $35;
  CMD_MEM_Y1                 = $36;
  CMD_MEM_Y2                 = $37;
  CMD_DISPLAYSTART_X         = $38;
  CMD_DISPLAYSTART_Y         = $39;
  CMD_PEAK_PULSE_WIDTH_R     = $3A;
  CMD_PEAK_PULSE_WIDTH_G     = $3B;
  CMD_PEAK_PULSE_WIDTH_B     = $3C;
  CMD_PRECHARGE_CURRENT_R    = $3D;
  CMD_PRECHARGE_CURRENT_G    = $3E;
  CMD_PRECHARGE_CURRENT_B    = $3F;
  CMD_COLUMN_CURRENT_R       = $40;
  CMD_COLUMN_CURRENT_G       = $41;
  CMD_COLUMN_CURRENT_B       = $42;
  CMD_ROW_OVERLAP            = $48;
  CMD_SCAN_OFF_LEVEL         = $49;
  CMD_SCREEN_SAVER_CONTROL   = $D0;
  CMD_SS_SLEEP_TIMER         = $D1;
  CMD_SCREEN_SAVER_MODE      = $D2;
  CMD_SS_UPDATE_TIMER        = $D3;
  CMD_RGB_IF                 = $E0;
  CMD_RGB_POL                = $E1;
  CMD_DISPLAY_MODE_CONTROL   = $E5;
var
  FontInfo : TFontInfo;

procedure TSEPS114A.InitSequence;
begin
  beginTransaction;
  //  Soft reset
  writeCommand2(CMD_SOFT_RESET,$00);
  // Standby ON/OFF
  writeCommand2(CMD_STANDBY_ON_OFF,$01);          // Standby on
  SystemCore.Delay(25);                                   // Wait for 5ms (1ms Delay Minimum)
  writeCommand2(CMD_STANDBY_ON_OFF,$00);          // Standby off
  SystemCore.Delay(25);                                   // 1ms Delay Minimum (1ms Delay Minimum)
  // Display OFF
  writeCommand2(CMD_DISPLAY_ON_OFF,$00);
  // Set Oscillator operation
  writeCommand2(CMD_ANALOG_CONTROL,$00);          // using external resistor and internal OSC
  // Set frame rate
  writeCommand2(CMD_OSC_ADJUST,$03);              // frame rate : 95Hz
  // Set active display area of panel
  writeCommand2(CMD_DISPLAY_X1,$00);
  writeCommand2(CMD_DISPLAY_X2,ScreenInfo.Width);
  writeCommand2(CMD_DISPLAY_Y1,$00);
  writeCommand2(CMD_DISPLAY_Y2,ScreenInfo.Height);
  // Select the RGB data format and set the initial state of RGB interface port */
  writeCommand2(CMD_RGB_IF,$00);                  // RGB 8bit interface
  // Set RGB polarity */
  writeCommand2(CMD_RGB_POL,$00);
  // Set display mode control */
  writeCommand2(CMD_DISPLAY_MODE_CONTROL,$80);    // SWAP:BGR, Reduce current : Normal, DC[1:0] : Normal
  // Set MCU Interface */
  writeCommand2(CMD_CPU_IF,$00);                  // MPU External interface mode, 8bits
  // Set Memory Read/Write mode */
  writeCommand2(CMD_MEMORY_WRITE_READ,$00);
  // Set row scan direction */
  writeCommand2(CMD_ROW_SCAN_DIRECTION,$00);      // Column : 0 --> Max, Row : 0 Å--> Max
  // Set row scan mode */
  writeCommand2(CMD_ROW_SCAN_MODE,$00);           // Alternate scan mode
  // Set column current */
  writeCommand2(CMD_COLUMN_CURRENT_R,$6E);
  writeCommand2(CMD_COLUMN_CURRENT_G,$4F);
  writeCommand2(CMD_COLUMN_CURRENT_B,$77);
  // Set row overlap */
  writeCommand2(CMD_ROW_OVERLAP,$00);             // Band gap only
  // Set discharge time */
  writeCommand2(CMD_DISCHARGE_TIME,$01);          // Discharge time : normal discharge
  // Set peak pulse delay */
  writeCommand2(CMD_PEAK_PULSE_DELAY,$00);
  // Set peak pulse width */
  writeCommand2(CMD_PEAK_PULSE_WIDTH_R,$02);
  writeCommand2(CMD_PEAK_PULSE_WIDTH_G,$02);
  writeCommand2(CMD_PEAK_PULSE_WIDTH_B,$02);
  // Set precharge current */
  writeCommand2(CMD_PRECHARGE_CURRENT_R,$14);
  writeCommand2(CMD_PRECHARGE_CURRENT_G,$50);
  writeCommand2(CMD_PRECHARGE_CURRENT_B,$19);
  // Set row scan on/off  */
  writeCommand2(CMD_ROW_SCAN_ON_OFF,$00);         // Normal row scan
  // Set scan off level */
  writeCommand2(CMD_SCAN_OFF_LEVEL,$04);          // VCC_C*0.75
  // Set memory access point */
  writeCommand2(CMD_DISPLAYSTART_X,$00);
  writeCommand2(CMD_DISPLAYSTART_Y,$00);
  // Display ON */
  writeCommand2(CMD_DISPLAY_ON_OFF,$01);

  writeCommand2(CMD_ROW_SCAN_DIRECTION,%11);
  endTransaction;
end;

procedure TSEPS114A.clearScreen;
var
  i : integer;
  buffer : array[0..15] of word;
begin
  beginTransaction;
  setDrawArea(0,0,ScreenInfo.Width,ScreenInfo.Height);
  for i := low(buffer) to high(buffer) do
      buffer[i] := FNativeBackgroundColor;
  //Increase Performance by writing larger chunks of data
  for i := 1 to (ScreenInfo.Width*ScreenInfo.Height) div length(buffer) do
    writeData(buffer,length(Buffer));
  endTransaction;
end;

procedure TSEPS114A.setFont(TheFontInfo : TFontInfo);
begin
  FontInfo := TheFontInfo;
end;

function TSEPS114A.setDrawArea(X,Y,Width,Height : word):longWord;
begin
  Result := 0;
  if (X >=ScreenInfo.Width) or (Y >=ScreenInfo.Height) then
    exit;

  if X+Width >ScreenInfo.Width then
    Width := ScreenInfo.Width-X;
  if Y+Height >ScreenInfo.Height then
    Height := ScreenInfo.Height-Y;

  beginTransaction;

  writeCommand2(CMD_MEM_X1,X);
  {$PUSH}
  {$WARN 4079 off : Converting the operands to "$1" before doing the add could prevent overflow errors.}
  writeCommand2(CMD_MEM_X2,X+Width-1);
  writeCommand2(CMD_MEM_Y1,Y);
  writeCommand2(CMD_MEM_Y2,Y+Height-1);
  {$POP}
  writeCommand2(CMD_DDRAM_DATA_ACCESS_PORT);
  Result := Width*Height;
end;

procedure TSEPS114A.drawText(TheText : String; x,y : longWord);
var
  i,j : longword;
  charstart,pixelPos : longWord;
  fx,fy : longWord;
  PixelBuffer : array of word;
  divFactor,pixel,pixels : byte;
  AntialiasColors : array[0..3] of word;
begin
  {$PUSH}
  {$WARN 5091 off : Local variable "$1" of a managed type does not seem to be initialized}
  SetLength(PixelBuffer,FontInfo.Width*FontInfo.Height);
  {$POP}
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
          {$PUSH}
          {$WARN 4035 off : Mixing signed expressions and longwords gives a 64bit result}
          {$WARN 4081 off : Converting the operands to "$1" before doing the multiply could prevent overflow errors.}
          pixelPos := charStart * fontInfo.BytesPerChar+fy*(fontInfo.BytesPerChar div fontInfo.Height);
          {$POP}
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
                PixelBuffer[fy*FontInfo.Width+fx] := word(FNativeBackgroundColor)
              else
                PixelBuffer[fy*FontInfo.Width+fx] := word(FNativeForegroundColor)
            end;
          end;
        end;
      end
      else
      begin
        {$PUSH}
        {$WARN 4081 off : Converting the operands to "$1" before doing the multiply could prevent overflow errors.}
        for j := 0 to FontInfo.Width*FontInfo.Height-1 do
          PixelBuffer[j] := word(FNativeBackgroundColor);
        {$POP}
      end;
      SetDrawArea(x+(i-1)*fontInfo.Width,y,FontInfo.Width,FontInfo.Height);
      WriteData(PixelBuffer,length(PixelBuffer));
    end;
  end;
  endTransaction;
end;

end.
