unit MBF.BitHelpers;
{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  Copyright (c) 2018 -  Alfred Glänzer

  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}  

interface

{$INCLUDE MBF.Config.inc}

type
  TByteIndex = 0..7;
  TWordIndex = 0..15;
  TLongWordIndex = 0..31;
  TBitLevel=(Low=0,High=1);
  TBitValue=0..1;
  TCrumbValue=0..3;
  TNibbleValue=0..15;

// LongWord Implementation
procedure SetBitValue(var Destination: longword; const aBitValue : TBitValue; const Index: TLongWordIndex); inline;
procedure ClearBit(var Destination: longword; const Index: TLongWordIndex); inline;
procedure SetBit(var Destination: longword; const Index: TLongWordIndex); inline;
function  GetBit(var Source : longWord; const Index: TLongWordIndex): TBitValue; inline;
function  GetBitValue(var Source : longWord; const Index: TLongWordIndex): TBitValue; inline;

procedure SetBitLevel(var Destination: longword; const aBitLevel : TBitLevel; const Index: TLongWordIndex); inline;
procedure SetBitLevelHigh(var Destination: longword; const Index: TLongWordIndex); inline;
procedure SetBitLevelLow(var Destination : longWord; const Index: TLongWordIndex); inline;
function  GetBitLevel(var Source : longWord; const Index: TLongWordIndex): TBitLevel; inline;

function  GetCrumb(var Source : longWord; const Index: TLongWordIndex):TCrumbValue;
procedure SetCrumb(var Destination: longword; const aCrumbValue : TCrumbValue; const Index: TLongWordIndex); inline;

function  GetNibble(var Source : longWord; const Index: TLongWordIndex):TNibbleValue;
procedure SetNibble(var Destination: longword; const aNibbleValue : TNibbleValue; const Index: TLongWordIndex); inline;

procedure SetBitsMasked(var Destination: longword; const Value : longWord; const Mask : longWord; const MaskIndex: TLongWordIndex); inline;
function  GetBitsMasked(var Source: longWord; const Mask : longWord; const MaskIndex: TLongWordIndex): longWord; inline;

procedure WaitBitIsSet(var Source : longWord;const Index: TLongWordIndex); inline;
procedure WaitBitIsCleared(var Source : longWord;const Index: TLongWordIndex); inline;
function WaitBitIsSet(var Source : longWord;const Index: TLongWordIndex; const ExpireTickCount : longWord):boolean; inline;
function WaitBitIsCleared(var Source : longWord;const Index: TLongWordIndex; const ExpireTickCount : longWord):boolean; inline;

// Word Implementation
procedure SetBitValue(var Destination: Word; const aBitValue : TBitValue; const Index: TWordIndex); inline;
procedure ClearBit(var Destination: Word; const Index: TWordIndex); inline;
procedure SetBit(var Destination: Word; const Index: TWordIndex); inline;
function  GetBit(var Source : Word; const Index: TWordIndex): TBitValue; inline;
function  GetBitValue(var Source : Word; const Index: TWordIndex): TBitValue; inline;

procedure SetBitLevel(var Destination: Word; const aBitLevel : TBitLevel; const Index: TWordIndex); inline;
procedure SetBitLevelHigh(var Destination: Word; const Index: TWordIndex); inline;
procedure SetBitLevelLow(var Destination : Word; const Index: TWordIndex); inline;
function  GetBitLevel(var Source : Word; const Index: TWordIndex): TBitLevel; inline;

function  GetCrumb(var Source : Word; const Index: TLongWordIndex):TCrumbValue;
procedure SetCrumb(var Destination: Word; const aCrumbValue : TCrumbValue; const Index: TLongWordIndex); inline;

function  GetNibble(var Source : Word; const Index: TLongWordIndex):TNibbleValue;
procedure SetNibble(var Destination: Word; const aNibbleValue : TNibbleValue; const Index: TLongWordIndex); inline;

procedure SetBitsMasked(var Destination: Word; const Value : Word; const Mask : Word; const MaskIndex: TWordIndex); inline;
function  GetBitsMasked(var Source: Word; const Mask : Word; const MaskIndex: TWordIndex): Word; inline;

procedure WaitBitIsSet(var Source : Word;const Index: TWordIndex); inline;
procedure WaitBitIsCleared(var Source : Word;const Index: TWordIndex); inline;
function WaitBitIsSet(var Source : Word;const Index: TWordIndex; const ExpireTickCount : longWord):boolean; inline;
function WaitBitIsCleared(var Source : Word;const Index: TWordIndex; const ExpireTickCount : longWord):boolean; inline;

// Byte Implementation
procedure SetBitValue(var Destination: Byte; const aBitValue : TBitValue; const Index: TByteIndex); inline;
procedure ClearBit(var Destination: Byte; const Index: TByteIndex); inline;
procedure SetBit(var Destination: Byte; const Index: TByteIndex); inline;
function  GetBit(var Source : Byte; const Index: TByteIndex): TBitValue; inline;
function  GetBitValue(var Source : Byte; const Index: TByteIndex): TBitValue; inline;

procedure SetBitLevel(var Destination: Byte; const aBitLevel : TBitLevel; const Index: TByteIndex); inline;
procedure SetBitLevelHigh(var Destination: Byte; const Index: TByteIndex); inline;
procedure SetBitLevelLow(var Destination : Byte; const Index: TByteIndex); inline;
function  GetBitLevel(var Source : Byte; const Index: TByteIndex): TBitLevel; inline;

function  GetCrumb(var Source : Byte; const Index: TLongWordIndex):TCrumbValue;
procedure SetCrumb(var Destination: Byte; const aCrumbValue : TCrumbValue; const Index: TLongWordIndex); inline;

function  GetNibble(var Source : Byte; const Index: TLongWordIndex):TNibbleValue;
procedure SetNibble(var Destination: Byte; const aNibbleValue : TNibbleValue; const Index: TLongWordIndex); inline;

procedure SetBitsMasked(var Destination: Byte; const Value : Byte; const Mask : Byte; const MaskIndex: TByteIndex); inline;
function  GetBitsMasked(var Source: Byte; const Mask : Byte; const MaskIndex: TByteIndex): Byte; inline;

procedure WaitBitIsSet(var Source : Byte;const Index: TByteIndex); inline;
procedure WaitBitIsCleared(var Source : Byte;const Index: TByteIndex); inline;
function WaitBitIsSet(var Source : Byte;const Index: TByteIndex; const ExpireTickCount : longWord):boolean; inline;
function WaitBitIsCleared(var Source : Byte;const Index: TByteIndex; const ExpireTickCount : longWord):boolean; inline;

implementation
uses
  MBF.__CONTROLLERTYPE__.SystemCore;


procedure SetBitValue(var Destination: longword; const aBitValue : TBitValue; const Index: TLongWordIndex); inline;
begin
  if aBitValue = 1 then
    Destination := Destination or longWord(%1 shl Index)
  else
    Destination := Destination and longWord(not (%1 shl Index));
end;

procedure SetBitZero(var Destination: longword; const Index: TLongWordIndex); inline;
begin
  Destination := Destination and (not (%1 shl Index));
end;

procedure ClearBit(var Destination: longword; const Index: TLongWordIndex); inline;
begin
  Destination := Destination and (not (%1 shl Index));
end;

procedure SetBitOne(var Destination: longword; const Index: TLongWordIndex); inline;
begin
  Destination := Destination or longWord(%1 shl Index)
end;

procedure SetBit(var Destination: longword; const Index: TLongWordIndex); inline;
begin
  Destination := Destination or longWord(%1 shl Index)
end;

function  GetBit(var Source : longWord; const Index: TLongWordIndex): TBitValue; inline;
begin
  Result := (Source shr Index) and %1;
end;

function  GetBitValue(var Source : longWord; const Index: TLongWordIndex): TBitValue; inline;
begin
  Result := (Source shr Index) and %1;
end;

procedure SetBitLevel(var Destination: longword; const aBitLevel : TBitLevel; const Index: TLongWordIndex); inline;
begin
  if aBitLevel = TBitLevel.High then
    Destination := Destination or longWord(%1 shl Index)
  else
    Destination := Destination and longWord(not (%1 shl Index));
end;

procedure SetBitLevelHigh(var Destination: longword; const Index: TLongWordIndex); inline;
begin
  Destination := Destination or longWord(%1 shl Index);
end;

procedure SetBitLevelLow(var Destination : longWord; const Index: TLongWordIndex); inline;
begin
  Destination := Destination and longWord(not (%1 shl Index));
end;

function  GetBitLevel(var Source : longWord; const Index: TLongWordIndex): TBitLevel; inline;
begin
  Result := TBitLevel((Source shr Index) and %1);
end;

procedure SetCrumb(var Destination: longword; const aCrumbValue : TCrumbValue; const Index: TLongWordIndex); inline;
begin
  Destination := (Destination and (not (%11 shl index))) or (longWord((aCrumbValue and %11) shl Index));
end;

function  GetCrumb(var Source: longWord;const Index: TLongWordIndex): TCrumbValue; inline;
begin
  Result := (Source shr Index) and %11;
end;

procedure SetNibble(var Destination: longword; const aNibbleValue : TNibbleValue; const Index: TLongWordIndex); inline;
begin
  Destination := (Destination and (not (%1111 shl Index))) or (longWord((aNibbleValue and %1111) shl Index));
end;

function  GetNibble(var Source: longWord;const Index: TLongWordIndex): TNibbleValue; inline;
begin
  Result := (Source shr Index) and %1111;
end;

procedure SetBitsMasked(var Destination: longword; const Value : longWord; const Mask : longWord; const MaskIndex: TLongWordIndex); inline;
begin
  Destination := (Destination and (not Mask)) or (longWord(Value shl MaskIndex) and Mask);
end;

function  GetBitsMasked(var Source: longWord; const Mask : longWord; const MaskIndex: TLongWordIndex): longWord; inline;
begin
  Result := (Source shr MaskIndex) and (Mask shr MaskIndex);
end;

procedure WaitBitIsSet(var Source : longWord;const Index: TLongWordIndex); inline;
begin
  repeat
  until (Source and (%1 shl Index)) <> 0;
end;

procedure WaitBitIsCleared(var Source : longWord;const Index: TLongWordIndex); inline;
begin
  repeat
  until (Source and (%1 shl Index)) = 0;
end;

function WaitBitIsSet(var Source : longWord;const Index: TLongWordIndex; const ExpireTickCount : longWord):boolean; inline;
begin
  result := false;
  repeat
    if (Source and (%1 shl Index)) <> 0 then
    begin
      result := true;
      exit;
    end;
  until SystemCore.GetTickCount > ExpireTickCount;
end;

function WaitBitIsCleared(var Source : longWord;const Index: TLongWordIndex; const ExpireTickCount : longWord):boolean; inline;
begin
  result := false;
  repeat
    if (Source and (%1 shl Index)) = 0 then
    begin
      result := true;
      exit;
    end;
  until SystemCore.GetTickCount > ExpireTickCount;
end;

// Word Implementation

procedure SetBitValue(var Destination: Word; const aBitValue : TBitValue; const Index: TWordIndex); inline;
begin
  if aBitValue = 1 then
    Destination := Destination or Word(%1 shl Index)
  else
    Destination := Destination and Word(not (%1 shl Index));
end;

procedure ClearBit(var Destination: Word; const Index: TWordIndex); inline;
begin
  Destination := Destination and Word(not (%1 shl Index));
end;

procedure SetBit(var Destination: Word; const Index: TWordIndex); inline;
begin
  Destination := Destination or Word(%1 shl Index)
end;

function  GetBit(var Source : Word; const Index: TWordIndex): TBitValue; inline;
begin
  Result := (Source shr Index) and Word(%1);
end;

function  GetBitValue(var Source : Word; const Index: TWordIndex): TBitValue; inline;
begin
  Result := (Source shr Index) and Word(%1);
end;

procedure SetBitLevel(var Destination: Word; const aBitLevel : TBitLevel; const Index: TWordIndex); inline;
begin
  if aBitLevel = TBitLevel.High then
    Destination := Destination or Word(%1 shl Index)
  else
    Destination := Destination and Word(not (%1 shl Index));
end;

procedure SetBitLevelHigh(var Destination: Word; const Index: TWordIndex); inline;
begin
  Destination := Destination or Word(%1 shl Index);
end;

procedure SetBitLevelLow(var Destination : Word; const Index: TWordIndex); inline;
begin
  Destination := Destination and Word(not (%1 shl Index));
end;

function  GetBitLevel(var Source : Word; const Index: TWordIndex): TBitLevel; inline;
begin
  Result := TBitLevel((Source shr Index) and Word(%1));
end;

procedure SetCrumb(var Destination: Word; const aCrumbValue : TCrumbValue; const Index: TLongWordIndex); inline;
begin
  Destination := (Destination and (not (%11 shl index))) or (((aCrumbValue and %11) shl Index));
end;

function  GetCrumb(var Source: Word;const Index: TLongWordIndex): TCrumbValue; inline;
begin
  Result := (Source shr Index) and %11;
end;

procedure SetNibble(var Destination: Word; const aNibbleValue : TNibbleValue; const Index: TLongWordIndex); inline;
begin
  Destination := (Destination and (not (%1111 shl Index))) or (((aNibbleValue and %1111) shl Index));
end;

function  GetNibble(var Source: Word;const Index: TLongWordIndex): TNibbleValue; inline;
begin
  Result := (Source shr Index) and %1111;
end;

procedure SetBitsMasked(var Destination: Word; const Value : Word; const Mask : Word; const MaskIndex: TWordIndex); inline;
begin
  Destination := (Destination and (not Mask)) or ((Value shl MaskIndex) and Mask);
end;

function  GetBitsMasked(var Source: Word; const Mask : Word; const MaskIndex: TWordIndex): Word; inline;
begin
  Result := (Source shr MaskIndex) and (Mask shr MaskIndex);
end;

procedure WaitBitIsSet(var Source : Word;const Index: TWordIndex); inline;
begin
  repeat
  until (Source and (%1 shl Index)) <> 0;
end;

procedure WaitBitIsCleared(var Source : Word;const Index: TWordIndex); inline;
begin
  repeat
  until (Source and (%1 shl Index)) = 0;
end;

function WaitBitIsSet(var Source : Word;const Index: TWordIndex; const ExpireTickCount : longWord):boolean; inline;
begin
  result := false;
  repeat
    if (Source and (%1 shl Index)) <> 0 then
    begin
      result := true;
      exit;
    end;
  until SystemCore.GetTickCount > ExpireTickCount;
end;

function WaitBitIsCleared(var Source : Word;const Index: TWordIndex; const ExpireTickCount : longWord):boolean; inline;
begin
  result := false;
  repeat
    if (Source and (%1 shl Index)) = 0 then
    begin
      result := true;
      exit;
    end;
  until SystemCore.GetTickCount > ExpireTickCount;
end;

// Byte Implementation

procedure SetBitValue(var Destination: Byte; const aBitValue : TBitValue; const Index: TByteIndex); inline;
begin
  if aBitValue = 1 then
    Destination := Destination or Byte(%1 shl Index)
  else
    Destination := Destination and Byte(not (%1 shl Index));
end;

procedure ClearBit(var Destination: Byte; const Index: TByteIndex); inline;
begin
  Destination := Destination and Byte(not (%1 shl Index));
end;

procedure SetBit(var Destination: Byte; const Index: TByteIndex); inline;
begin
  Destination := Destination or Byte(%1 shl Index)
end;

function  GetBit(var Source : Byte; const Index: TByteIndex): TBitValue; inline;
begin
  Result := (Source shr Index) and Byte(%1);
end;

function  GetBitValue(var Source : Byte; const Index: TByteIndex): TBitValue; inline;
begin
  Result := (Source shr Index) and Byte(%1);
end;

procedure SetBitLevel(var Destination: Byte; const aBitLevel : TBitLevel; const Index: TByteIndex); inline;
begin
  if aBitLevel = TBitLevel.High then
    Destination := Destination or Byte(%1 shl Index)
  else
    Destination := Destination and Byte(not (%1 shl Index));
end;


procedure SetBitLevelHigh(var Destination: Byte; const Index: TByteIndex); inline;
begin
  Destination := Destination or Byte(%1 shl Index);
end;

procedure SetBitLevelLow(var Destination : Byte; const Index: TByteIndex); inline;
begin
  Destination := Destination and Byte(not (%1 shl Index));
end;

function  GetBitLevel(var Source : Byte; const Index: TByteIndex): TBitLevel; inline;
begin
  Result := TBitLevel((Source shr Index) and Byte(%1));
end;

procedure SetCrumb(var Destination: Byte; const aCrumbValue : TCrumbValue; const Index: TLongWordIndex); inline;
begin
  Destination := (Destination and (not (%11 shl index))) or (((aCrumbValue and %11) shl Index));
end;

function  GetCrumb(var Source: Byte;const Index: TLongWordIndex): TCrumbValue; inline;
begin
  Result := (Source shr Index) and %11;
end;

procedure SetNibble(var Destination: Byte; const aNibbleValue : TNibbleValue; const Index: TLongWordIndex); inline;
begin
  Destination := (Destination and (not (%1111 shl Index))) or (((aNibbleValue and %1111) shl Index));
end;

function  GetNibble(var Source: Byte;const Index: TLongWordIndex): TNibbleValue; inline;
begin
  Result := (Source shr Index) and %1111;
end;

procedure SetBitsMasked(var Destination: Byte; const Value : Byte; const Mask : Byte; const MaskIndex: TByteIndex); inline;
begin
  Destination := (Destination and (not Mask)) or ((Value shl MaskIndex) and Mask);
end;

function  GetBitsMasked(var Source: Byte; const Mask : Byte; const MaskIndex: TByteIndex): Byte; inline;
begin
  Result := (Source shr MaskIndex) and (Mask shr MaskIndex);
end;

procedure WaitBitIsSet(var Source : Byte;const Index: TByteIndex); inline;
begin
  repeat
  until (Source and (%1 shl Index)) <> 0;
end;

procedure WaitBitIsCleared(var Source : Byte;const Index: TByteIndex); inline;
begin
  repeat
  until (Source and (%1 shl Index)) = 0;
end;

function WaitBitIsSet(var Source : Byte;const Index: TByteIndex; const ExpireTickCount : longWord):boolean; inline;
begin
  result := false;
  repeat
    if (Source and (%1 shl Index)) <> 0 then
    begin
      result := true;
      exit;
    end;
  until SystemCore.GetTickCount > ExpireTickCount;
end;

function WaitBitIsCleared(var Source : Byte;const Index: TByteIndex; const ExpireTickCount : longWord):boolean; inline;
begin
  result := false;
  repeat
    if (Source and (%1 shl Index)) = 0 then
    begin
      result := true;
      exit;
    end;
  until SystemCore.GetTickCount > ExpireTickCount;
end;


(*

{$if defined(CortexM0)}
  {$define useassembler}
{$endif}

procedure ClearBit(var Value: longword; const Index: Byte); inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldr  r2, [r0]
  mov  r3, #1
  lsl  r3, r1
  bic  r2, r3
  str  r2, [r0]
end;
{$else}
begin
  Value := Value and ((longWord(1) shl Index) xor High(longWord));
end;
{$endif}

procedure SetBit(var Value: longword; const Index: Byte); inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldr  r2, [r0]
  mov  r3, #1
  lsl  r3, r1
  orr  r2, r3
  str  r2, [r0]
end;
{$else}
begin
  Value:=  Value or (%1 shl Index);
end;
{$endif}

function GetBit(const Value: longword; const Index: Byte): Boolean; inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  mov  r2, #1
  lsl  r2, r1
  tst  r0, r2
  bne  .LLongWordResultTrue
  mov  r0,#0
  b    .LLongWordResultStore
.LLongWordResultTrue:
  mov  r0,#1
.LLongWordResultStore:
end;
{$else}
begin
  Result := ((Value shr Index) and 1) = 1;
end;
{$endif}

procedure ClearBit(var Value: word; const Index: Byte); inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldrh  r2, [r0]
  mov   r3, #1
  lsl   r3, r1
  bic   r2, r3
  strh  r2, [r0]
end;
{$else}
begin
  Value := Value and ((word(1) shl Index) xor High(word));
end;
{$endif}

procedure SetBit(var Value: word; const Index: Byte); inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldrh  r2, [r0]
  mov   r3, #1
  lsl   r3, r1
  orr   r2, r3
  strh  r2, [r0]
end;
{$else}
begin
  Value:=  Value or (word(1) shl Index);
end;
{$endif}

function GetBit(const Value: word; const Index: Byte): Boolean;  inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  mov  r2, #1
  lsl  r2, r1
  tst  r0, r2
  bne  .LWordResultTrue
  mov  r0,#0
  b    .LWordResultStore
.LWordResultTrue:
  mov  r0,#1
.LWordResultStore:
end;
{$else}
begin
  Result := ((Value shr Index) and 1) = 1;
end;
{$endif}

procedure ClearBit(var Value: byte; const Index: Byte); inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldrb  r2, [r0]
  mov   r3, #1
  lsl   r3, r1
  bic   r2, r3
  strb  r2, [r0]
end;
{$else}
begin
  Value := Value and ((byte(1) shl Index) xor High(byte));
end;
{$endif}

procedure SetBit(var Value: byte; const Index: Byte); inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldrb  r2, [r0]
  mov   r3, #1
  lsl   r3, r1
  orr   r2, r3
  strb  r2, [r0]
end;
{$else}
begin
  Value:=  Value or (byte(1) shl Index);
end;
{$endif}

function GetBit(const Value: byte; const Index: Byte): Boolean; inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  mov  r2, #1
  lsl  r2, r1
  tst  r0, r2
  bne  .LByteResultTrue
  mov  r0,#0
  b    .LByteResultStore
.LByteResultTrue:
  mov  r0,#1
.LByteResultStore:
end;
{$else}
begin
  Result := (byte(Value shr Index) and byte(1)) = 1;
end;
{$endif}

function WaitBitSet(var Value : byte;const Index: Byte; const TimeOut : integer=-1):boolean; inline;
begin
  while Value and (1 shl Index) = 0 do
    ;
  Result := true;
end;

function WaitBitSet(var Value : Word;const Index: Byte; const TimeOut : integer=-1):boolean; inline;
begin
  while Value and (1 shl Index) = 0 do
    ;
  Result := true;
end;

function WaitBitSet(var Value : longWord;const Index: Byte; const TimeOut : integer=-1):boolean; inline;
begin
  while Value and (1 shl Index) = 0 do
    ;
  Result := true;
end;

function WaitBitCleared(var Value : byte;const Index: Byte; const TimeOut : integer=-1):boolean; inline;
begin
  while Value and (1 shl Index) <> 0 do
    ;
  Result := true;
end;

function WaitBitCleared(var Value : word;const Index: Byte; const TimeOut : integer=-1):boolean; inline;
begin
  while Value and (1 shl Index) <> 0 do
    ;
  Result := true;
end;

function WaitBitCleared(var Value : longWord;const Index: Byte; const TimeOut : integer=-1):boolean; inline;
begin
  while Value and (1 shl Index) <> 0 do
    ;
  Result := true;
end;

procedure PutValue(var Value: longword; const Mask:longword; const Data:longword; const Position: Byte); inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  lsl  r2, r3
  ldr  r3, [r0]
  bic  r3, r1
  orr  r3, r2
  str  r3, [r0]
end;

{$else}
 begin
   Value:=(Value AND (NOT Mask)) OR ((Data) shl Position);
 end;
{$endif}

procedure PutValue(var Value: word; const Mask:word; const Data:word; const Position: Byte); inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  lsl  r2, r3
  ldrh r3, [r0]
  bic  r3, r1
  orr  r3, r2
  strh r3, [r0]
end;
{$else}
begin
  Value:=(Value AND (NOT Mask)) OR ((Data) shl Position);
end;
{$endif}

procedure PutValue(var Value: byte; const Mask:byte; const Data:byte; const Position: Byte); inline;
{$ifdef useassembler}
assembler;nostackframe;
asm
  lsl  r2, r3
  ldrb r3, [r0]
  bic  r3, r1
  orr  r3, r2
  strb r3, [r0]
end;
{$else}
begin
  Value:=(Value AND (NOT Mask)) OR ((Data) shl Position);
end;
{$endif}

function GetValue(var Source: longword; const Mask:longword; const Position: Byte):longWord; inline;
begin
  Result := (Source AND Mask) shr Position);
end;

function GetValue(var Source: Word; const Mask:Word; const Position: Byte):Word; inline;
begin
  Result := (Source AND Mask) shr Position);
end;

function GetValue(var Source: Byte; const Mask:Byte; const Position: Byte):Byte; inline;
begin
  Result := (Source AND Mask) shr Position);
end;
*)
end.
