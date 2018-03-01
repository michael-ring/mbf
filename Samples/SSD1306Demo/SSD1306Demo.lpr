program SSD1306Demo;
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
//  MBF.Displays.SSD1306;
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

  SSD1306_SETCONTRAST = $81;
  SSD1306_DISPLAYALLON_RESUME = $A4;
  SSD1306_DISPLAYALLON = $A5;
  SSD1306_NORMALDISPLAY = $A6;
  SSD1306_INVERTDISPLAY = $A7;
  SSD1306_DISPLAYOFF = $AE;
  SSD1306_DISPLAYON = $AF;

  SSD1306_SETDISPLAYOFFSET = $D3;
  SSD1306_SETCOMPINS = $DA;

  SSD1306_SETVCOMDETECT = $DB;

  SSD1306_SETDISPLAYCLOCKDIV = $D5;
  SSD1306_SETPRECHARGE = $D9;

  SSD1306_SETMULTIPLEX = $A8;

  SSD1306_SETLOWCOLUMN = $00;
  SSD1306_SETHIGHCOLUMN = $10;

  SSD1306_SETSTARTLINE = $40;

  SSD1306_MEMORYMODE = $20;
  SSD1306_COLUMNADDR = $21;
  SSD1306_PAGEADDR   = $22;

  SSD1306_COMSCANINC = $C0;
  SSD1306_COMSCANDEC = $C8;

  SSD1306_SEGREMAP = $A0;

  SSD1306_CHARGEPUMP = $8D;

  SSD1306_EXTERNALVCC = $01;
  SSD1306_SWITCHCAPVCC = $02;

// Scrolling #defines
  SSD1306_ACTIVATE_SCROLL = $2F;
  SSD1306_DEACTIVATE_SCROLL = $2E;
  SSD1306_SET_VERTICAL_SCROLL_AREA = $A3;
  SSD1306_RIGHT_HORIZONTAL_SCROLL = $26;
  SSD1306_LEFT_HORIZONTAL_SCROLL = $27;
  SSD1306_VERTICAL_AND_RIGHT_HORIZONTAL_SCROLL = $29;
  SSD1306_VERTICAL_AND_LEFT_HORIZONTAL_SCROLL = $2A;


type
  TPoint2px = record
    { The coordinate in 2D space. }
    X, Y: longWord;
  end;
operator = (a,b:TPoint2px) : boolean;
begin
  Result := (a.X = b.X) and (a.Y = b.Y);
end;

const
  OLED128x64: TPoint2px = (X: 128; Y: 64);
  OLED128x32: TPoint2px = (X: 128; Y: 32);
  OLED96x16: TPoint2px = (X: 96; Y: 16);
  OLED64x48: TPoint2px = (X: 64; Y: 48);

type TCustomDisplay = object
  private
    FScreenSize : TPoint2px;
    FInternalVCC : boolean;
    FpSPI : ^TSPI_Registers;
    FPinDC : TPinIdentifier;
    FPinRST : TPinIdentifier;
    procedure WriteCommand(const value : byte);
    procedure WriteCommand(const Values: array of Byte);
    procedure WriteData(const value : byte);
    procedure WriteData(const Values: array of Byte);
    procedure setPinDC(const Value : TPinIdentifier);
    procedure setPinRST(const Value : TPinIdentifier);
  public
    procedure Initialize(var SPI : TSpi_Registers);
    procedure Initialize(var SPI : TSpi_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier);
    procedure Reset;
    procedure InitSequence;
    property PinDC : TPinIdentifier read FPinDC write setPinDC;
    property PinRST : TPinIdentifier read FPinRST write setPinRST;
end;

procedure TCustomDisplay.Initialize(var SPI : TSpi_Registers);
begin
  FpSPI := @SPI;
  FPinDC := TNativePin.NONE;
  FPinRST := TNativePin.NONE;
  FScreenSize :=  OLED128x32;
  FInternalVCC := true;
end;

procedure TCustomDisplay.Initialize(var SPI : TSpi_Registers;const APinDC : TPinIdentifier;const APinRST : TPinIdentifier);
begin
  FpSPI := @SPI;
  FPinDC := APinDC;
  FPinRST := APinRST;
  FScreenSize :=  OLED128x32;
  FInternalVCC := false;
end;

procedure TCustomDisplay.Reset;
begin
  if FPinRST <> TNativePin.None then
  begin
    GPIO.PinLevel[FPinRST] := TPinLevel.High;
    SystemCore.Delay(5);
    GPIO.PinLevel[FPinRST] := TPinLevel.Low;
    SystemCore.Delay(10);
    GPIO.PinLevel[FPinRST] := TPinLevel.High;
  end;
end;

procedure TCustomDisplay.InitSequence;
begin
  WriteCommand(CMD_DISPLAY_OFF);
  SystemCore.Delay(5);

  WriteCommand([CMD_SET_DISPLAY_CLOCK_DIV, $80, CMD_SET_MULTIPLEX]);

  if FScreenSize = OLED128x32 then
    WriteCommand($1F)
  else if FScreenSize = OLED96x16 then
    WriteCommand($0F)
  else if FScreenSize = OLED64x48 then
    WriteCommand($2F)
  else
    WriteCommand($3F);

  WriteCommand([CMD_SET_DISPLAY_OFFSET, $00, CMD_SET_START_LINE or $00, CMD_CHARGE_PUMP]);

  if FInternalVCC then
    WriteCommand($14)
  else
    WriteCommand($10);

  WriteCommand([CMD_MEMORY_MODE, $00, CMD_SEGMENT_REMAP or $01, CMD_COM_SCAN_DEC, CMD_SET_COM_PINS]);

  if (FScreenSize = OLED128x32) or (FScreenSize = OLED96x16) then
    WriteCommand($02)
  else
    WriteCommand($12);

  WriteCommand(CMD_SET_CONTRAST);

  if (FScreenSize = OLED128x32) or (FScreenSize = OLED64x48) then
    WriteCommand($8F)
  else if FScreenSize = OLED96x16 then
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
  WriteCommand(CMD_SET_PRECHARGE);

  if FInternalVCC then
    WriteCommand($F1)
  else
    WriteCommand($22);

  WriteCommand([CMD_SET_VCOM_DETECT, $40, CMD_DISPLAY_ALL_ON_RESUME, CMD_NORMAL_DISPLAY]);
  SystemCore.Delay(5);
  WriteCommand(CMD_DISPLAY_ON);
end;

procedure TCustomDisplay.WriteCommand(const Value: Byte);
begin
  GPIO.PinLevel[FPinDC] := TPinLevel.Low;
  FpSPI^.Write(@Value, 1);
end;

procedure TCustomDisplay.WriteCommand(const Values: array of Byte);
begin
  GPIO.PinLevel[FPinDC] := TPinLevel.Low;
  if Length(Values) > 0 then
    FpSPI^.Write(@Values[0], Length(Values));
end;

procedure TCustomDisplay.WriteData(const Value: Byte);
begin
  GPIO.PinLevel[FPinDC] := TPinLevel.High;
  FpSPI^.Write(@Value, 1);
end;

procedure TCustomDisplay.WriteData(const Values: array of Byte);
begin
  GPIO.PinLevel[FPinDC] := TPinLevel.High;
  if Length(Values) > 0 then
    FpSPI^.Write(@Values[0], Length(Values));
end;

procedure TCustomDisplay.setPinDC(const Value : TPinIdentifier);
begin
  FPinDC := Value;
end;

procedure TCustomDisplay.setPinRST(const Value : TPinIdentifier);
begin
  FPinRST := Value;
end;
var
  Display : TCustomDisplay;
  i : longInt;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // D/C Data / Command select
  GPIO.PinMode[TArduinoPin.D9] := TPinMode.Output;

  // Reset Pin
  GPIO.PinMode[TArduinoPin.D8] := TPinMode.Output;

  SPI.Initialize;
  SPI.Frequency := 4000000;
  SPI.NSSPin  := TSPINSSPins.D10_SPI;
  SPI.MosiPin := TSPIMosiPins.D11_SPI;
  SPI.MisoPin := TSPIMisoPins.D12_SPI;
  SPI.SCLKPin := TSPISCLKPins.D13_SPI;

  Display.Initialize(SPI);
  Display.PinDC := TArduinoPin.D9;
  Display.PinRST := TArduinoPin.D8;
  Display.Reset;
  Display.InitSequence;
  for i := 0 to Display.FScreenSize.X * Display.FScreenSize.Y div 8 do
    Display.WriteData($00);

  repeat
    //Display.WriteCommand(SSD1306_SETLOWCOLUMN+0);
    //Display.WriteCommand(SSD1306_SETHIGHCOLUMN+0);
    //Display.WriteCommand(SSD1306_SETSTARTLINE or $00);
    Display.WriteCommand([SSD1306_COLUMNADDR,0,Display.FScreenSize.X-1]);
    Display.WriteCommand([SSD1306_PAGEADDR,0,(Display.FScreenSize.Y div 8) -1 ]);
    for i := 0 to 127 do
      Display.WriteData($01);
    //Display.WriteCommand(SSD1306_SETSTARTLINE or $08);
    Display.WriteCommand([SSD1306_COLUMNADDR,0,Display.FScreenSize.X-1]);
    Display.WriteCommand([SSD1306_PAGEADDR,0,(Display.FScreenSize.Y div 8) -1 ]);
    for i := 0 to 127 do
      Display.WriteData($01);
    //Display.WriteCommand(SSD1306_SETSTARTLINE or $10);
    Display.WriteCommand([SSD1306_COLUMNADDR,0,Display.FScreenSize.X-1]);
    Display.WriteCommand([SSD1306_PAGEADDR,0,(Display.FScreenSize.Y div 8) -1 ]);
    for i := 0 to 127 do
      Display.WriteData($01);
    //Display.WriteCommand(SSD1306_SETSTARTLINE or $10);
    Display.WriteCommand([SSD1306_COLUMNADDR,0,Display.FScreenSize.X-1]);
    Display.WriteCommand([SSD1306_PAGEADDR,0,(Display.FScreenSize.Y div 8) -1 ]);
    for i := 0 to 127 do
      Display.WriteData($01);
  until 1=0;
end.
