program SPIDemo;
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
  Pattern : array[1..8] of word = ($01aa,$0255,$03aa,$0455,$05aa,$0655,$07aa,$0855);
var
  i : longWord;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // This Initializes the default SPI for Arduino compatible Boards (connected to pins D10 to D13 on Arduino Header)
  // If the board is not Arduino compatible then you will have to use 'real' SPIs instead which are usually named SPI0, SPI1 ....
  // Also, if you plan to use more than one SPI you should always use 'real' SPI names to avoid accidentially using a SPI twice.
  // Default Initialization is 8MHz SPI Clock, Master and Mode0
  SPI.Initialize(TSPIMOSIPins.D11_SPI,TSPIMISOPins.D12_SPI,TSPISCLKPins.D13_SPI,TSPINSSPins.D10_SPI);

  // We drive a small 8x8 LED Module that is driven by a MAX7219 Chip
  // First we setup the chip
  SPI.beginTransaction;
  SPI.WriteWord($0900); //Do not decode bits
  SPI.endTransaction;
  SPI.beginTransaction;
  SPI.WriteWord($0A05); //Brightness of LED's
  SPI.endTransaction;
  SPI.beginTransaction;
  SPI.WriteWord($0B07); //Show all scan lines
  SPI.endTransaction;
  SPI.beginTransaction;
  SPI.WriteWord($0C01); //Display on
  SPI.endTransaction;
  SPI.beginTransaction;
  SPI.WriteWord($0F00); //TestMode off
  SPI.endTransaction;

  repeat
    //Clear Display
    for i := 1 to 8 do
    begin
      SPI.beginTransaction;
      SPI.WriteWord((i shl 8) + 0);
      SPI.endTransaction;
    end;
    SystemCore.Delay(1000);
    for i := 1 to 8 do
    begin
      SPI.beginTransaction;
      SPI.WriteWord((i shl 8) + $ff);
      SPI.endTransaction;
    end;
    SystemCore.Delay(1000);
      for i := 1 to 8 do
      begin
        SPI.beginTransaction;
        SPI.WriteWord(Pattern[i]);
        SPI.endTransaction;
      end;
    SystemCore.Delay(1000);
  until 1=0
end.
