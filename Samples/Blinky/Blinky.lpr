program Blinky;
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
  GPIO.PinMode[TArduinoPin.D0] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D1] := TPinMode.Output;
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
  GPIO.PinMode[TArduinoPin.D14] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D15] := TPinMode.Output;

  repeat
    GPIO.PinValue[TArduinoPin.D0] := High;
    GPIO.PinValue[TArduinoPin.D1] := High;
    GPIO.PinValue[TArduinoPin.D2] := High;
    GPIO.PinValue[TArduinoPin.D3] := High;
    GPIO.PinValue[TArduinoPin.D4] := High;
    GPIO.PinValue[TArduinoPin.D5] := High;
    GPIO.PinValue[TArduinoPin.D6] := High;
    GPIO.PinValue[TArduinoPin.D7] := High;
    GPIO.PinValue[TArduinoPin.D8] := High;
    GPIO.PinValue[TArduinoPin.D9] := High;
    GPIO.PinValue[TArduinoPin.D10] := High;
    GPIO.PinValue[TArduinoPin.D11] := High;
    GPIO.PinValue[TArduinoPin.D12] := High;
    GPIO.PinValue[TArduinoPin.D13] := High;
    GPIO.PinValue[TArduinoPin.D14] := High;
    GPIO.PinValue[TArduinoPin.D15] := High;
    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D0] := Low;
    GPIO.PinValue[TArduinoPin.D1] := Low;
    GPIO.PinValue[TArduinoPin.D2] := Low;
    GPIO.PinValue[TArduinoPin.D3] := Low;
    GPIO.PinValue[TArduinoPin.D4] := Low;
    GPIO.PinValue[TArduinoPin.D5] := Low;
    GPIO.PinValue[TArduinoPin.D6] := Low;
    GPIO.PinValue[TArduinoPin.D7] := Low;
    GPIO.PinValue[TArduinoPin.D8] := Low;
    GPIO.PinValue[TArduinoPin.D9] := Low;
    GPIO.PinValue[TArduinoPin.D10] := Low;
    GPIO.PinValue[TArduinoPin.D11] := Low;
    GPIO.PinValue[TArduinoPin.D12] := Low;
    GPIO.PinValue[TArduinoPin.D13] := Low;
    GPIO.PinValue[TArduinoPin.D14] := Low;
    GPIO.PinValue[TArduinoPin.D15] := Low;
    SystemCore.Delay(500);
  until 1=0;
end.

