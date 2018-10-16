program SIM33ELADemo;
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
  MBF.__CONTROLLERTYPE__.UART;
  //HeapMgr;
var
  DummyString : String;
  ReceivedString : String;
  Buffer : string;
  ReceivedByte : byte;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  //Define a Reset Pin, I am using a MIKROE Arduino Adapter, it has RESET of the SIM33ELA mapped to A3
  GPIO.PinMode[TArduinoPin.A3] := TPinMode.Output;
  GPIO.SetPinLevelHigh(TArduinoPin.A3);

  //Define a Interrupt Pin, we are nit using this feature, so make the Pin Input so that it does not get hurt
  GPIO.PinMode[TArduinoPin.D10] := TPinMode.Input;

  //Reset the Chip
  GPIO.SetPinLevelLow(TArduinoPin.A3);
  SystemCore.Delay(100);
  GPIO.SetPinLevelHigh(TArduinoPin.A3);

  // SIM33ELA is a GPS Chip operation via serial line @115200,N,8,1  so default Initialization of serial port is enough:

  UART.Initialize(TUARTRXPins.D0_UART,TUARTTXPins.D1_UART);

  //To be able to see output we use another UART to display output.
  //Some Boards (like Nucleo-L476 or SAMD20-XPRO or SAMD21-XPRO) use another UART to interface to the On-Board JTAG Debugger Chip
  //We use this 'feature' to be able to forward the received data from the Arduino UART to our Computer
  //This program will most likely crash and burn and eat your cat when the Development Board connects the
  //On-Board JTAG Debugger Chip to Arduino Pins D0 and D1. So do not use it with STM32Nucleo Boards with the exception of Nucleo-L476

  DEBUG_UART.Initialize(TUARTRXPins.DEBUG_UART,TUARTTXPins.DEBUG_UART);
  Buffer := '';
  DummyString := '';
  repeat
    if UART.ReadString(ReceivedString,#10,500) = true then
    begin
      //Buffer := ReceivedString+#10;
      //Buffer :=  Buffer + ReceivedString;
      if (length(Buffer) + Length(ReceivedString)) < 256 then
        Buffer := Buffer + ReceivedString;
    end
    else
    begin
      DEBUG_UART.WriteString(Buffer);
      DEBUG_UART.WriteString(#10);
      Buffer := '';
    end;
  until 1=0
end.

