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
  MBF.Types,
  MBF.TypeHelpers,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI,
  MBF.Displays.SSD1306,
  MBF.Displays.CustomDisplay,
  MBF.Fonts.Px437Verite8x8;

var
  Display: TSSD1306;

begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  //Connect the Display the following way:
  // D8 -> RST
  // D9 -> DC
  // D10 -> CS
  // D11 -> D1
  // D13 -> D0

  SPI.Initialize(TSPIMOSIPins.D11_SPI,TSPIMISOPINS.D12_SPI,TSPISCLKPINS.D13_SPI,TSPINSSPins.D10_SPI);
  SPI.Baudrate := 8000000;

  //Remeber to properly set the Screensize of your Display!
  Display.Initialize(SPI,TArduinopin.D9,TArduinopin.D8,ScreenSize128x64x1);
  Display.Reset;
  Display.InitSequence;
  Display.setFont(Px437Verite8x8);
  repeat
    Display.BackgroundColor := clBlack;
    Display.ForegroundColor := clWhite;
    Display.ClearScreen;
    Display.drawText('CPU-Speed:',0,0*Px437Verite8x8.Height);
    Display.drawText(SystemCore.GetCPUFrequency.toString,0,1*Px437Verite8x8.Height);
    Display.drawText('SPI-Baudrate:',0,2*Px437Verite8x8.Height);
    Display.drawText(SPI.Baudrate.toString,0,3*Px437Verite8x8.Height);
    SystemCore.Delay(2000);
    Display.BackgroundColor := clWhite;
    Display.ForegroundColor := clBlack;
    Display.ClearScreen;
    Display.drawText('X',0,0*Px437Verite8x8.Height);
    Display.drawText('This is White',0,0*Px437Verite8x8.Height);
    SystemCore.Delay(2000);
    //Display.BackgroundColor := clBlack;
    //Display.ForegroundColor := clWhite;
    //Display.ClearScreen;
    //mDisplay.drawText('This is Black',0,1*BitstreamVeraSansMono6x12.Height);
    //SystemCore.Delay(2000);
  until 1=0
end.
