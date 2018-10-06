program spimethods;
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
  MBF.__CONTROLLERTYPE__.SPI;

var
  aSPIMode : TSPIMode;
  aSPIBitsPerWord : TSPIBitsPerWord;
  aSPIOperatingMode : TSPIOperatingMode;
  dummyByte : Byte;
  dummyWord : Word;
  dummyByteArray : array[0..1] of byte;
  dummyWordArray : array[0..1] of word;
  success : boolean;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // Test availability of all interfaces

  aSPIMode :=TSPIMode.Mode0;
  aSPIMode :=TSPIMode.Mode1;
  aSPIMode :=TSPIMode.Mode2;
  aSPIMode :=TSPIMode.Mode3;

  aSPIOperatingMode := TSPIOperatingMode.Master;
  aSPIOperatingMode := TSPIOperatingMode.Slave;

  // Initialize the SPI subsystem
  SPI.Initialize;
  SPI.MosiPin := TSPIMosiPins.D11_SPI;
  SPI.MisoPin := TSPIMisoPins.D12_SPI;
  SPI.SCLKPin := TSPISCLKPins.D13_SPI;
  SPI.NSSPin  := TSPINSSPins.D10_SPI;

  SPI.Initialize(TSPIMosiPins.D11_SPI,TSPIMisoPins.D12_SPI,TSPISCLKPins.D13_SPI,TSPINSSPins.D10_SPI);
  SPI.Baudrate := DefaultSPIFrequency;
  SPI.Mode := TSPIMode.Mode0;
  SPI.OperatingMode := TSPIOperatingMode.Master;

  // Read without Timeout
  success := SPI.WriteByte(dummyByte);
  success := SPI.WriteWord(dummyWord);
  success := SPI.WriteByte(dummyByteArray);
  success := SPI.WriteWord(dummyWordArray);
  
  // Read with Timeout
  success := SPI.WriteByte(dummyByte,1000);
  success := SPI.WriteWord(dummyWord,1000);
  success := SPI.WriteByte(dummyByteArray,1000);
  success := SPI.WriteWord(dummyWordArray,1000);
  
  // Write without Timeout
  success := SPI.WriteByte(dummyByte);
  success := SPI.WriteWord(dummyWord);
  success := SPI.WriteByte(dummyByteArray);
  success := SPI.WriteWord(dummyWordArray);
  
  // Write with Timeout
  success := SPI.WriteByte(dummyByte,1000);
  success := SPI.WriteWord(dummyWord,1000);
  success := SPI.WriteByte(dummyByteArray,1000);
  success := SPI.WriteWord(dummyWordArray,1000);
  
  // Transfer without Timeout
  success := SPI.TransferByte(dummyByte,dummyByte);
  success := SPI.TransferWord(dummyWord,dummyWord);
  success := SPI.TransferByte(dummyByteArray,dummyByteArray);
  success := SPI.TransferWord(dummyWordArray,dummyWordArray);
  
  // Transfer with Timeout
  success := SPI.TransferByte(dummyByte,dummyByte,1000);
  success := SPI.TransferWord(dummyWord,dummyWord,1000);
  success := SPI.TransferByte(dummyByteArray,dummyByteArray,1000);
  success := SPI.TransferWord(dummyWordArray,dummyWordArray,1000);
  
end.  

