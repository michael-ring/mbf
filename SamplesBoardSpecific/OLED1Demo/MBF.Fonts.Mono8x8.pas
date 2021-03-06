unit MBF.Fonts.Mono8x8;

{$mode objfpc}

interface

uses
  MBF.Displays.CustomDisplay;

const
  Mono8x8_FontData : array[0..254] of array[0..4] of byte =
    (
    ($0, $0, $0, $0, $0),
    ($7C, $DA, $F2, $DA, $7C),
    ($7C, $D6, $F2, $D6, $7C),
    ($38, $7C, $3E, $7C, $38),
    ($18, $3C, $7E, $3C, $18),
    ($38, $EA, $BE, $EA, $38),
    ($38, $7A, $FE, $7A, $38),
    ($0, $18, $3C, $18, $0),
    ($FF, $E7, $C3, $E7, $FF),
    ($0, $18, $24, $18, $0),
    ($FF, $E7, $DB, $E7, $FF),
    ($C, $12, $5C, $60, $70),
    ($64, $94, $9E, $94, $64),
    ($2, $FE, $A0, $A0, $E0),
    ($2, $FE, $A0, $A4, $FC),
    ($5A, $3C, $E7, $3C, $5A),
    ($FE, $7C, $38, $38, $10),
    ($10, $38, $38, $7C, $FE),
    ($28, $44, $FE, $44, $28),
    ($FA, $FA, $0, $FA, $FA),
    ($60, $90, $FE, $80, $FE),
    ($0, $66, $91, $A9, $56),
    ($6, $6, $6, $6, $6),
    ($29, $45, $FF, $45, $29),
    ($10, $20, $7E, $20, $10),
    ($8, $4, $7E, $4, $8),
    ($10, $10, $54, $38, $10),
    ($10, $38, $54, $10, $10),
    ($78, $8, $8, $8, $8),
    ($30, $78, $30, $78, $30),
    ($C, $1C, $7C, $1C, $C),
    ($60, $70, $7C, $70, $60),
    ($0, $0, $0, $0, $0),
    ($0, $0, $FA, $0, $0),
    ($0, $E0, $0, $E0, $0),
    ($28, $FE, $28, $FE, $28),
    ($24, $54, $FE, $54, $48),
    ($C4, $C8, $10, $26, $46),
    ($6C, $92, $6A, $4, $A),
    ($0, $10, $E0, $C0, $0),
    ($0, $38, $44, $82, $0),
    ($0, $82, $44, $38, $0),
    ($54, $38, $FE, $38, $54),
    ($10, $10, $7C, $10, $10),
    ($0, $1, $E, $C, $0),
    ($10, $10, $10, $10, $10),
    ($0, $0, $6, $6, $0),
    ($4, $8, $10, $20, $40),
    ($7C, $8A, $92, $A2, $7C),
    ($0, $42, $FE, $2, $0),
    ($4E, $92, $92, $92, $62),
    ($84, $82, $92, $B2, $CC),
    ($18, $28, $48, $FE, $8),
    ($E4, $A2, $A2, $A2, $9C),
    ($3C, $52, $92, $92, $8C),
    ($82, $84, $88, $90, $E0),
    ($6C, $92, $92, $92, $6C),
    ($62, $92, $92, $94, $78),
    ($0, $0, $28, $0, $0),
    ($0, $2, $2C, $0, $0),
    ($0, $10, $28, $44, $82),
    ($28, $28, $28, $28, $28),
    ($0, $82, $44, $28, $10),
    ($40, $80, $9A, $90, $60),
    ($7C, $82, $BA, $9A, $72),
    ($3E, $48, $88, $48, $3E),
    ($FE, $92, $92, $92, $6C),
    ($7C, $82, $82, $82, $44),
    ($FE, $82, $82, $82, $7C),
    ($FE, $92, $92, $92, $82),
    ($FE, $90, $90, $90, $80),
    ($7C, $82, $82, $8A, $CE),
    ($FE, $10, $10, $10, $FE),
    ($0, $82, $FE, $82, $0),
    ($4, $2, $82, $FC, $80),
    ($FE, $10, $28, $44, $82),
    ($FE, $2, $2, $2, $2),
    ($FE, $40, $38, $40, $FE),
    ($FE, $20, $10, $8, $FE),
    ($7C, $82, $82, $82, $7C),
    ($FE, $90, $90, $90, $60),
    ($7C, $82, $8A, $84, $7A),
    ($FE, $90, $98, $94, $62),
    ($64, $92, $92, $92, $4C),
    ($C0, $80, $FE, $80, $C0),
    ($FC, $2, $2, $2, $FC),
    ($F8, $4, $2, $4, $F8),
    ($FC, $2, $1C, $2, $FC),
    ($C6, $28, $10, $28, $C6),
    ($C0, $20, $1E, $20, $C0),
    ($86, $9A, $92, $B2, $C2),
    ($0, $FE, $82, $82, $82),
    ($40, $20, $10, $8, $4),
    ($0, $82, $82, $82, $FE),
    ($20, $40, $80, $40, $20),
    ($2, $2, $2, $2, $2),
    ($0, $C0, $E0, $10, $0),
    ($4, $2A, $2A, $1E, $2),
    ($FE, $14, $22, $22, $1C),
    ($1C, $22, $22, $22, $14),
    ($1C, $22, $22, $14, $FE),
    ($1C, $2A, $2A, $2A, $18),
    ($0, $10, $7E, $90, $40),
    ($18, $25, $25, $39, $1E),
    ($FE, $10, $20, $20, $1E),
    ($0, $22, $BE, $2, $0),
    ($4, $2, $2, $BC, $0),
    ($FE, $8, $14, $22, $0),
    ($0, $82, $FE, $2, $0),
    ($3E, $20, $1E, $20, $1E),
    ($3E, $10, $20, $20, $1E),
    ($1C, $22, $22, $22, $1C),
    ($3F, $18, $24, $24, $18),
    ($18, $24, $24, $18, $3F),
    ($3E, $10, $20, $20, $10),
    ($12, $2A, $2A, $2A, $24),
    ($20, $20, $FC, $22, $24),
    ($3C, $2, $2, $4, $3E),
    ($38, $4, $2, $4, $38),
    ($3C, $2, $C, $2, $3C),
    ($22, $14, $8, $14, $22),
    ($32, $9, $9, $9, $3E),
    ($22, $26, $2A, $32, $22),
    ($0, $10, $6C, $82, $0),
    ($0, $0, $EE, $0, $0),
    ($0, $82, $6C, $10, $0),
    ($40, $80, $40, $20, $40),
    ($3C, $64, $C4, $64, $3C),
    ($78, $85, $85, $86, $48),
    ($5C, $2, $2, $4, $5E),
    ($1C, $2A, $2A, $AA, $9A),
    ($84, $AA, $AA, $9E, $82),
    ($84, $2A, $2A, $1E, $82),
    ($84, $AA, $2A, $1E, $2),
    ($4, $2A, $AA, $9E, $2),
    ($30, $78, $4A, $4E, $48),
    ($9C, $AA, $AA, $AA, $9A),
    ($9C, $2A, $2A, $2A, $9A),
    ($9C, $AA, $2A, $2A, $1A),
    ($0, $0, $A2, $3E, $82),
    ($0, $40, $A2, $BE, $42),
    ($0, $80, $A2, $3E, $2),
    ($F, $94, $24, $94, $F),
    ($F, $14, $A4, $14, $F),
    ($3E, $2A, $AA, $A2, $0),
    ($4, $2A, $2A, $3E, $2A),
    ($3E, $50, $90, $FE, $92),
    ($4C, $92, $92, $92, $4C),
    ($4C, $12, $12, $12, $4C),
    ($4C, $52, $12, $12, $C),
    ($5C, $82, $82, $84, $5E),
    ($5C, $42, $2, $4, $1E),
    ($0, $B9, $5, $5, $BE),
    ($9C, $22, $22, $22, $9C),
    ($BC, $2, $2, $2, $BC),
    ($3C, $24, $FF, $24, $24),
    ($12, $7E, $92, $C2, $66),
    ($D4, $F4, $3F, $F4, $D4),
    ($FF, $90, $94, $6F, $4),
    ($3, $11, $7E, $90, $C0),
    ($4, $2A, $2A, $9E, $82),
    ($0, $0, $22, $BE, $82),
    ($C, $12, $12, $52, $4C),
    ($1C, $2, $2, $44, $5E),
    ($0, $5E, $50, $50, $4E),
    ($BE, $B0, $98, $8C, $BE),
    ($64, $94, $94, $F4, $14),
    ($64, $94, $94, $94, $64),
    ($C, $12, $B2, $2, $4),
    ($1C, $10, $10, $10, $10),
    ($10, $10, $10, $10, $1C),
    ($F4, $8, $13, $35, $5D),
    ($F4, $8, $14, $2C, $5F),
    ($0, $0, $DE, $0, $0),
    ($10, $28, $54, $28, $44),
    ($44, $28, $54, $28, $10),
    ($55, $0, $AA, $0, $55),
    ($55, $AA, $55, $AA, $55),
    ($AA, $55, $AA, $55, $AA),
    ($0, $0, $0, $FF, $0),
    ($8, $8, $8, $FF, $0),
    ($28, $28, $28, $FF, $0),
    ($8, $8, $FF, $0, $FF),
    ($8, $8, $F, $8, $F),
    ($28, $28, $28, $3F, $0),
    ($28, $28, $EF, $0, $FF),
    ($0, $0, $FF, $0, $FF),
    ($28, $28, $2F, $20, $3F),
    ($28, $28, $E8, $8, $F8),
    ($8, $8, $F8, $8, $F8),
    ($28, $28, $28, $F8, $0),
    ($8, $8, $8, $F, $0),
    ($0, $0, $0, $F8, $8),
    ($8, $8, $8, $F8, $8),
    ($8, $8, $8, $F, $8),
    ($0, $0, $0, $FF, $8),
    ($8, $8, $8, $8, $8),
    ($8, $8, $8, $FF, $8),
    ($0, $0, $0, $FF, $28),
    ($0, $0, $FF, $0, $FF),
    ($0, $0, $F8, $8, $E8),
    ($0, $0, $3F, $20, $2F),
    ($28, $28, $E8, $8, $E8),
    ($28, $28, $2F, $20, $2F),
    ($0, $0, $FF, $0, $EF),
    ($28, $28, $28, $28, $28),
    ($28, $28, $EF, $0, $EF),
    ($28, $28, $28, $E8, $28),
    ($8, $8, $F8, $8, $F8),
    ($28, $28, $28, $2F, $28),
    ($8, $8, $F, $8, $F),
    ($0, $0, $F8, $8, $F8),
    ($0, $0, $0, $F8, $28),
    ($0, $0, $0, $3F, $28),
    ($0, $0, $F, $8, $F),
    ($8, $8, $FF, $8, $FF),
    ($28, $28, $28, $FF, $28),
    ($8, $8, $8, $F8, $0),
    ($0, $0, $0, $F, $8),
    ($FF, $FF, $FF, $FF, $FF),
    ($F, $F, $F, $F, $F),
    ($FF, $FF, $FF, $0, $0),
    ($0, $0, $0, $FF, $FF),
    ($F0, $F0, $F0, $F0, $F0),
    ($1C, $22, $22, $1C, $22),
    ($3E, $54, $54, $7C, $28),
    ($7E, $40, $40, $60, $60),
    ($40, $7E, $40, $7E, $40),
    ($C6, $AA, $92, $82, $C6),
    ($1C, $22, $22, $3C, $20),
    ($2, $7E, $4, $78, $4),
    ($60, $40, $7E, $40, $40),
    ($99, $A5, $E7, $A5, $99),
    ($38, $54, $92, $54, $38),
    ($32, $4E, $80, $4E, $32),
    ($C, $52, $B2, $B2, $C),
    ($C, $12, $1E, $12, $C),
    ($3D, $46, $5A, $62, $BC),
    ($7C, $92, $92, $92, $0),
    ($7E, $80, $80, $80, $7E),
    ($54, $54, $54, $54, $54),
    ($22, $22, $FA, $22, $22),
    ($2, $8A, $52, $22, $2),
    ($2, $22, $52, $8A, $2),
    ($0, $0, $FF, $80, $C0),
    ($7, $1, $FF, $0, $0),
    ($10, $10, $D6, $D6, $10),
    ($6C, $48, $6C, $24, $6C),
    ($60, $F0, $90, $F0, $60),
    ($0, $0, $18, $18, $0),
    ($0, $0, $8, $8, $0),
    ($C, $2, $FF, $80, $80),
    ($0, $F8, $80, $80, $78),
    ($0, $98, $B8, $E8, $48),
    ($0, $3C, $3C, $3C, $3C)
    );

Mono8x8 : TFontInfo =
(
  Width : 8;
  Height : 8;
  BitsPerPixel : 1;
  BytesPerChar : 5;
  CharMap : 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  pFontData : @Mono8x8_FontData;
);


implementation
end.
