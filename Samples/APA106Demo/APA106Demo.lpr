program APA106Demo;

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
  MBF.Types,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.SPI,
  MBF.Devices.APA106;


var
  i: longword;
  APA106: TAPA106;

begin
  SystemCore.Initialize;
  //Core Frequency should be 8, 16 of 64MHz to get perfect SPI Timing
  if SystemCore.getMaxCPUFrequency >= 64000000 then
    SystemCore.SetCPUFrequency(64000000)
  else if SystemCore.getMaxCPUFrequency >= 16000000 then
    SystemCore.SetCPUFrequency(16000000)
  else
    SystemCore.SetCPUFrequency(8000000);
  //APA106.Initialize(TArduinoPin.A3,16);
  APA106.Initialize(SPI,16,TSPIMOSIPins.D11_SPI,TSPIMISOPins.D12_SPI,TSPISCLKPins.D13_SPI,TSPINSSPins.D10_SPI);

  while True do
  begin
    for i := 1 to 16 do
      APA106.RGBPixel[i] := clRed;
    APA106.Refresh;
    SystemCore.delay(3000);
    for i := 1 to 16 do
      APA106.RGBPixel[i] := clGreen;
    APA106.Refresh;
    SystemCore.delay(3000);
    for i := 1 to 16 do
      APA106.RGBPixel[i] := clBlue;
    APA106.Refresh;
    SystemCore.delay(3000);
    for i := 1 to 16 do
      APA106.RGBPixel[i] := clWhite;
    APA106.Refresh;
    SystemCore.delay(3000);

    APA106.Clear;
    SystemCore.delay(3000);
  end;
end.
