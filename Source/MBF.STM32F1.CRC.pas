unit MBF.STM32F1.CRC;
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

  STM32F100xx advanced ARM
  http://www.st.com/resource/en/reference_manual/CD00246267.pdf

  STM32F101xx, STM32F102xx, STM32F103xx, STM32F105xx and STM32F107xx advanced Arm
  http://www.st.com/resource/en/reference_manual/CD00171190.pdf
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
