unit MBF.BitHelpers;

interface

{$INCLUDE MBF.Config.inc}

procedure ClearBit(var Value: longword; const Index: Byte);
procedure SetBit(var Value: longword; const Index: Byte);
function GetBit(const Value: longword; const Index: Byte): Boolean;

procedure ClearBit(var Value: word; const Index: Byte);
procedure SetBit(var Value: word; const Index: Byte);
function GetBit(const Value: word; const Index: Byte): Boolean;

procedure ClearBit(var Value: byte; const Index: Byte);
procedure SetBit(var Value: byte; const Index: Byte);
function GetBit(const Value: byte; const Index: Byte): Boolean;

procedure PutValue(var Value: longword; const Mask:longword; const Data:longword; const Position: Byte);
procedure PutValue(var Value: word; const Mask:word; const Data:word; const Position: Byte);
procedure PutValue(var Value: byte; const Mask:byte; const Data:byte; const Position: Byte);
procedure PutValue(var Value: longword; const Mask:longword; const Data:longword);

implementation

{$if defined(CortexM0)}
  {$define useassembler}
{$endif}

procedure ClearBit(var Value: longword; const Index: Byte);
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldr  r2, [r0]
  mov  r3, #1
  lsl  r3, r1
  bic  r2, r3
  str  r2, [r0]
  //bx lr
end;
{$else}
begin
  Value := Value and ((longword(1) shl Index) xor High(longword));
end;
{$endif}

procedure SetBit(var Value: longword; const Index: Byte);
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
  Value:=  Value or (longword(1) shl Index);
end;
{$endif}

function GetBit(const Value: longword; const Index: Byte): Boolean;
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

procedure ClearBit(var Value: word; const Index: Byte);
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

procedure SetBit(var Value: word; const Index: Byte);
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

function GetBit(const Value: word; const Index: Byte): Boolean;
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

procedure ClearBit(var Value: byte; const Index: Byte);
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

procedure SetBit(var Value: byte; const Index: Byte);
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

function GetBit(const Value: byte; const Index: Byte): Boolean;
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

procedure PutValue(var Value: longword; const Mask:longword; const Data:longword; const Position: Byte);
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldr  r4,[r0]
  bic  r4,r1
  lsl  r2,r3
  orr  r4,r2
  str  r4,[r0]
end;
{$else}
 begin
   Value:=Value AND (NOT Mask);
   Value:=Value OR ((Data) shl Position);
 end;
{$endif}

procedure PutValue(var Value: word; const Mask:word; const Data:word; const Position: Byte);
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldrh r4,[r0]
  bic  r4,r1
  lsl  r2,r3
  orr  r4,r2
  strh r4,[r0]
end;
{$else}
begin
  Value:=Value AND (NOT Mask);
  Value:=Value OR ((Data) shl Position);
end;
{$endif}

procedure PutValue(var Value: byte; const Mask:byte; const Data:byte; const Position: Byte);
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldrb r4,[r0]
  bic  r4,r1
  lsl  r2,r3
  orr  r4,r2
  strb r4,[r0]
end;
{$else}
begin
  Value:=Value AND (NOT Mask);
  Value:=Value OR ((Data) shl Position);
end;
{$endif}

procedure PutValue(var Value: longword; const Mask:longword; const Data:longword);
{$ifdef useassembler}
assembler;nostackframe;
asm
  ldr  r3,[r0]
  bic  r3,r1
  orr  r3,r2
  str  r3,[r0]
end;
{$else}
 begin
   Value:=Value AND (NOT Mask);
   Value:=Value OR Data;
 end;
{$endif}

end.

