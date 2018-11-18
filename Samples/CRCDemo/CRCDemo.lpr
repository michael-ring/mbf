
program CRCDemo;
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
  HeapMgr,
  MBF.__CONTROLLERTYPE__.CRC,
  MBF.__CONTROLLERTYPE__.SystemCore;

// The default verification data, text string "123456789"
const
  DATA : array[0..8] of byte = ($31, $32, $33, $34, $35, $36, $37, $38, $39);
var
  acrc : longWord;
begin
  SystemCore.Initialize;
  SystemCore.SetCPUFrequency(SystemCore.getMaxCPUFrequency);
  while true do
  begin
    acrc := CRC.crc8(DATA,length(DATA));
    if acrc = $F4 then
      writeln('acrc8 is        correct')
    else
      writeln('acrc8 is        not correct');

    acrc := CRC.crc8_maxim(DATA,length(DATA));
    if acrc = $A1 then
      writeln('acrc8_maxim is  correct')
    else
      writeln('acrc8_maxim is  not correct');

    acrc := CRC.crc16(DATA,length(DATA));
    if acrc = $BB3D then
      writeln('acrc16 is       correct')
    else
      writeln('acrc16 is       not correct');

    acrc := CRC.crc16_maxim(DATA,length(DATA));
    if acrc = $44C2 then
      writeln('acrc16_maxim is correct')
    else
      writeln('acrc16_maxim is not correct');

    acrc := CRC.crc32(DATA,length(DATA));
    if acrc = $CBF43926 then
      writeln('acrc32 is       correct')
    else
      writeln('acrc32 is       not correct');

    acrc := CRC.crc32_posix(DATA,length(DATA));
    if acrc = $765E7680 then
      writeln('acrc32_posix is correct')
    else
      writeln('acrc32_posix is not correct');
  end;
end.
