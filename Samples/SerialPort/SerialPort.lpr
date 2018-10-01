program SerialPort;
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
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // This Initializes the default UART for Arduino compatible Boards (connected to pins D0 and D1 on Arduino Header)
  // On lots of Boards this UART is also looped through the On-Board JTAG Debugger Chip as an USB Device to your PC.
  // If the board is not Arduino compatible then you will have to use 'real' UARTs instead which are usually named UART0, UART1 ....
  // Also, if you plan to use more than one UART you should always use 'real' UART names to avoid accidentially using an UART twice.
  // Default Initialization is 115200,8,n,1

  UART.Initialize(TUARTRXPins.D0_UART,TUARTTXPins.D1_UART);

  //Use this when UART Pins are not passed to the On-Board JTAG Debugger like on Nucleo-L476 or SAMD20-XPRO or SAMD21-XPRO
  //DEBUG_UART.Initialize(TUARTRXPins.DEBUG_UART,TUARTTXPins.DEBUG_UART); //Use this when UART Pins are not passed to the STLink/JLink like on Nucleo-L476

  // You have also the possibility to completely have control about the UART Initialization
  //UART.Initialize;
  //UART.BaudRate := 115200;
  //UART.BitsPerWord := TUARTBitsPerWord.Eight;
  //UART.Parity := TUARTParity.None;
  //UART.StopBits := TUARTStopBits.One;
  //UART.RxPin := TUARTRXPins.D0_UART;
  //UART.TxPin := TUARTTXPins.D1_UART;

  repeat
    UART.WriteString('Hello World!'+#13+#10);
    //Use this when UART Pins are not passed to the On-Board JTAG Debugger like on Nucleo-L476 or SAMD20-XPRO or SAMD21-XPRO
    //DEBUG_UART.WriteString('Hello World!'+#13+#10); //Use this when UART Pins are not passed to the STLink/JLink like on Nucleo-L476
    SystemCore.Delay(1000);
  until 1=0
end.

