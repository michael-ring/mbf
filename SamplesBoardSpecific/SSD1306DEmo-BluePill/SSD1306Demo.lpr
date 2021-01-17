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
  MBF.STM32F1.SystemCore,
  MBF.STM32F1.GPIO,
  MBF.STM32F1.SPI,
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
  // A2 -> RST or RES
  // A3 -> DC
  // A4 -> CS
  // A5 -> D0 or SCK
  // A7 -> D1 or SDA

  SPI1.Initialize(TSPIMOSIPins.PA7_SPI1,
                 TSPIMISOPINS.PA6_SPI1,
                 TSPISCLKPINS.PA5_SPI1,
                 TSPINSSPins.PA4_SPI1);
  SPI1.Baudrate := 8000000;

  //Remeber to properly set the Screensize of your Display!
  Display.Initialize(SPI1,TNativePin.PA3,TNativePin.PA2,ScreenSize128x64x1);
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
    Display.drawText(SPI1.Baudrate.toString,0,3*Px437Verite8x8.Height);
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
