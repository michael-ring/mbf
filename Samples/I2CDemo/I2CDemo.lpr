program I2CDemo;
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
  MBF.__CONTROLLERTYPE__.I2C;

var
  i : longWord;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // This Initializes the default I2C for Arduino compatible Boards (connected to pins D10 to D13 on Arduino Header)
  // If the board is not Arduino compatible then you will have to use 'real' I2Cs instead which are usually named I2C0, I2C1 ....
  // Also, if you plan to use more than one I2C you should always use 'real' I2C names to avoid accidentially using a I2C twice.
  // Default Initialization is 8MHz I2C Clock, Master and 8-Bit Mode
  I2C.Initialize(TI2CSDAPins.D14_I2C,TI2CSCLPins.D15_I2C);

  // Now define which Pins to use for the choosen I2C
  //I2C.Initialize;
  //I2C.SDAPin := TI2CSDAPins.D15_I2C;
  //I2C.SCLPin := TI2CSCLPins.D14_I2C;

  //I2C.Frequency := 8000000;
  //I2C.BitsPerWord := TI2CBitsPerWord.Eight;
  //I2C.Mode := TI2CMode.Master;


  // For this demo we need to switch to 16Bit Mode
  // We drive a small 8x8 LED Module that is driven by a MAX7219 Chip

  repeat
    for i := 1 to 8 do
    SystemCore.Delay(1000);
  until 1=0
end.
