program BME380Demo;
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
  MBF.__CONTROLLERTYPE__.UART,
  MBF.__CONTROLLERTYPE__.I2C,
  MBF.Devices.BME380;

var
  BME380 : TBME380;

begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  // Initialize UART for logging
  UART.Initialize(TUARTRXPins.DEBUG_UART,TUARTTXPins.DEBUG_UART);

  // BME380 is usually configured as I2C Device per default
  I2C.Initialize(TI2CSDAPins.D14_I2C,TI2CSCLPins.D15_I2C);

  BME380.Initialize(I2C);
  while true do
  begin
  end;
end.
