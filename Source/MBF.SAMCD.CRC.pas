unit MBF.SAMCD.CRC;
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

// Code based on description and testdata available from
// http://www.sunshine2k.de/coding/javascript/crc/crc_js.html

{$INCLUDE MBF.Config.inc}

interface
uses
  MBF.BitHelpers;
{$DEFINE READ_INTERFACE}
{$I MBF.CRC.pas}
{$UNDEF READ_INTERFACE}

{$IF not DEFINED(SAMD20)} //SAMD20 does not have a DMA controller
type
  TCRC_Helper = record helper for TCRC
    function crc16_ccitt(pData : pByte; Count : longWord; startValue : word = $0000):word;
    function crc16_ccitt(Data : array of Byte; startValue : word = $0000):word;
    function crc32(pData : pByte; Count : longWord;StartValue : longWord = $ffffffff):longWord;
    function crc32(Data : array of Byte;StartValue : longWord = $ffffffff):longWord;
  end;
{$ENDIF}
implementation
{$DEFINE READ_IMPLEMENTATION}
{$I MBF.CRC.pas}
{$UNDEF READ_IMPLEMENTATION}

{$IF not DEFINED(SAMD20)} //SAMD20 does not have a DMA controller
//Parameters: polynom:$1021 init:$0000 ReflectInput:false ReflectOutput:false FinalXOR=$00
function TCRC_Helper.crc16_ccitt(pData : pByte; Count : longWord; startValue : word = $0000):word;
var
  data : byte;
  i : longWord;
begin
  clearBit(DMAC.CTRL,2);
  setBitsMasked(DMAC.CRCCTRL,1,%111111 shl 8,8);
  setBitsMasked(DMAC.CRCCTRL,0,%11 shl 2,2);
  setBitsMasked(DMAC.CRCCTRL,0,%11 shl 0,0);
  DMAC.CRCCHKSUM := startValue;
  setBit(DMAC.CTRL,2);
  for i := 1 to count do
  begin
    DMAC.CRCDATAIN := pData^;
    inc(pData);
  end;
  Result := DMAC.CRCCHKSUM;
  clearBit(DMAC.CTRL,2);
end;

//Parameters: polynom:$1021 init:$0000 ReflectInput:false ReflectOutput:false FinalXOR=$00
function TCRC_Helper.crc16_ccitt(Data : array of Byte; startValue : word = $0000):word;
begin
  Result := crc16_ccitt(@Data[Low(Data)],High(Data)-Low(Data),startValue);
end;

//Parameters: polynom:$04C11DB7 init:$ffffffff ReflectInput:true ReflectOutput:true FinalXOR=$ffffffff
function TCRC_Helper.crc32(pData : pByte; Count : longWord;StartValue : longWord = $ffffffff):longWord;
var
  data : byte;
  i : longWord;
begin
  clearBit(DMAC.CTRL,2);
  setBitsMasked(DMAC.CRCCTRL,1,%111111 shl 8,8);
  setBitsMasked(DMAC.CRCCTRL,1,%11 shl 2,2);
  setBitsMasked(DMAC.CRCCTRL,0,%11 shl 0,0);
  DMAC.CRCCHKSUM := ReflectLongWord(StartValue);
  for i := 1 to count do
  begin
    DMAC.CRCDATAIN := pData^;
    inc(pData);
  end;
  Result := ReflectLongWord(Result);
  Result := Result xor $ffffffff;
  clearBit(DMAC.CTRL,2);
end;

//Parameters: polynom:$04C11DB7 init:$ffffffff ReflectInput:true ReflectOutput:true FinalXOR=$ffffffff
function TCRC_Helper.crc32(Data : array of Byte; StartValue : LongWord = $ffffffff):longWord;
begin
  Result := crc32(@Data[Low(Data)],High(Data)-Low(Data),startValue);
end;
{$ENDIF}
end.
