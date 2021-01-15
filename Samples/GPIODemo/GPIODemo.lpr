program GPIODemo;
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
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO;

const
  Pins : array[0..11] of integer = ( TArduinoPin.D2,TArduinoPin.D3,TArduinoPin.D4,TArduinoPin.D5,
TArduinoPin.D6,TArduinoPin.D7,TArduinoPin.D8,TArduinoPin.D9,
TArduinoPin.D10,TArduinoPin.D11,TArduinoPin.D12,TArduinoPin.D13);

var
  pin : integer;
begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);

  GPIO.Initialize;
  for pin in Pins do
    GPIO.PinMode[pin] := TPinMode.Output;

  repeat
    for pin in pins do
    begin
      GPIO.SetPinLevelHigh(pin);
      SystemCore.Delay(500);
    end;
    for pin in pins do
    begin
      GPIO.SetPinLevelLow(pin);
      SystemCore.Delay(500);
    end;
  until 1=0;
end.

