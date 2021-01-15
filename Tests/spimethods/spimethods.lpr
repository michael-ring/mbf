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
  SPI.Initialize(TSPIMosiPins.D11_SPI,TSPIMisoPins.D12_SPI,TSPISCLKPins.D13_SPI,TSPINSSPins.D10_SPI);
  SPI.Baudrate := DefaultSPIBaudrate;
  SPI.Mode := TSPIMode.Mode0;
  SPI.OperatingMode := TSPIOperatingMode.Master;

  // Read without Timeout
  success := SPI.ReadByte(dummyByte);
  success := SPI.ReadWord(dummyWord);
  success := SPI.ReadBytes(dummyByteArray,length(dummyByteArray));
  success := SPI.ReadWords(dummyWordArray,length(dummyWordArray));
  
  // Read with Timeout
  success := SPI.ReadByte(dummyByte,1000);
  success := SPI.ReadWord(dummyWord,1000);
  success := SPI.ReadBytes(dummyByteArray,length(dummyByteArray),1000);
  success := SPI.ReadWords(dummyWordArray,length(dummyWordArray),1000);
  
  // Write without Timeout
  success := SPI.WriteByte(dummyByte);
  success := SPI.WriteWord(dummyWord);
  success := SPI.WriteBytes(dummyByteArray,length(dummyByteArray));
  success := SPI.WriteWords(dummyWordArray,length(dummyWordArray));
  
  // Write with Timeout
  success := SPI.WriteByte(dummyByte,1000);
  success := SPI.WriteWord(dummyWord,1000);
  success := SPI.WriteBytes(dummyByteArray,length(dummyByteArray),1000);
  success := SPI.WriteWords(dummyWordArray,length(dummyWordArray),1000);
  
  // Transfer without Timeout
  success := SPI.TransferByte(dummyByte,dummyByte);
  success := SPI.TransferWord(dummyWord,dummyWord);
  success := SPI.TransferBytes(dummyByteArray,dummyByteArray,length(dummyByteArray));
  success := SPI.TransferWords(dummyWordArray,dummyWordArray,length(dummyWordArray));
  
  // Transfer with Timeout
  success := SPI.TransferByte(dummyByte,dummyByte,1000);
  success := SPI.TransferWord(dummyWord,dummyWord,1000);
  success := SPI.TransferBytes(dummyByteArray,dummyByteArray,length(dummyByteArray),1000);
  success := SPI.TransferWords(dummyWordArray,dummyWordArray,length(dummyWordArray),1000);
  
  // Initialize an extra Pin for Soft-NSS
  GPIO.PinMode[TArduinoPin.D9] := TPinMode.Output;

  // NSS Handling
  SPI.BeginTransaction;
  SPI.BeginTransaction(TArduinoPin.D9);
  SPI.EndTransaction;
  SPI.EndTransaction(TArduinoPin.D9);
end.  

