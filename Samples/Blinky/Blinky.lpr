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
end.
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  SystemCore.GetCPUFrequency;
  //SystemCore.DisableJTAGInterface;
  GPIO.Initialize;
  GPIO.PinMode[TArduinoPin.D13] := TPinMode.Output;
  (*
  GPIO.PinMode[TNativePin.PA0] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA1] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA2] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA3] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA4] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA5] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA6] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA7] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA8] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA9] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA10] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA11] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA12] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA13] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA14] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PA15] := TPinMode.Output;

  GPIO.PinMode[TNativePin.PB0] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB1] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB2] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB3] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB4] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB5] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB6] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB7] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB8] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB9] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB10] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB11] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB12] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB13] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB14] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PB15] := TPinMode.Output;

  GPIO.PinMode[TNativePin.PC0] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC1] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC2] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC3] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC4] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC5] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC6] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC7] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC8] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC9] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC10] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC11] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC12] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC13] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC14] := TPinMode.Output;
  GPIO.PinMode[TNativePin.PC15] := TPinMode.Output;
*)

  repeat
    GPIO.PinValue[TArduinoPin.D13] := 1;
    (*
    GPIO.PinValue[TNativePin.PA0] := 1;
    GPIO.PinValue[TNativePin.PA1] := 1;
    GPIO.PinValue[TNativePin.PA2] := 1;
    GPIO.PinValue[TNativePin.PA3] := 1;
    GPIO.PinValue[TNativePin.PA4] := 1;
    GPIO.PinValue[TNativePin.PA5] := 1;
    GPIO.PinValue[TNativePin.PA6] := 1;
    GPIO.PinValue[TNativePin.PA7] := 1;
    GPIO.PinValue[TNativePin.PA8] := 1;
    GPIO.PinValue[TNativePin.PA9] := 1;
    GPIO.PinValue[TNativePin.PA10] := 1;
    GPIO.PinValue[TNativePin.PA11] := 1;
    GPIO.PinValue[TNativePin.PA12] := 1;
    GPIO.PinValue[TNativePin.PA13] := 1;
    GPIO.PinValue[TNativePin.PA14] := 1;
    GPIO.PinValue[TNativePin.PA15] := 1;

    GPIO.PinValue[TNativePin.PB0] := 1;
    GPIO.PinValue[TNativePin.PB1] := 1;
    GPIO.PinValue[TNativePin.PB2] := 1;
    GPIO.PinValue[TNativePin.PB3] := 1;
    GPIO.PinValue[TNativePin.PB4] := 1;
    GPIO.PinValue[TNativePin.PB5] := 1;
    GPIO.PinValue[TNativePin.PB6] := 1;
    GPIO.PinValue[TNativePin.PB7] := 1;
    GPIO.PinValue[TNativePin.PB8] := 1;
    GPIO.PinValue[TNativePin.PB9] := 1;
    GPIO.PinValue[TNativePin.PB10] := 1;
    GPIO.PinValue[TNativePin.PB11] := 1;
    GPIO.PinValue[TNativePin.PB12] := 1;
    GPIO.PinValue[TNativePin.PB13] := 1;
    GPIO.PinValue[TNativePin.PB14] := 1;
    GPIO.PinValue[TNativePin.PB15] := 1;

    GPIO.PinValue[TNativePin.PC0] := 1;
    GPIO.PinValue[TNativePin.PC1] := 1;
    GPIO.PinValue[TNativePin.PC2] := 1;
    GPIO.PinValue[TNativePin.PC3] := 1;
    GPIO.PinValue[TNativePin.PC4] := 1;
    GPIO.PinValue[TNativePin.PC5] := 1;
    GPIO.PinValue[TNativePin.PC6] := 1;
    GPIO.PinValue[TNativePin.PC7] := 1;
    GPIO.PinValue[TNativePin.PC8] := 1;
    GPIO.PinValue[TNativePin.PC9] := 1;
    GPIO.PinValue[TNativePin.PC10] := 1;
    GPIO.PinValue[TNativePin.PC11] := 1;
    GPIO.PinValue[TNativePin.PC12] := 1;
    GPIO.PinValue[TNativePin.PC13] := 1;
    GPIO.PinValue[TNativePin.PC14] := 1;
    GPIO.PinValue[TNativePin.PC15] := 1;
    *)

    SystemCore.Delay(500);
    GPIO.PinValue[TArduinoPin.D13] := 0;
    (*
    GPIO.PinValue[TNativePin.PA0] := 0;
    GPIO.PinValue[TNativePin.PA1] := 0;
    GPIO.PinValue[TNativePin.PA2] := 0;
    GPIO.PinValue[TNativePin.PA3] := 0;
    GPIO.PinValue[TNativePin.PA4] := 0;
    GPIO.PinValue[TNativePin.PA5] := 0;
    GPIO.PinValue[TNativePin.PA6] := 0;
    GPIO.PinValue[TNativePin.PA7] := 0;
    GPIO.PinValue[TNativePin.PA8] := 0;
    GPIO.PinValue[TNativePin.PA9] := 0;
    GPIO.PinValue[TNativePin.PA10] := 0;
    GPIO.PinValue[TNativePin.PA11] := 0;
    GPIO.PinValue[TNativePin.PA12] := 0;
    GPIO.PinValue[TNativePin.PA13] := 0;
    GPIO.PinValue[TNativePin.PA14] := 0;
    GPIO.PinValue[TNativePin.PA15] := 0;

    GPIO.PinValue[TNativePin.PB0] := 0;
    GPIO.PinValue[TNativePin.PB1] := 0;
    GPIO.PinValue[TNativePin.PB2] := 0;
    GPIO.PinValue[TNativePin.PB3] := 0;
    GPIO.PinValue[TNativePin.PB4] := 0;
    GPIO.PinValue[TNativePin.PB5] := 0;
    GPIO.PinValue[TNativePin.PB6] := 0;
    GPIO.PinValue[TNativePin.PB7] := 0;
    GPIO.PinValue[TNativePin.PB8] := 0;
    GPIO.PinValue[TNativePin.PB9] := 0;
    GPIO.PinValue[TNativePin.PB10] := 0;
    GPIO.PinValue[TNativePin.PB11] := 0;
    GPIO.PinValue[TNativePin.PB12] := 0;
    GPIO.PinValue[TNativePin.PB13] := 0;
    GPIO.PinValue[TNativePin.PB14] := 0;
    GPIO.PinValue[TNativePin.PB15] := 0;

    GPIO.PinValue[TNativePin.PC0] := 0;
    GPIO.PinValue[TNativePin.PC1] := 0;
    GPIO.PinValue[TNativePin.PC2] := 0;
    GPIO.PinValue[TNativePin.PC3] := 0;
    GPIO.PinValue[TNativePin.PC4] := 0;
    GPIO.PinValue[TNativePin.PC5] := 0;
    GPIO.PinValue[TNativePin.PC6] := 0;
    GPIO.PinValue[TNativePin.PC7] := 0;
    GPIO.PinValue[TNativePin.PC8] := 0;
    GPIO.PinValue[TNativePin.PC9] := 0;
    GPIO.PinValue[TNativePin.PC10] := 0;
    GPIO.PinValue[TNativePin.PC11] := 0;
    GPIO.PinValue[TNativePin.PC12] := 0;
    GPIO.PinValue[TNativePin.PC13] := 0;
    GPIO.PinValue[TNativePin.PC14] := 0;
    GPIO.PinValue[TNativePin.PC15] := 0;
    *)
    SystemCore.Delay(500);
  until 1=0;
end.

