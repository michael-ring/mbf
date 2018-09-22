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
  MBF.Displays.CustomDisplay;

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
  SPI.Initialize;

  Display.Initialize(SPI,TArduinopin.D8,TArduinopin.D9,ScreenSize128x64x1);
  Display.Reset;
  Display.InitSequence;
  repeat
    Display.BackgroundColor := clBlack;
    Display.ClearScreen;
    SystemCore.Delay(5000);
    Display.BackgroundColor := clWhite;
    Display.ClearScreen;
    SystemCore.Delay(5000);
  until 1=0
end.
