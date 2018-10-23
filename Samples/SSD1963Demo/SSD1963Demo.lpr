program SSD1963Demo;
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

{< Demo program for GPIO functionalities. }

{$INCLUDE MBF.Config.inc}

uses
  HeapMgr,
  MBF.Types,
  MBF.Fonts.DroidSansMono36x48_antialiased,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.Displays.SSD1963,
  MBF.Displays.CustomDisplay;

var
  Display : TSSD1963;
  i : integer;

begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  SystemCore.GetCPUFrequency;
  //SystemCore.DisableJTAGInterface;

  GPIO.Initialize;
  GPIOC.Initialize;

  Display.Initialize(GPIOC,TArduinoPin.D3,TArduinoPin.D4,TArduinoPin.D5,TArduinoPin.D6,TArduinoPin.D7,
                     ScreenSize480x272x16);
  Display.Reset;
  Display.InitSequence;
  Display.SetFont(DroidSansMono36x48_antialiased);
  repeat
    Display.BackgroundColor := clBlack;
    Display.ClearScreen;
    Display.ForegroundColor := clWhite;
    Display.DrawText('X:a+234.56mm',10,10+68*3);
    Display.ForegroundColor := clRed;
    Display.DrawText('Y:a+890.12mm',10,10+68*2);
    Display.ForegroundColor := clGreen;
    Display.DrawText('Z:a+456.78mm',10,10+68);
    Display.ForegroundColor := clBlue;
    Display.DrawText('Z:a+456.78mm',10,10);
    SystemCore.Delay(5000);

    Display.BackgroundColor := clWhite;
    Display.ClearScreen;
    Display.ForegroundColor := clBlack;
    Display.DrawText('X:a+234.56mm',10,10+68*3);
    Display.ForegroundColor := clRed;
    Display.DrawText('Y:a+890.12mm',10,10+68*2);
    Display.ForegroundColor := clGreen;
    Display.DrawText('Z:a+456.78mm',10,10+68);
    Display.ForegroundColor := clBlue;
    Display.DrawText('Z:a+456.78mm',10,10);
    SystemCore.Delay(5000);
  until 1=0;
end.

