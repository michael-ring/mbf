program gpiomethods;
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
  MBF.__CONTROLLERTYPE__.GPIO;

var
  aPinValue : TPinValue;
  aPinLevel : TPinLevel;
  aPinMode : TPinMode;
  aPinDrive : TPinDrive;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // Test availability of all interfaces

  aPinValue :=0;
  aPinValue :=1;
  aPinValue := GPIO.GetPinValue(TNativePin.PA0);
  GPIO.SetPinValue(TNativePin.PA0,0);
  GPIO.SetPinValue(TNativePin.PA0,1);
  GPIO.TogglePinValue(TNativePin.PA0);

  aPinLevel := TPinLevel.Low;
  aPinLevel := TPinLevel.High;
  aPinLevel := GPIO.GetPinLevel(TNativePin.PA0);
  GPIO.SetPinLevel(TNativePin.PA0,aPinLevel);
  GPIO.TogglePinLevel(TNativePin.PA0);

  GPIO.SetPinLevelHigh(TNativePin.PA0);
  GPIO.SetPinLevelLow(TNativePin.PA0);

  aPinMode := TPinMode.Input;
  aPinMode := TPinMode.Output;
  aPinMode := TPinMode.Analog;
  aPinMode := GPIO.PinMode[TNativePin.PA0];
  GPIO.PinMode[TNativePin.PA0] := aPinMode;
  
  aPinDrive := GPIO.PinDrive[TNativePin.PA0];
  GPIO.PinDrive[TNativePin.PA0] := aPinDrive;

  aPinValue := GPIO.PinValue[TNativePin.PA0];
  GPIO.PinValue[TNativePin.PA0] := aPinValue;

  aPinLevel := GPIO.PinLevel[TNativePin.PA0];
  GPIO.PinLevel[TNativePin.PA0] := aPinLevel;
end.  

