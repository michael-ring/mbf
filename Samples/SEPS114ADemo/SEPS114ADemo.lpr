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
  HeapMgr,
  MBF.Types,
  MBF.TypeHelpers,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI,
  MBF.Displays.SEPS114A,
  MBF.Displays.CustomDisplay,
  MBF.Fonts.BitstreamVeraSansMono6x12;

var
  Display: TSEPS114A;

begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  //Connect the Display the following way:
  // A3 -> RST // RST pin
  // D6 -> DC; // DC pin
  // A0 -> RW; // R/W pin
  // D10 -> CS
  // D11 -> D1
  // D13 -> D0

  GPIO.PinMode[TArduinopin.A0]  := TPinMode.Output;
  GPIO.setPinLevelLow(TArduinopin.A0);


  SPI.Initialize(TSPIMOSIPins.D11_SPI,TSPIMISOPINS.D12_SPI,TSPISCLKPINS.D13_SPI,TSPINSSPins.D10_SPI);
  SPI.Baudrate := 24000000;

  //Remember to properly set the Screensize of your Display!
  Display.Initialize(SPI,TArduinopin.D6,TArduinopin.A3,ScreenSize96x96x16);
  Display.Reset;
  Display.InitSequence;
  Display.setFont(BitstreamVeraSansMono6x12);
  repeat
    Display.BackgroundColor := clBlack;
    Display.ForegroundColor := clWhite;
    Display.ClearScreen;
    Display.drawText('CPU-Speed:',0,0*BitstreamVeraSansMono6x12.Height);
    Display.drawText(SystemCore.GetCPUFrequency.toString+' Hz',0,1*BitstreamVeraSansMono6x12.Height);
    Display.drawText('SPI-Baudrate:',0,2*BitstreamVeraSansMono6x12.Height);
    Display.drawText(SPI.Baudrate.toString+' Hz',0,3*BitstreamVeraSansMono6x12.Height);
    SystemCore.Delay(2000);
    Display.BackgroundColor := clRed;
    Display.ForegroundColor := clBlack;
    Display.ClearScreen;
    Display.drawText('This is Red',0,0*BitstreamVeraSansMono6x12.Height);
    SystemCore.Delay(2000);
    Display.BackgroundColor := clLime;
    Display.ClearScreen;
    Display.drawText('This is Green',0,1*BitstreamVeraSansMono6x12.Height);
    SystemCore.Delay(2000);
    Display.BackgroundColor := clBlue;
    Display.ClearScreen;
    Display.drawText('This is Blue',0,2*BitstreamVeraSansMono6x12.Height);
    SystemCore.Delay(2000);
  until 1=0
end.
