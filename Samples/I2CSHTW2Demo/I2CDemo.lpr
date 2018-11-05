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
  heapmgr,
  MBF.TypeHelpers,
  MBF.__CONTROLLERTYPE__.Helpers,
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.UART,
  MBF.__CONTROLLERTYPE__.I2C;

var
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO) or defined(SAMC21XPRO)}
  TurnedOn: Boolean = False;
  {$endif}
  i : longWord;
  aAddress:byte;
  aData:word;
  aRawData:longword;
  aDataArray:array[0..5] of byte;
  aResult:string;

begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  //SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  //SystemCore.GetCPUFrequency;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // I am alive blinker.
  // Switch LED pin for output.
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO) or defined(SAMC21XPRO)}
  GPIO.PinMode[LED0]  := TPinMode.Output;
  GPIO.PinValue[LED0] := 0;
  {$endif}

  //To make this program plug and play we use UART named DEBUG_UART
  //It will be identical to UART on Boards that loop the Arduino Pins D0 and D1 through the On-Board JTAG Debugger Chip
  //But some Boards (like Nucleo-L476 or SAMD20-XPRO or SAMD21-XPRO) use another UART to interface to the On-Board JTAG Debugger Chip
  //So using DEBUG_UART will make sure that you always have output through the to the On-Board JTAG Debugger Chip
  DEBUG_UART.Initialize(TUARTRXPins.DEBUG_UART,TUARTTXPins.DEBUG_UART);
  DEBUG_UART.WriteString('Hello World!'+#13+#10);
  DEBUG_UART.WriteString('This is the SHTW2Xplained demo.'+#13+#10);
  DEBUG_UART.WriteString('Exact Baudrate: '+ DEBUG_UART.BaudRate.ToString);
  if (DEBUG_UART.Parity = TUARTParity.None) and (DEBUG_UART.BitsPerWord=TUARTBitsPerWord.Eight) and (DEBUG_UART.StopBits=TUARTStopBits.One) then
    DEBUG_UART.WriteString(' No Parity Eight Bits, One StopBit');
  DEBUG_UART.WriteString(#13+#10);

  // This Initializes the default I2C for Arduino compatible Boards (connected to pins D10 to D13 on Arduino Header)
  // If the board is not Arduino compatible then you will have to use 'real' I2Cs instead which are usually named I2C0, I2C1 ....
  // Also, if you plan to use more than one I2C you should always use 'real' I2C names to avoid accidentially using a I2C twice.
  // Default Initialization is 8MHz I2C Clock, Master and 8-Bit Mode
  I2C.Initialize(TI2CSDAPins.D14_I2C,TI2CSCLPins.D15_I2C);


  // GETID command of SHWT2
  for i:=0 to 1 do
  begin
    if i=0 then aAddress:=$70;
    if i=1 then aAddress:=$73;
    DEBUG_UART.WriteString('Accessing SHTW2 device with address: ');
    aResult:='$'+HexStr(aAddress,2);
    DEBUG_UART.WriteString(aResult+#13#10);
    aDataArray[0]:=$EF;
    aDataArray[1]:=$C8;
    I2C.Write(aAddress,@aDataArray,2,false);
    DEBUG_UART.WriteString('Data written.');
    Adata:=I2C.Read(aAddress,@aDataArray,3,true);
    DEBUG_UART.WriteString('Data read.');
    DEBUG_UART.WriteString('SHTW2 device ID: ');
    aResult:=HexStr(longint(aDataArray[0] shl 8)+aDataArray[1],4);
    DEBUG_UART.WriteString(aResult+#13#10);
    aData:=GetCrc8(@aDataArray,2);
    if aData<>aDataArray[2] then
      DEBUG_UART.WriteString('CRC error'+#13#10)
    else
      DEBUG_UART.WriteString('CRC ok'+#13#10);
  end;

  repeat

    for i:=0 to 1 do
    begin

      //Set I2C address
      if i=0 then aAddress:=$70;
      if i=1 then aAddress:=$73;
      DEBUG_UART.WriteString('Get data of SHTW2 device with address: ');
      aResult:='$'+HexStr(aAddress,2);
      DEBUG_UART.WriteString(aResult+#13#10);

      //Read data, temperature first, with clock-stretching
      aDataArray[0]:=$7C;
      aDataArray[1]:=$A2;
      I2C.Write(aAddress,@aDataArray,2,false);
      aData:=I2C.Read(aAddress,@aDataArray,6,true);

      //Process temperature
      aRawData:=(aDataArray[0] shl 8)+aDataArray[1];
      aData:=((10*aRawData*175) DIV 65536)-10*45;
      DEBUG_UART.WriteString('SHTW2 device temperature : ');
      System.Str(aData DIV 10,aResult);
      DEBUG_UART.WriteString(aResult);
      DEBUG_UART.WriteString(',');
      System.Str(aData MOD 10,aResult);
      DEBUG_UART.WriteString(aResult);
      aData:=GetCrc8(@aDataArray,2);
      if aData<>aDataArray[2] then
        DEBUG_UART.WriteString(' . CRC temperature error'+#13#10)
      else
        DEBUG_UART.WriteString(' . CRC temperature ok'+#13#10);

      //Process humidity
      aRawData:=(aDataArray[3] shl 8)+aDataArray[4];
      aData:=((10*aRawData*100) DIV 65536);
      DEBUG_UART.WriteString('SHTW2 device humidity    : ');
      System.Str(aData DIV 10,aResult);
      DEBUG_UART.WriteString(aResult);
      DEBUG_UART.WriteString(',');
      System.Str(aData MOD 10,aResult);
      DEBUG_UART.WriteString(aResult);
      aData:=GetCrc8(@aDataArray[3],2);
      if aData<>aDataArray[5] then
        DEBUG_UART.WriteString(' . CRC humidity error'+#13#10)
      else
        DEBUG_UART.WriteString(' . CRC humidity ok'+#13#10);

      if i=0 then DEBUG_UART.WriteString('-----------------------------------------------------------'+#13#10);
    end;

    {$if defined(SAMD20XPRO) or defined(SAMD21XPRO) or defined(SAMC21XPRO)}
    TurnedOn := not TurnedOn;

    if TurnedOn then
      GPIO.PinValue[LED0] := 1
    else
      GPIO.PinValue[LED0] := 0;
    {$endif}

    SystemCore.Delay(500);
  until 1=0;

end.
