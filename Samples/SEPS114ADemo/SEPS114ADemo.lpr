program SEPS114ADemo;
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

uses
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI;

const
  SEPS114A_SOFT_RESET             = $01;
  SEPS114A_DISPLAY_ON_OFF         = $02;
  SEPS114A_ANALOG_CONTROL         = $0F;
  SEPS114A_STANDBY_ON_OFF         = $14;
  SEPS114A_OSC_ADJUST             = $1A;
  SEPS114A_ROW_SCAN_DIRECTION     = $09;
  SEPS114A_DISPLAY_X1             = $30;
  SEPS114A_DISPLAY_X2             = $31;
  SEPS114A_DISPLAY_Y1             = $32;
  SEPS114A_DISPLAY_Y2             = $33;
  SEPS114A_DISPLAYSTART_X         = $38;
  SEPS114A_DISPLAYSTART_Y         = $39;
  SEPS114A_CPU_IF                 = $0D;
  SEPS114A_MEM_X1                 = $34;
  SEPS114A_MEM_X2                 = $35;
  SEPS114A_MEM_Y1                 = $36;
  SEPS114A_MEM_Y2                 = $37;
  SEPS114A_MEMORY_WRITE_READ      = $1D;
  SEPS114A_DDRAM_DATA_ACCESS_PORT = $08;
  SEPS114A_DISCHARGE_TIME         = $18;
  SEPS114A_PEAK_PULSE_DELAY       = $16;
  SEPS114A_PEAK_PULSE_WIDTH_R     = $3A;
  SEPS114A_PEAK_PULSE_WIDTH_G     = $3B;
  SEPS114A_PEAK_PULSE_WIDTH_B     = $3C;
  SEPS114A_PRECHARGE_CURRENT_R    = $3D;
  SEPS114A_PRECHARGE_CURRENT_G    = $3E;
  SEPS114A_PRECHARGE_CURRENT_B    = $3F;
  SEPS114A_COLUMN_CURRENT_R       = $40;
  SEPS114A_COLUMN_CURRENT_G       = $41;
  SEPS114A_COLUMN_CURRENT_B       = $42;
  SEPS114A_ROW_OVERLAP            = $48;
  SEPS114A_SCAN_OFF_LEVEL         = $49;
  SEPS114A_ROW_SCAN_ON_OFF        = $17;
  SEPS114A_ROW_SCAN_MODE          = $13;
  SEPS114A_SCREEN_SAVER_CONTROL   = $D0;
  SEPS114A_SS_SLEEP_TIMER         = $D1;
  SEPS114A_SCREEN_SAVER_MODE      = $D2;
  SEPS114A_SS_UPDATE_TIMER        = $D3;
  SEPS114A_RGB_IF                 = $E0;
  SEPS114A_RGB_POL                = $E1;
  SEPS114A_DISPLAY_MODE_CONTROL   = $E5;

  RST = TArduinoPin.A3;      // RST pin
  DC  = TArduinoPin.D6;      // DC pin
  RW  = TArduinoPin.A0;      // R/W pin


  font8x8 : array[32..126] of array[0..7] of byte = (
  ($00,$00,$00,$00,$00,$00,$00,$00),  // SPACE
  ($00,$00,$00,$4f,$4f,$00,$00,$00),  // !
  ($00,$07,$07,$00,$00,$07,$07,$00),  // "
  ($14,$7f,$7f,$14,$14,$7f,$7f,$14),  // #
  ($00,$24,$2e,$6b,$6b,$3a,$12,$00),  // $
  ($00,$63,$33,$18,$0c,$66,$63,$00),  // %
  ($00,$32,$7f,$4d,$4d,$77,$72,$50),  // &
  ($00,$00,$00,$07,$07,$00,$00,$00),  // '
  ($00,$00,$1c,$3e,$63,$41,$00,$00),  // (
  ($00,$00,$41,$63,$3e,$1c,$00,$00),  // )
  ($08,$2a,$3e,$1c,$1c,$3e,$2a,$08),  // *
  ($00,$08,$08,$3e,$3e,$08,$08,$00),  // +
  ($00,$00,$80,$e0,$60,$00,$00,$00),  // ,
  ($00,$08,$08,$08,$08,$08,$08,$00),  // -
  ($00,$00,$00,$60,$60,$00,$00,$00),  // .
  ($00,$40,$60,$30,$18,$0c,$06,$02),  // /
  ($00,$3e,$7f,$49,$45,$7f,$3e,$00),  // 0
  ($00,$40,$44,$7f,$7f,$40,$40,$00),  // 1
  ($00,$62,$73,$51,$49,$4f,$46,$00),  // 2
  ($00,$22,$63,$49,$49,$7f,$36,$00),  // 3
  ($00,$18,$18,$14,$16,$7f,$7f,$10),  // 4
  ($00,$27,$67,$45,$45,$7d,$39,$00),  // 5
  ($00,$3e,$7f,$49,$49,$7b,$32,$00),  // 6
  ($00,$03,$03,$79,$7d,$07,$03,$00),  // 7
  ($00,$36,$7f,$49,$49,$7f,$36,$00),  // 8
  ($00,$26,$6f,$49,$49,$7f,$3e,$00),  // 9
  ($00,$00,$00,$24,$24,$00,$00,$00),  // :
  ($00,$00,$80,$e4,$64,$00,$00,$00),  // ;
  ($00,$08,$1c,$36,$63,$41,$41,$00),  // <
  ($00,$14,$14,$14,$14,$14,$14,$00),  // =
  ($00,$41,$41,$63,$36,$1c,$08,$00),  // >
  ($00,$02,$03,$51,$59,$0f,$06,$00),  // ?
  ($00,$3e,$7f,$41,$4d,$4f,$2e,$00),  // @
  ($00,$7c,$7e,$0b,$0b,$7e,$7c,$00),  // A
  ($00,$7f,$7f,$49,$49,$7f,$36,$00),  // B
  ($00,$3e,$7f,$41,$41,$63,$22,$00),  // C
  ($00,$7f,$7f,$41,$63,$3e,$1c,$00),  // D
  ($00,$7f,$7f,$49,$49,$41,$41,$00),  // E
  ($00,$7f,$7f,$09,$09,$01,$01,$00),  // F
  ($00,$3e,$7f,$41,$49,$7b,$3a,$00),  // G
  ($00,$7f,$7f,$08,$08,$7f,$7f,$00),  // H
  ($00,$00,$41,$7f,$7f,$41,$00,$00),  // I
  ($00,$20,$60,$41,$7f,$3f,$01,$00),  // J
  ($00,$7f,$7f,$1c,$36,$63,$41,$00),  // K
  ($00,$7f,$7f,$40,$40,$40,$40,$00),  // L
  ($00,$7f,$7f,$06,$0c,$06,$7f,$7f),  // M
  ($00,$7f,$7f,$0e,$1c,$7f,$7f,$00),  // N
  ($00,$3e,$7f,$41,$41,$7f,$3e,$00),  // O
  ($00,$7f,$7f,$09,$09,$0f,$06,$00),  // P
  ($00,$1e,$3f,$21,$61,$7f,$5e,$00),  // Q
  ($00,$7f,$7f,$19,$39,$6f,$46,$00),  // R
  ($00,$26,$6f,$49,$49,$7b,$32,$00),  // S
  ($00,$01,$01,$7f,$7f,$01,$01,$00),  // T
  ($00,$3f,$7f,$40,$40,$7f,$3f,$00),  // U
  ($00,$1f,$3f,$60,$60,$3f,$1f,$00),  // V
  ($00,$7f,$7f,$30,$18,$30,$7f,$7f),  // W
  ($00,$63,$77,$1c,$1c,$77,$63,$00),  // X
  ($00,$07,$0f,$78,$78,$0f,$07,$00),  // Y
  ($00,$61,$71,$59,$4d,$47,$43,$00),  // Z
  ($00,$00,$7f,$7f,$41,$41,$00,$00),  // [
  ($00,$02,$06,$0c,$18,$30,$60,$40),  // \
  ($00,$00,$41,$41,$7f,$7f,$00,$00),  // ]
  ($00,$04,$06,$03,$03,$06,$04,$00),  // ^
  ($00,$80,$80,$80,$80,$80,$80,$80),  // _
  ($00,$00,$00,$01,$03,$06,$04,$00),  // `
  ($00,$20,$74,$54,$54,$7c,$78,$00),  // a
  ($00,$7e,$7e,$48,$48,$78,$30,$00),  // b
  ($00,$38,$7c,$44,$44,$44,$00,$00),  // c
  ($00,$30,$78,$48,$48,$7e,$7e,$00),  // d
  ($00,$38,$7c,$54,$54,$5c,$18,$00),  // e
  ($00,$00,$08,$7c,$7e,$0a,$0a,$00),  // f
  ($00,$98,$bc,$a4,$a4,$fc,$7c,$00),  // g
  ($00,$7e,$7e,$08,$08,$78,$70,$00),  // h
  ($00,$00,$48,$7a,$7a,$40,$00,$00),  // i
  ($00,$00,$80,$80,$80,$fa,$7a,$00),  // j
  ($00,$7e,$7e,$10,$38,$68,$40,$00),  // k
  ($00,$00,$42,$7e,$7e,$40,$00,$00),  // l
  ($00,$7c,$7c,$18,$38,$1c,$7c,$78),  // m
  ($00,$7c,$7c,$04,$04,$7c,$78,$00),  // n
  ($00,$38,$7c,$44,$44,$7c,$38,$00),  // o
  ($00,$fc,$fc,$24,$24,$3c,$18,$00),  // p
  ($00,$18,$3c,$24,$24,$fc,$fc,$00),  // q
  ($00,$7c,$7c,$04,$04,$0c,$08,$00),  // r
  ($00,$48,$5c,$54,$54,$74,$24,$00),  // s
  ($00,$04,$04,$3e,$7e,$44,$44,$00),  // t
  ($00,$3c,$7c,$40,$40,$7c,$7c,$00),  // u
  ($00,$1c,$3c,$60,$60,$3c,$1c,$00),  // v
  ($00,$1c,$7c,$70,$38,$70,$7c,$1c),  // w
  ($00,$44,$6c,$38,$38,$6c,$44,$00),  // x
  ($00,$9c,$bc,$a0,$e0,$7c,$3c,$00),  // y
  ($00,$44,$64,$74,$5c,$4c,$44,$00),  // z
  ($00,$00,$08,$3e,$77,$41,$00,$00),  // (
  ($00,$00,$00,$7f,$7f,$00,$00,$00),  // |
  ($00,$00,$41,$77,$3e,$08,$00,$00),  // )
  ($00,$08,$04,$0c,$18,$01,$08,$00)   // ~
);
// END OF CHARSET
var
  FGColor : word = $0000;
  BGColor : word = $ffff;

//Send command to OLED C display
procedure OLED_C_command(const reg_index : byte; const reg_value : byte);
begin
  //Select index addr
  GPIO.SetPinLevelLow(DC);
  SPI.WriteWord(reg_index);
  //Write data to reg
  GPIO.SetPinLevelHigh(DC);
  SPI.WriteWord(reg_value);
end;

//Send data to OLED C display
procedure OLED_C_data(const data_value : byte);
begin
  GPIO.SetPinLevelHigh(DC);
  SPI.WriteWord(data_value);
end;

//Send 16 bit data to OLED C display
procedure OLED_C_data16(const data_value : word);
begin
  GPIO.SetPinLevelHigh(DC);
  SPI.WriteWord(data_value shr 8);
  SPI.WriteWord(data_value and $ff);
end;

//Sekvence before writing data to memory
procedure DDRAM_access;
begin
  GPIO.SetPinLevelLow(DC);
  SPI.WriteWord($08);
end;

// Init sequence for 96x96 OLED color module
procedure OLED_C_Init();
begin
  GPIO.SetPinLevelLow(RST);
  SystemCore.Delay(10);
  GPIO.SetPinLevelHigh(RST);
  SystemCore.Delay(10);
  //  Soft reset
  OLED_C_command(SEPS114A_SOFT_RESET,$00);
  // Standby ON/OFF
  OLED_C_command(SEPS114A_STANDBY_ON_OFF,$01);          // Standby on
  SystemCore.Delay(5);                                   // Wait for 5ms (1ms Delay Minimum)
  OLED_C_command(SEPS114A_STANDBY_ON_OFF,$00);          // Standby off
  SystemCore.Delay(5);                                   // 1ms Delay Minimum (1ms Delay Minimum)
  // Display OFF
  OLED_C_command(SEPS114A_DISPLAY_ON_OFF,$00);
  // Set Oscillator operation
  OLED_C_command(SEPS114A_ANALOG_CONTROL,$00);          // using external resistor and internal OSC
  // Set frame rate
  OLED_C_command(SEPS114A_OSC_ADJUST,$03);              // frame rate : 95Hz
  // Set active display area of panel
  OLED_C_command(SEPS114A_DISPLAY_X1,$00);
  OLED_C_command(SEPS114A_DISPLAY_X2,$5F);
  OLED_C_command(SEPS114A_DISPLAY_Y1,$00);
  OLED_C_command(SEPS114A_DISPLAY_Y2,$5F);
  // Select the RGB data format and set the initial state of RGB interface port */
  OLED_C_command(SEPS114A_RGB_IF,$00);                  // RGB 8bit interface
  // Set RGB polarity */
  OLED_C_command(SEPS114A_RGB_POL,$00);
  // Set display mode control */
  OLED_C_command(SEPS114A_DISPLAY_MODE_CONTROL,$80);    // SWAP:BGR, Reduce current : Normal, DC[1:0] : Normal
  // Set MCU Interface */
  OLED_C_command(SEPS114A_CPU_IF,$00);                  // MPU External interface mode, 8bits
  // Set Memory Read/Write mode */
  OLED_C_command(SEPS114A_MEMORY_WRITE_READ,$00);
  // Set row scan direction */
  OLED_C_command(SEPS114A_ROW_SCAN_DIRECTION,$00);      // Column : 0 --> Max, Row : 0 Å--> Max
  // Set row scan mode */
  OLED_C_command(SEPS114A_ROW_SCAN_MODE,$00);           // Alternate scan mode
  // Set column current */
  OLED_C_command(SEPS114A_COLUMN_CURRENT_R,$6E);
  OLED_C_command(SEPS114A_COLUMN_CURRENT_G,$4F);
  OLED_C_command(SEPS114A_COLUMN_CURRENT_B,$77);
  // Set row overlap */
  OLED_C_command(SEPS114A_ROW_OVERLAP,$00);             // Band gap only
  // Set discharge time */
  OLED_C_command(SEPS114A_DISCHARGE_TIME,$01);          // Discharge time : normal discharge
  // Set peak pulse delay */
  OLED_C_command(SEPS114A_PEAK_PULSE_DELAY,$00);
  // Set peak pulse width */
  OLED_C_command(SEPS114A_PEAK_PULSE_WIDTH_R,$02);
  OLED_C_command(SEPS114A_PEAK_PULSE_WIDTH_G,$02);
  OLED_C_command(SEPS114A_PEAK_PULSE_WIDTH_B,$02);
  // Set precharge current */
  OLED_C_command(SEPS114A_PRECHARGE_CURRENT_R,$14);
  OLED_C_command(SEPS114A_PRECHARGE_CURRENT_G,$50);
  OLED_C_command(SEPS114A_PRECHARGE_CURRENT_B,$19);
  // Set row scan on/off  */
  OLED_C_command(SEPS114A_ROW_SCAN_ON_OFF,$00);         // Normal row scan
  // Set scan off level */
  OLED_C_command(SEPS114A_SCAN_OFF_LEVEL,$04);          // VCC_C*0.75
  // Set memory access point */
  OLED_C_command(SEPS114A_DISPLAYSTART_X,$00);
  OLED_C_command(SEPS114A_DISPLAYSTART_Y,$00);
  // Display ON */
  OLED_C_command(SEPS114A_DISPLAY_ON_OFF,$01);
end;

//Set memory area(address) to write a display data
procedure OLED_C_MemorySize(const X1,X2,Y1,Y2 : byte);
begin
  OLED_C_command(SEPS114A_MEM_X1,X1);
  OLED_C_command(SEPS114A_MEM_X2,X2);
  OLED_C_command(SEPS114A_MEM_Y1,Y1);
  OLED_C_command(SEPS114A_MEM_Y2,Y2);
end;

//Select color
procedure OLED_C_Color(const color : word);
begin
    OLED_C_data16(color);
end;

procedure CLS;
var
  i : longWord;
begin
  OLED_C_MemorySize($00,$5F,$00,$5F);
  DDRAM_access();
  for i:=0 to 9216 do
  begin
    OLED_C_Color(BGColor);
  end;
end;

procedure HLine(X,Y,Length : byte);
var
  i : byte;
begin
  OLED_C_MemorySize(X,X+Length-1,Y,Y);
  DDRAM_access();
  for i := 1 to length do
    OLED_C_Color(FGColor);
end;

procedure VLine(X,Y,Length : byte);
var
  i : byte;
begin
  OLED_C_MemorySize(X,X,Y,Y+Length-1);
  DDRAM_access();
  for i := 1 to length do
    OLED_C_Color(FGColor);
end;

procedure WriteAt(const Text : String;const X,Y : byte);
var
  i,j,k,line : byte;
begin
  OLED_C_MemorySize(X,X+8*Length(Text),Y,Y+7);
  DDRAM_access();
  for i := 1 to length(text) do
  begin
    for j := 0 to 7 do
    begin
      Line := font8x8[ord(text[i])][j];
      for k := 0 to 7 do
      begin
        if line and (1 shl k) = 0 then
          OLED_C_Color(BGColor)
        else
          OLED_C_Color(FGColor);
      end;
    end;
  end;
end;

var
  i : longWord;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  GPIO.PinMode[RST] := TPinMode.Output;
  GPIO.PinMode[DC]  := TPinMode.Output;
  GPIO.PinMode[RW]  := TPinMode.Output;

  // Initialize the SPI subsystem
  SPI.Initialize;

  SPI.MosiPin  := TSPIMosiPins.D11_SPI;
  SPI.MisoPin  := TSPIMisoPins.D12_SPI;
  SPI.SCLKPin := TSPISCLKPins.D13_SPI;
  SPI.NSSPin  := TSPINSSPins.D10_SPI;

  GPIO.setPinLevelLow(RW);
  //Delay_ms(100);
  OLED_C_Init;
  // 0,0 is on top left
  OLED_C_command(SEPS114A_ROW_SCAN_DIRECTION,%11);
  OLED_C_command(SEPS114A_MEMORY_WRITE_READ,%100);
  FGColor := %1111100000000000;
  FGColor := %0000011111100000;
  FGColor := %0000000000011111;
  while true do
  begin
    CLS;
    HLine(0,95,50);
    VLine(0,0,96);
    writeAt('Hello00',0,0);
    writeAt('Hello30',30,30);
    writeAt('Hello40',40,40);
    SystemCore.Delay(5000);
  end;
end.
