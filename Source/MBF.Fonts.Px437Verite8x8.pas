unit MBF.Fonts.Px437Verite8x8;
{$mode objfpc}
{$WRITEABLECONST OFF}
interface
uses
  MBF.Displays.CustomDisplay;
const
  Px437Verite8x8_FontData : array[0..95] of array[0..7] of byte =
  (
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00110000,
    %01111000,
    %01111000,
    %00110000,
    %00110000,
    %00000000,
    %00110000,
    %00000000
    ),
    (
    %01101100,
    %00100100,
    %00100100,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %01101100,
    %01101100,
    %11111110,
    %01101100,
    %11111110,
    %01101100,
    %01101100,
    %00000000
    ),
    (
    %00010000,
    %01111100,
    %11010000,
    %01111100,
    %00010110,
    %11111100,
    %00010000,
    %00000000
    ),
    (
    %00000000,
    %01100110,
    %10101100,
    %11011000,
    %00110110,
    %01101010,
    %11001100,
    %00000000
    ),
    (
    %00111000,
    %01001100,
    %00111000,
    %01111000,
    %11001110,
    %11001100,
    %01111010,
    %00000000
    ),
    (
    %00110000,
    %00010000,
    %00100000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00011000,
    %00110000,
    %01100000,
    %01100000,
    %01100000,
    %00110000,
    %00011000,
    %00000000
    ),
    (
    %01100000,
    %00110000,
    %00011000,
    %00011000,
    %00011000,
    %00110000,
    %01100000,
    %00000000
    ),
    (
    %00000000,
    %01100110,
    %00111100,
    %11111111,
    %00111100,
    %01100110,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00110000,
    %00110000,
    %11111100,
    %00110000,
    %00110000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00110000,
    %00010000,
    %00100000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %11111100,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00110000,
    %00000000
    ),
    (
    %00000010,
    %00000110,
    %00001100,
    %00011000,
    %00110000,
    %01100000,
    %11000000,
    %00000000
    ),
    (
    %01111100,
    %11001110,
    %11011110,
    %11110110,
    %11100110,
    %11100110,
    %01111100,
    %00000000
    ),
    (
    %00011000,
    %00111000,
    %01111000,
    %00011000,
    %00011000,
    %00011000,
    %01111110,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %00000110,
    %00011100,
    %01110000,
    %11000000,
    %11111110,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %00000110,
    %00111100,
    %00000110,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %00011100,
    %00111100,
    %01101100,
    %11001100,
    %11111110,
    %00001100,
    %00011110,
    %00000000
    ),
    (
    %11111110,
    %11000000,
    %11111100,
    %00000110,
    %00000110,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %11000000,
    %11111100,
    %11000110,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %11111110,
    %11000110,
    %10000110,
    %00001100,
    %00011000,
    %00110000,
    %00110000,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %11000110,
    %01111100,
    %11000110,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %11000110,
    %01111110,
    %00000110,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %00000000,
    %00110000,
    %00000000,
    %00000000,
    %00000000,
    %00110000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00110000,
    %00000000,
    %00000000,
    %00000000,
    %00110000,
    %00010000,
    %00100000
    ),
    (
    %00001100,
    %00011000,
    %00110000,
    %01100000,
    %00110000,
    %00011000,
    %00001100,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %01111110,
    %00000000,
    %00000000,
    %01111110,
    %00000000,
    %00000000
    ),
    (
    %01100000,
    %00110000,
    %00011000,
    %00001100,
    %00011000,
    %00110000,
    %01100000,
    %00000000
    ),
    (
    %01111000,
    %11001100,
    %00001100,
    %00011000,
    %00110000,
    %00000000,
    %00110000,
    %00000000
    ),
    (
    %01111100,
    %10000010,
    %10011110,
    %10100110,
    %10011110,
    %10000000,
    %01111100,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %11000110,
    %11111110,
    %11000110,
    %11000110,
    %11000110,
    %00000000
    ),
    (
    %11111100,
    %01100110,
    %01100110,
    %01111100,
    %01100110,
    %01100110,
    %11111100,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %11000000,
    %11000000,
    %11000000,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %11111100,
    %01100110,
    %01100110,
    %01100110,
    %01100110,
    %01100110,
    %11111100,
    %00000000
    ),
    (
    %11111110,
    %01100010,
    %01101000,
    %01111000,
    %01101000,
    %01100010,
    %11111110,
    %00000000
    ),
    (
    %11111110,
    %01100010,
    %01101000,
    %01111000,
    %01101000,
    %01100000,
    %11110000,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %11000110,
    %11000000,
    %11001110,
    %11000110,
    %01111110,
    %00000000
    ),
    (
    %11000110,
    %11000110,
    %11000110,
    %11111110,
    %11000110,
    %11000110,
    %11000110,
    %00000000
    ),
    (
    %00111100,
    %00011000,
    %00011000,
    %00011000,
    %00011000,
    %00011000,
    %00111100,
    %00000000
    ),
    (
    %00011110,
    %00001100,
    %00001100,
    %00001100,
    %11001100,
    %11001100,
    %01111000,
    %00000000
    ),
    (
    %11100110,
    %01100110,
    %01100100,
    %01111000,
    %01101100,
    %01100110,
    %11100110,
    %00000000
    ),
    (
    %11110000,
    %01100000,
    %01100000,
    %01100000,
    %01100010,
    %01100110,
    %11111110,
    %00000000
    ),
    (
    %10000010,
    %11000110,
    %11101110,
    %11111110,
    %11010110,
    %11000110,
    %11000110,
    %00000000
    ),
    (
    %11000110,
    %11100110,
    %11110110,
    %11011110,
    %11001110,
    %11000110,
    %11000110,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %11000110,
    %11000110,
    %11000110,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %11111100,
    %01100110,
    %01100110,
    %01111100,
    %01100000,
    %01100000,
    %11110000,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %11000110,
    %11000110,
    %11010110,
    %11011110,
    %01111100,
    %00000110
    ),
    (
    %11111100,
    %01100110,
    %01100110,
    %01111100,
    %01100110,
    %01100110,
    %11100110,
    %00000000
    ),
    (
    %01111100,
    %11000110,
    %11000000,
    %01111100,
    %00000110,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %01111110,
    %01011010,
    %01011010,
    %00011000,
    %00011000,
    %00011000,
    %00111100,
    %00000000
    ),
    (
    %11000110,
    %11000110,
    %11000110,
    %11000110,
    %11000110,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %11000110,
    %11000110,
    %11000110,
    %11000110,
    %11000110,
    %01101100,
    %00111000,
    %00000000
    ),
    (
    %11000110,
    %11000110,
    %11010110,
    %11111110,
    %11101110,
    %11000110,
    %10000010,
    %00000000
    ),
    (
    %11000110,
    %01101100,
    %00111000,
    %00111000,
    %00111000,
    %01101100,
    %11000110,
    %00000000
    ),
    (
    %01100110,
    %01100110,
    %01100110,
    %00111100,
    %00011000,
    %00011000,
    %00111100,
    %00000000
    ),
    (
    %11111110,
    %11000110,
    %10001100,
    %00011000,
    %00110010,
    %01100110,
    %11111110,
    %00000000
    ),
    (
    %01111000,
    %01100000,
    %01100000,
    %01100000,
    %01100000,
    %01100000,
    %01111000,
    %00000000
    ),
    (
    %11000000,
    %01100000,
    %00110000,
    %00011000,
    %00001100,
    %00000110,
    %00000010,
    %00000000
    ),
    (
    %01111000,
    %00011000,
    %00011000,
    %00011000,
    %00011000,
    %00011000,
    %01111000,
    %00000000
    ),
    (
    %00010000,
    %00111000,
    %01101100,
    %11000110,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %11111111
    ),
    (
    %00110000,
    %00100000,
    %00010000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %01111000,
    %00001100,
    %01111100,
    %11001100,
    %01110110,
    %00000000
    ),
    (
    %11100000,
    %01100000,
    %01100000,
    %01111100,
    %01100110,
    %01100110,
    %01111100,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %01111100,
    %11000110,
    %11000000,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %00011100,
    %00001100,
    %00001100,
    %01111100,
    %11001100,
    %11001100,
    %01110110,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %01111100,
    %11000110,
    %11111110,
    %11000000,
    %01111100,
    %00000000
    ),
    (
    %00011100,
    %00110110,
    %00110000,
    %01111000,
    %00110000,
    %00110000,
    %01111000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %01110110,
    %11001100,
    %11001100,
    %01111100,
    %00001100,
    %01111000
    ),
    (
    %11100000,
    %01100000,
    %01101100,
    %01110110,
    %01100110,
    %01100110,
    %11100110,
    %00000000
    ),
    (
    %00011000,
    %00000000,
    %00111000,
    %00011000,
    %00011000,
    %00011000,
    %00111100,
    %00000000
    ),
    (
    %00000000,
    %00001100,
    %00000000,
    %00011100,
    %00001100,
    %00001100,
    %11001100,
    %01111000
    ),
    (
    %11100000,
    %01100000,
    %01100110,
    %01101100,
    %01111000,
    %01101100,
    %11100110,
    %00000000
    ),
    (
    %00111000,
    %00011000,
    %00011000,
    %00011000,
    %00011000,
    %00011000,
    %00111100,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %11001100,
    %11111110,
    %11010110,
    %11010110,
    %11010110,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %11011100,
    %01100110,
    %01100110,
    %01100110,
    %01100110,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %01111100,
    %11000110,
    %11000110,
    %11000110,
    %01111100,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %11011100,
    %01100110,
    %01100110,
    %01111100,
    %01100000,
    %11110000
    ),
    (
    %00000000,
    %00000000,
    %01111100,
    %11001100,
    %11001100,
    %01111100,
    %00001100,
    %00011110
    ),
    (
    %00000000,
    %00000000,
    %11011110,
    %01110110,
    %01100000,
    %01100000,
    %11110000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %01111100,
    %11000000,
    %01111100,
    %00000110,
    %01111100,
    %00000000
    ),
    (
    %00010000,
    %00110000,
    %11111100,
    %00110000,
    %00110000,
    %00110100,
    %00011000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %11001100,
    %11001100,
    %11001100,
    %11001100,
    %01110110,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %11000110,
    %11000110,
    %11000110,
    %01101100,
    %00111000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %11000110,
    %11010110,
    %11010110,
    %11111110,
    %01101100,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %11000110,
    %01101100,
    %00111000,
    %01101100,
    %11000110,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %11000110,
    %11000110,
    %11000110,
    %01111110,
    %00000110,
    %01111100
    ),
    (
    %00000000,
    %00000000,
    %11111100,
    %10011000,
    %00110000,
    %01100100,
    %11111100,
    %00000000
    ),
    (
    %00001110,
    %00011000,
    %00011000,
    %00110000,
    %00011000,
    %00011000,
    %00001110,
    %00000000
    ),
    (
    %00011000,
    %00011000,
    %00011000,
    %00000000,
    %00011000,
    %00011000,
    %00011000,
    %00000000
    ),
    (
    %11100000,
    %00110000,
    %00110000,
    %00011000,
    %00110000,
    %00110000,
    %11100000,
    %00000000
    ),
    (
    %01110110,
    %11011100,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00010000,
    %00111000,
    %01101100,
    %11000110,
    %11000110,
    %11111110,
    %00000000
    )
  ); {$if defined(CPUAVR_HAS_LPMX)} section '.progmem';{$endif}

var
  Px437Verite8x8_RowBuffer : array[0..7] of byte;
const
  Charmap :string[96] = ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~'; {$if defined(CPUAVR_HAS_LPMX)} section '.progmem';{$endif}
const
  Px437Verite8x8 : TFontInfo =
  (
    Width : 8;
    Height : 8;
    BitsPerPixel : 1;
    BytesPerChar : 8;
    pCharmap : @Charmap;
    pFontData : @Px437Verite8x8_FontData;
    pRowBuffer : @Px437Verite8x8_RowBuffer;
  );

implementation
end.
