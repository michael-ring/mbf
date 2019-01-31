unit MBF.Fonts.BitstreamVeraSansMono6x12;
{$mode objfpc}
{$WRITEABLECONST OFF}
interface
uses
  MBF.Displays.CustomDisplay;
const
  BitstreamVeraSansMono6x12_FontData : array[0..95] of array[0..11] of byte = 
  (
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
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
    %00000000,
    %00000000,
    %00000000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00000000,
    %00010000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00101000,
    %00101000,
    %00101000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00101000,
    %00101000,
    %01111100,
    %01010000,
    %11111000,
    %01010000,
    %01010000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00010000,
    %00111100,
    %01010000,
    %01110000,
    %00011100,
    %00010100,
    %01111000,
    %00010000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %11100000,
    %10100000,
    %11101000,
    %00110000,
    %01011100,
    %00010100,
    %00011100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %00100000,
    %00110000,
    %01010100,
    %01001100,
    %01001000,
    %00110100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00010000,
    %00010000,
    %00010000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00010000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00010000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00100000,
    %00100000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00100000,
    %00100000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01010100,
    %00111000,
    %00111000,
    %01010100,
    %00000000,
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
    %00010000,
    %00010000,
    %01111100,
    %00010000,
    %00010000,
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
    %00000000,
    %00000000,
    %00100000,
    %00100000,
    %00100000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00111000,
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
    %00000000,
    %00000000,
    %00100000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000100,
    %00001000,
    %00001000,
    %00010000,
    %00010000,
    %00100000,
    %00100000,
    %01000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %01000100,
    %01010100,
    %01000100,
    %01000100,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01110000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %01111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %00000100,
    %00001100,
    %00011000,
    %00100000,
    %01111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %00000100,
    %00111000,
    %00000100,
    %01000100,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00001000,
    %00011000,
    %00101000,
    %01101000,
    %01111100,
    %00001000,
    %00001000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111000,
    %01000000,
    %01111000,
    %00000100,
    %00000100,
    %00000100,
    %01111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111100,
    %01100000,
    %01000000,
    %01111000,
    %01000100,
    %01000100,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111100,
    %00001100,
    %00001000,
    %00001000,
    %00010000,
    %00010000,
    %00100000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %01000100,
    %00111000,
    %01000100,
    %01000100,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %01000100,
    %00111100,
    %00000100,
    %00001100,
    %01111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00100000,
    %00000000,
    %00000000,
    %00000000,
    %00100000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00100000,
    %00000000,
    %00000000,
    %00000000,
    %00100000,
    %00100000,
    %00100000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000100,
    %00111000,
    %01000000,
    %00111000,
    %00000100,
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
    %11111000,
    %00000000,
    %11111000,
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
    %01000000,
    %00111000,
    %00000100,
    %00111000,
    %01000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111000,
    %00001000,
    %00010000,
    %00100000,
    %00100000,
    %00000000,
    %00100000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %00100100,
    %01011100,
    %01010100,
    %01010100,
    %01010100,
    %01011100,
    %00100000,
    %00011000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00010000,
    %00010000,
    %00101000,
    %00101000,
    %00111000,
    %01000100,
    %01000100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111000,
    %01000100,
    %01000100,
    %01111000,
    %01000100,
    %01000100,
    %01111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111100,
    %01100100,
    %01000000,
    %01000000,
    %01000000,
    %01100100,
    %00111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111000,
    %01001100,
    %01000100,
    %01000100,
    %01000100,
    %01001100,
    %01111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111100,
    %01000000,
    %01000000,
    %01111100,
    %01000000,
    %01000000,
    %01111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111100,
    %01000000,
    %01000000,
    %01111100,
    %01000000,
    %01000000,
    %01000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01100100,
    %01000000,
    %01001100,
    %01000100,
    %01100100,
    %00111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %01000100,
    %01000100,
    %01111100,
    %01000100,
    %01000100,
    %01000100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111100,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %01111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %00001000,
    %00001000,
    %00001000,
    %00001000,
    %01001000,
    %00110000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %01001000,
    %01010000,
    %01100000,
    %01010000,
    %01001000,
    %01000100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000000,
    %01000000,
    %01000000,
    %01000000,
    %01000000,
    %01000000,
    %01111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %01101100,
    %01101100,
    %01010100,
    %01000100,
    %01000100,
    %01000100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %01100100,
    %01100100,
    %01010100,
    %01001100,
    %01001100,
    %01000100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111000,
    %01000100,
    %01000100,
    %01111000,
    %01000000,
    %01000000,
    %01000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %00111000,
    %00001100,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111000,
    %01000100,
    %01000100,
    %01111000,
    %01001100,
    %01000100,
    %01000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %01000000,
    %00111000,
    %00000100,
    %01000100,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111100,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %01000100,
    %00101000,
    %00101000,
    %00101000,
    %00010000,
    %00010000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %10000100,
    %10110100,
    %10110100,
    %01111000,
    %01001000,
    %01001000,
    %01001000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %00101000,
    %00101000,
    %00010000,
    %00101000,
    %00101000,
    %01000100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %00101000,
    %00101000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01111100,
    %00001000,
    %00001000,
    %00010000,
    %00100000,
    %00100000,
    %01111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00110000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00110000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %01000000,
    %00100000,
    %00100000,
    %00010000,
    %00010000,
    %00001000,
    %00001000,
    %00000100,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00110000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00110000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00100000,
    %01010000,
    %10001000,
    %00000000,
    %00000000,
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
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %11111000
    ),
    (
    %00000000,
    %00000000,
    %01000000,
    %00100000,
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
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01111000,
    %00000100,
    %00111100,
    %01000100,
    %01111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %01000000,
    %01000000,
    %01000000,
    %01111000,
    %01000100,
    %01000100,
    %01000100,
    %01111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000000,
    %01000000,
    %01000000,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000100,
    %00000100,
    %00000100,
    %00111100,
    %01000100,
    %01000100,
    %01000100,
    %00111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %01111100,
    %01000000,
    %00111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00011000,
    %00100000,
    %00100000,
    %01111000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00111100,
    %01000100,
    %01000100,
    %01000100,
    %00111100,
    %00000100,
    %00111000
    ),
    (
    %00000000,
    %00000000,
    %01000000,
    %01000000,
    %01000000,
    %01111000,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00010000,
    %00000000,
    %00000000,
    %00110000,
    %00010000,
    %00010000,
    %00010000,
    %01111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00010000,
    %00000000,
    %00000000,
    %01110000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %01100000
    ),
    (
    %00000000,
    %00000000,
    %01000000,
    %01000000,
    %01000000,
    %01001000,
    %01010000,
    %01110000,
    %01001000,
    %01000100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %11100000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00100000,
    %00011000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01111100,
    %01010100,
    %01010100,
    %01010100,
    %01010100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01111000,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00111000,
    %01000100,
    %01000100,
    %01000100,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01111000,
    %01000100,
    %01000100,
    %01000100,
    %01111000,
    %01000000,
    %01000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00111100,
    %01000100,
    %01000100,
    %01000100,
    %00111100,
    %00000100,
    %00000100
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00111100,
    %00100100,
    %00100000,
    %00100000,
    %00100000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00111100,
    %01000000,
    %00111100,
    %00000100,
    %01111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00100000,
    %00100000,
    %01111000,
    %00100000,
    %00100000,
    %00100000,
    %00111000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %01000100,
    %01000100,
    %01000100,
    %00111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %00101000,
    %00101000,
    %00101000,
    %00010000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %01010100,
    %00101000,
    %00101000,
    %00101000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01101100,
    %00101000,
    %00010000,
    %00101000,
    %01101100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01000100,
    %00101000,
    %00101000,
    %00010000,
    %00010000,
    %00010000,
    %01100000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01111100,
    %00001000,
    %00010000,
    %00100000,
    %01111100,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00011000,
    %00010000,
    %00010000,
    %00010000,
    %01100000,
    %00010000,
    %00010000,
    %00010000,
    %00011000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000,
    %00010000
    ),
    (
    %00000000,
    %00000000,
    %00110000,
    %00010000,
    %00010000,
    %00010000,
    %00001100,
    %00010000,
    %00010000,
    %00010000,
    %00110000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %00000000,
    %01110000,
    %00001100,
    %00000000,
    %00000000,
    %00000000,
    %00000000
    ),
    (
    %00000000,
    %00000000,
    %00000000,
    %11000000,
    %11000000,
    %11000000,
    %11000000,
    %11000000,
    %11000000,
    %11000000,
    %00000000,
    %00000000
    )
  );

var
  BitstreamVeraSansMono6x12_RowBuffer : array[0..7] of byte;
const
  BitstreamVeraSansMono6x12 : TFontInfo =
  (
    Width : 6;
    Height : 12;
    BitsPerPixel : 1;
    BytesPerChar : 12;
    Charmap : ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
    pFontData : @BitstreamVeraSansMono6x12_FontData;
    pRowBuffer : @BitstreamVeraSansMono6x12_RowBuffer;
  );

implementation
end.
