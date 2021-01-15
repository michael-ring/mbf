unit MBF.STM32L4.CRC;
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

  STM32L4x5 and STM32L4x6 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00083560.pdf

  STM32L4x1 advanced ARM
  http://www.st.com/resource/en/reference_manual/DM00149427.pdf

  STM32L41xxx42xxx43xxx44xxx45xxx46xxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00151940.pdf

  STM32L4Rxxx and STM32L4Sxxx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00310109.pdf
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
