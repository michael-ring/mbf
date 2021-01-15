unit MBF.Devices.BME380;
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


interface
{$INCLUDE MBF.Config.inc}
uses
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.I2C;

type
   TBME380 = object
   private
     FpI2C : ^TI2C_Registers;
     FAddress : byte;
   public
     function Initialize(var I2C : TI2C_Registers;aAddress : byte):boolean;
   end;

implementation

function TBME380.Initialize(var I2C : TI2C_Registers;aAddress : byte):boolean;
begin
  FpI2C := @I2C;
  FAddress := aAddress;
  if I2C.BeginTransaction(FAddress,TI2CTransactionMode.Write) then
  begin
    // Prepare Read from Devive ID Register
    I2C.WriteByte($D0);
    I2C.RestartTransaction(TI2CTransactionMode.Read);
    I2C.ReadByte;
    I2C.EndTransaction;
  end
  else
    Result := false;
end;

end.
