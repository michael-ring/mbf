program crcmethods;
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
  MBF.__CONTROLLERTYPE__.CRC;

// The default verification data, text string "123456789"
const
  DATA : array[0..8] of byte = ($31, $32, $33, $34, $35, $36, $37, $38, $39);
var
  acrc : longWord;
  pdata : pointer;
begin
  pdata := @DATA[0];
  acrc := CRC.crc8(pDATA,length(DATA));
  acrc := CRC.crc8(pDATA,length(DATA),$00);
  acrc := CRC.crc8(DATA);
  acrc := CRC.crc8(DATA,$00);

  acrc := CRC.crc8_maxim(pDATA,length(DATA));
  acrc := CRC.crc8_maxim(pDATA,length(DATA),$00);
  acrc := CRC.crc8_maxim(DATA);
  acrc := CRC.crc8_maxim(DATA,$00);

  acrc := CRC.crc8_sensirion(pDATA,length(DATA));
  acrc := CRC.crc8_sensirion(pDATA,length(DATA),$00);
  acrc := CRC.crc8_sensirion(DATA);
  acrc := CRC.crc8_sensirion(DATA,$00);

  acrc := CRC.crc16(pDATA,length(DATA));
  acrc := CRC.crc16(pDATA,length(DATA),$0000);
  acrc := CRC.crc16(DATA);
  acrc := CRC.crc16(DATA,$0000);

  acrc := CRC.crc16_ccitt(pDATA,length(DATA));
  acrc := CRC.crc16_ccitt(pDATA,length(DATA),$0000);
  acrc := CRC.crc16_ccitt(DATA);
  acrc := CRC.crc16_ccitt(DATA,$0000);

  acrc := CRC.crc16_maxim(pDATA,length(DATA));
  acrc := CRC.crc16_maxim(pDATA,length(DATA),$0000);
  acrc := CRC.crc16_maxim(DATA);
  acrc := CRC.crc16_maxim(DATA,$0000);

  acrc := CRC.crc32(pDATA,length(DATA));
  acrc := CRC.crc32(pDATA,length(DATA),$00000000);
  acrc := CRC.crc32(DATA);
  acrc := CRC.crc32(DATA,$00000000);

  acrc := CRC.crc32_posix(pDATA,length(DATA),$00000000);
  acrc := CRC.crc32_posix(pDATA,length(DATA));
  acrc := CRC.crc32_posix(DATA);
  acrc := CRC.crc32_posix(DATA,$00000000);
end.
