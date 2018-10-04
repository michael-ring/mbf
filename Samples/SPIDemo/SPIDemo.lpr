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
  PatternA : array[0..7] of word = ($01aa,$0255,$03aa,$0455,$05aa,$0655,$07aa,$0855);
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
  // Default Initialization is 8MHz SPI Clock, Master and 8-Bit Mode
  SPI.Initialize(TSPIMOSIPins.D11_SPI,TSPIMISOPins.D12_SPI,TSPISCLKPins.D13_SPI,TSPINSSPins.D10_SPI);

  //SPI.Frequency := 8000000;
  //SPI.BitsPerWord := TSPIBitsPerWord.Eight;
  //SPI.Mode := TSPIMode.Master;

  // Now define which Pins to use for the choosen SPI
  //SPI.Initialize;
  //SPI.MISOPin := TSPIMISOPins.D12_SPI;
  //SPI.MOSIPin := TSPIMOSIPins.D11_SPI;
  //SPI.SCLKPin := TSPISCLKPins.D13_SPI;
  //SPI.NSSPin  :=  TSPINSSPins.D10_SPI;

  // For this demo we need to switch to 16Bit Mode
  // We drive a small 8x8 LED Module that is driven by a MAX7219 Chip

  SPI.BitsPerWord := TSPIBitsPerWord.Sixteen;

  SPI.WriteWord($0900); //Do not decode bits
  SPI.WriteWord($0a05); //Brightness of LED's
  SPI.WriteWord($0b07); //Show all scan lines
  SPI.WriteWord($0c01); //Display on
  SPI.WriteWord($0f00); //TestMode off

  repeat
    //Clear Display
    for i := 1 to 8 do
      SPI.WriteWord((i shl 8) + 0);
    SystemCore.Delay(1000);
    for i := 1 to 8 do
      SPI.WriteWord((i shl 8) + $ff);
    SystemCore.Delay(1000);
    SPI.Write(PatternA);
    SystemCore.Delay(1000);
  until 1=0
end.
