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
  MBF.STM32F1.SystemCore,
  MBF.STM32F1.GPIO,
  MBF.STM32F1.UART;
var
  CRLF : String = #13#10;

begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;
  // RX/TX Pins for USART1 are usually named A10 and A9 on Bluepill Board
  USART1.Initialize(TUARTRXPins.PA10_USART1,TUARTTXPins.PA9_USART1);
  repeat
    USART1.WriteString('CPU Frequency: ');
    USART1.WriteUnsignedInt(SystemCore.GetCPUFrequency);
    USART1.WriteString(CRLF);
    USART1.WriteString('Exact Baudrate: ');
    USART1.WriteUnsignedInt(USART1.BaudRate);
    USART1.WriteString(' Baud'+CRLF);
    if (USART1.Parity = TUARTParity.None) and (USART1.BitsPerWord=TUARTBitsPerWord.Eight) and (USART1.StopBits=TUARTStopBits.One) then
    begin
      USART1.WriteString('No Parity Eight Bits, One StopBit');
      USART1.WriteString(CRLF);
    end;
    USART1.WriteString(CRLF);
    SystemCore.Delay(1000);
  until 1=0
end.
