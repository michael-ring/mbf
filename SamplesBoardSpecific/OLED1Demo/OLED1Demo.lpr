program OLED1Demo;
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
  MBF.Displays.OLED1Xplained,
  MBF.Displays.CustomDisplay,
  MBF.Fonts.Mono8x8;

const
  PinReset   = EXT3_PIN_10;
  PinA0      = EXT3_PIN_5;

var
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO) or defined(SAMC21XPRO)}
  TurnedOn :boolean=false;
  {$endif}
  Display: TOLED1;
  i : integer;

begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  SystemCore.GetCPUFrequency;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // This Initializes SPI5 for OLED1Xplained on EXT3
  SPI5.Initialize(
      TSPIMOSIPins.PB22_SPI5_PAD2,
      TSPIMISOPins.PB16_SPI5_PAD0,
      TSPISCLKPins.PB23_SPI5_PAD3,
      TSPINSSPins.PB17_SPI5_PAD1);

  Display.Initialize(SPI5,PinA0,PinReset,ScreenSize128x32x1);

  Display.setFont(Mono8x8);
  Display.Reset;
  Display.InitSequence;

  Display.BackgroundColor := clBlack;
  Display.ClearScreen;
  Display.DrawString(1,0,'Hallo Michael.');
  Display.DrawString(1,1,'It works !!!!!');
  Display.DrawString(1,2,'Greetings,');
  Display.DrawString(1,3,'Alfred.');
  Display.PresentBuffer;

  repeat

    {$if defined(SAMD20XPRO) or defined(SAMD21XPRO) or defined(SAMC21XPRO)}
    TurnedOn := not TurnedOn;

    if TurnedOn then
      GPIO.PinValue[LED0] := 1
    else
      GPIO.PinValue[LED0] := 0;
    {$endif}

    SystemCore.Delay(500);
  until 1=0
end.
