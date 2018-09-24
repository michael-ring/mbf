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
  HeapMgr,
  MBF.Types,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI,
  MBF.Displays.SSD1306,
  MBF.Displays.CustomDisplay,
  MBF.Fonts.Hack12x16;

var
  Display: TSSD1306;
  i : integer;

begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  SystemCore.GetCPUFrequency;

  // Initialize the GPIO subsystem
  GPIO.Initialize;
  SPI.Initialize(TSPIMOSIPins.D11_SPI,TSPIMISOPINS.D12_SPI,TSPISCLKPINS.D13_SPI,TSPINSSPins.D10_SPI);
  SPI.Frequency:= 8000000;

  Display.Initialize(SPI,TArduinopin.D9,TArduinopin.D8,ScreenSize128x64x1);
  Display.Reset;
  Display.InitSequence;
  repeat
    Display.BackgroundColor := clBlack;
    Display.ClearScreen;

    Display.setDrawArea(0,0,8,16);
    Display.writeData([%11110000,
                       %11111000,
                       %10001100,
                       %10000100,
                       %10001100,
                       %11111000,
                       %11110000,
                       %00000000,
                       %00001111,
                       %00001111,
                       %00000000,
                       %00000000,
                       %00000000,
                       %00001111,
                       %00001111,
                       %00000000
    ]);

    Display.setDrawArea(8,0,8,16);
    Display.writeData([%00000100,
                       %11111100,
                       %11111100,
                       %01000100,
                       %01100100,
                       %11111100,
                       %10111000,
                       %00000000,
                       %00001000,
                       %00001111,
                       %00001111,
                       %00001000,
                       %00001000,
                       %00001111,
                       %00000111,
                       %00000000
    ]);

    SystemCore.Delay(5000);

  until 1=0
end.
