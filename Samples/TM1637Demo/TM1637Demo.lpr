program TM1637Demo;
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
  HeapMgr,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.Devices.TM1637;

var
  TM1637 : TTM1637;

begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  TM1637.Initialize(TArduinoPin.D2,TArduinoPin.D3);
  TM1637.Clear;

  while true do
  begin
    TM1637.SetDigit(1,0);
    TM1637.SetDigit(2,0);
    TM1637.SetDigit(3,0);
    TM1637.SetDigit(4,0);
    Systemcore.Delay(1000);
    TM1637.SetDigit(1,$ff);
    TM1637.SetDigit(2,$ff);
    TM1637.SetDigit(3,$ff);
    TM1637.SetDigit(4,$ff);
    Systemcore.Delay(1000);
  end;
end.
