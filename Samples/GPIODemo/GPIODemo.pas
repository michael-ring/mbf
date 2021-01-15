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

begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  SystemCore.GetCPUFrequency;
  //SystemCore.DisableJTAGInterface;
  GPIO.Initialize;
  GPIO.PinMode[TArduinoPin.D2] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D3] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D4] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D5] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D6] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D7] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D8] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D9] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D10] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D11] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D12] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D13] := TPinMode.Output;

  repeat
    GPIO.PinValue[TArduinoPin.D2] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D3] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D4] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D5] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D6] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D7] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D8] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D9] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D10] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D11] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D12] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D13] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D2] := 0;
    GPIO.PinValue[TArduinoPin.D3] := 0;
    GPIO.PinValue[TArduinoPin.D4] := 0;
    GPIO.PinValue[TArduinoPin.D5] := 0;
    GPIO.PinValue[TArduinoPin.D6] := 0;
    GPIO.PinValue[TArduinoPin.D7] := 0;
    GPIO.PinValue[TArduinoPin.D8] := 0;
    GPIO.PinValue[TArduinoPin.D9] := 0;
    GPIO.PinValue[TArduinoPin.D10] := 0;
    GPIO.PinValue[TArduinoPin.D11] := 0;
    GPIO.PinValue[TArduinoPin.D12] := 0;
    GPIO.PinValue[TArduinoPin.D13] := 0;
    SystemCore.Delay(500);
  until 1=0;
end.

