program I2CDemo;
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
  MBF.__CONTROLLERTYPE__.UART,
  MBF.__CONTROLLERTYPE__.I2C;

var
  i : longWord;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // Initialize UART for logging

  UART.Initialize(TUARTRXPins.DEBUG_UART,TUARTTXPins.DEBUG_UART);

  // This Initializes the default I2C for Arduino compatible Boards (connected to pins D14/D15 or A4/A5 on Arduino Header)
  // If the board is not Arduino compatible then you will have to use 'real' I2Cs instead which are usually named I2C0, I2C1 ....
  // Also, if you plan to use more than one I2C you should always use 'real' I2C names to avoid accidentially using a I2C twice.
  // Default Initialization is 100kHz I2C Clock, and 7-Bit Adressing
  I2C.Initialize(TI2CSDAPins.D14_I2C,TI2CSCLPins.D15_I2C);

  repeat
    UART.WriteString('CPU Speed is ');
    UART.WriteUnsignedInt(SystemCore.GetCPUFrequency);
    UART.WriteString(#13#10);
    UART.WriteString('I2C Bus Speed is ');
    UART.WriteUnsignedInt(I2C.Baudrate);
    UART.WriteString(#13#10);
    UART.WriteString('Scanning I2C Bus...'#13#10);
    UART.WriteString('$00:  --');
    for i := 1 to 127 do
    begin
      if (i mod 16) = 0 then
      begin
        UART.WriteString(#13#10'$');
        UART.WriteHexInt(i,2);
        UART.WriteString(':');
      end;

      // Detect Devices on I2C Bus by waiting for ACK after Device Address is posted to the Bus
      if I2C.BeginWriteTransaction(i) = true then
      begin
        UART.WriteString(' $');
        UART.WriteHexInt(i,2);
      end
      else
        UART.WriteString('  --');
      I2C.EndTransaction;
    end;
    UART.WriteString(#13#10);
    SystemCore.Delay(5000);
  until 1=0
end.
