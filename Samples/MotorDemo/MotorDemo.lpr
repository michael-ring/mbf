program MotorDemo;
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
  MBF.Devices.ULN2003;
var
  ULN2003 : TULN2003;
  i : longWord;
begin
  SystemCore.Initialize;
  GPIO.Initialize;
  
  GPIO.PinMode[TArduinoPin.D2] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D3] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D4] := TPinMode.Output;
  GPIO.PinMode[TArduinoPin.D5] := TPinMode.Output;

  ULN2003.Initialize(TArduinoPin.D2,TArduinoPin.D3,TArduinoPin.D4,TArduinoPin.D5);
  
  ULN2003.Delay := 1;
  repeat
    ULN2003.Direction := TULN2003Direction.Left;
    for i := 0 to 4095 do
      ULN2003.Step;
    SystemCore.Delay(2000);
    ULN2003.Direction := TULN2003Direction.Right;
    for i := 0 to 4095 do
      ULN2003.Step;
    SystemCore.Delay(2000);
  until 1=0
end.

