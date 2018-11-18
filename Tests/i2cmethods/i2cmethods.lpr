program i2cmethods;
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
  MBF.__CONTROLLERTYPE__.I2C;

var
  aI2CAddressSize : TI2CAddressSize;
  aI2COperatingMode : TI2COperatingMode;
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

  aI2COperatingMode := TI2COperatingMode.Master;
  aI2COperatingMode := TI2COperatingMode.Slave;

  aI2CAddressSize := TI2CAddressSize.SevenBits;
  aI2CAddressSize := TI2CAddressSize.TenBits;

  //Initialize the I2C subsystem
  I2C.Initialize;
  I2C.SDAPin := TI2CSDAPins.D15_I2C;
  I2C.CLKPin := TI2CCLKPins.D14_I2C;

  I2C.Initialize(TI2CPins.D11_I2C,TI2CPins.D12_I2C);
  I2C.Baudrate := DefaultI2CFrequency;
  I2C.OperatingMode := TI2COperatingMode.Master;
  I2C.TargetAddress := 35;

  // Read without Timeout
  success := I2C.ReadByte(dummyByte);
  success := I2C.ReadeByte(dummyByteArray);
  
  // Read with Timeout
  success := I2C.ReadByte(dummyByte,1000);
  success := I2C.ReadByte(dummyByteArray,1000);
  
  // Write without Timeout
  success := I2C.WriteByte(dummyByte);
  success := I2C.WriteByte(dummyByteArray);
  
  // Write with Timeout
  success := I2C.WriteByte(dummyByte,1000);
  success := I2C.WriteByte(dummyByteArray,1000);
  
  // Transfer without Timeout
  success := I2C.TransferByte(dummyByte,dummyByte);
  success := I2C.TransferByte(dummyByteArray,dummyByteArray);
  
  // Transfer with Timeout
  success := I2C.TransferByte(dummyByte,dummyByte,1000);
  success := I2C.TransferByte(dummyByteArray,dummyByteArray,1000);
  
end.  

