program DebugDemo;
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

//To use Logging you have to add
//-dLOGGING to your FPC commandline
//in Lazarus this means adding -dLOGGING to Project Settings->User Specific Settings

//Having Debug messages in Release code blows up the Flash Size without need
//To ensure minimum Flashsize all logging MUST be enclosed in {$IF DEFINED(LOGGING)}{$ENDIF}
//Not doing so will generate compile errors without -dLOGGING define


uses
  {$IF DEFINED(LOGGING)}
  //Enable this to output debug messages to the DEBUG_UART serial console
  MBF.__CONTROLLERTYPE__.UART,
  MBF.Logging.UART,

  //Enable this when you use JLink as your Debugger and want to use RTT Logging. For details see:
  // https://www.segger.com/products/debug-probes/j-link/technology/about-real-time-transfer/
  //
  //MBF.Logging.RTT,
  {$ENDIF}
  MBF.__CONTROLLERTYPE__.SystemCore;

begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  {$IF DEFINED(LOGGING)}
  //UART needs to get initialized after CPU Frequency is set
  Log.Initialize(DEBUG_UART,TUARTRxPins.DEBUG_UART,TUARTTxPins.DEBUG_UART);
  //RTT Logging does not need initialization
  {$ENDIF}

  while true do
  begin
    //Having Debug messages in Release code blows up the Flash Size without need
    //To ensure minimum Flashsize all logging MUST be enclosed in {$IF DEFINED(LOGGING)}{$ENDIF}
    //Not doing so will generate compile errors without -dLOGGING define
    {$IF DEFINED(LOGGING)}
    Log.d('DebugDemo','This is a log of a debug message');
    Log.e('DebugDemo','This is a log of an error message');
    Log.i('DebugDemo','This is a log of an info message');
    Log.v('DebugDemo','This is a log of a verbose message');
    Log.w('DebugDemo','This is a log of a warning message');
    {$ENDIF}
    SystemCore.Delay(2000);
  end;
end.
