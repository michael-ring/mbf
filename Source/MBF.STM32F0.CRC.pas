unit MBF.STM32F0.CRC;
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

  STM32F0x1STM32F0x2STM32F0x8 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00031936.pdf

  STM32F030x4x6x8xC and STM32F070x6xB advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00091010.pdf
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
