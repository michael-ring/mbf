unit MBF.Devices.VCNL4010;
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
   TVCNL4010SamplesPerSecond = (
    Two                 = 0, // 1.95     measurements/sec (Default)
    Four                = 1, // 3.90625  measurements/sec
    Eight               = 2, // 7.8125   measurements/sec
    Sixteen             = 3, // 16.625   measurements/sec
    Thirtytwo           = 4, // 31.25    measurements/sec
    SixtyTwo            = 5, // 62.5     measurements/sec
    OneHundredTwentyFive= 6, // 125      measurements/sec
    TwoHundredFifty     = 7  // 250      measurements/sec
   );

   TVCNL4010 = object
   const
     COMMAND         =$80; // Command
     PRODUCTID       =$81; // Product ID Revision
     PROXRATE        =$82; // Proximity rate
     IRLED           =$83; // IR LED current
     AMBIENTPARAMETER=$84; // Ambient light parameter
     AMBIENTDATA     =$85; // Ambient light result (16 bits)
     PROXIMITYDATA   =$87; // Proximity result (16 bits)
     INTCONTROL      =$89; // Interrupt control
     LOWTHRESHOLD    =$8A; // Low threshold value (16 bits)
     HITHRESHOLD     =$8C; // High threshold value (16 bits)
     INTSTAT         =$8E; // Interrupt status
     MODTIMING       =$8F; // Proximity modulator timing adjustment

   private
     FpI2C : ^TI2C_Registers;
     FAddress : byte;
   public
     function Initialize(var I2C : TI2C_Registers;aAddress : byte=$14):boolean;
   end;

implementation

function TVCNL4010.Initialize(var I2C : TI2C_Registers;aAddress : byte=$14):boolean;
var
  Temp : byte;
begin
  Result := false;
  FpI2C := @I2C;
  FAddress := aAddress;
  if I2C.ReadRegister(aAddress,PRODUCTID,Temp) then
  begin
    if Temp = $21 then
    begin
      // Set IR-LED Current to 200mA
      I2C.WriteRegister(aAddress,IRLED,20);
      I2C.WriteRegister(aAddress,PROXRATE, byte(TVCNL4010SamplesPerSecond.Sixteen));
      I2C.WriteRegister(aAddress,INTCONTROL,$00);
    end;
  end;
end;

end.
