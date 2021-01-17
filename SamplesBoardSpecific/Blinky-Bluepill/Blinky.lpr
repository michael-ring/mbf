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
  MBF.STM32F1.SystemCore,
  MBF.STM32F1.GPIO;

begin
  SystemCore.Initialize;
  // We must define the Clock of the on-board Resonator/XTAL before calling SetCPUFrequency
  HSEClockFrequency := 8000000;
  // Use TClockType.PLLHSE to use the on Board Resonator/XTAL. This is the only way to reach 72MHz
  // with TClockType.PLLHSI max Speed is 64MHz
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency,TClockType.PLLHSE);

  GPIO.Initialize;
  GPIO.PinMode[TNativePin.PC13] := TPinMode.Output;

  repeat
    GPIO.PinValue[TNativePin.PC13] := 1;
    SystemCore.Delay(500);
    GPIO.PinValue[TNativePin.PC13] := 0;
    SystemCore.Delay(500);
  until 1=0;
end.

