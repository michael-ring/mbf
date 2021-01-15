unit MBF.STM32F3.CRC;
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
{
  Related Reference Manuals

  STM32F37xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00041563.pdf

  STM32F303xBCDE, STM32F303x68, STM32F328x8, STM32F358xC, STM32F398xE advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00043574.pdf

  STM32F334xx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00093941.pdf

  STM32F302xBCDE and STM32F302x68 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00094349.pdf

  STM32F301x68 and STM32F318x8 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00094350.pdf
}

// Code based on description and testdata available from
// http://www.sunshine2k.de/coding/javascript/crc/crc_js.html

{$INCLUDE MBF.Config.inc}

interface
{$DEFINE READ_INTERFACE}
{$I MBF.CRC.pas}
{$UNDEF READ_INTERFACE}

//type TCRC_Helper = record helper for TCRC
//end;

implementation
{$DEFINE READ_IMPLEMENTATION}
{$I MBF.CRC.pas}

end.
