type
  TI2CSDAPins = (
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    PA8_I2C0_PAD0 = MuxC or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO)}
    ,D14_I2C = MuxC or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_I2C2_PAD0 = MuxC or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(SAMC21XPRO)}
    ,D14_I2C = MuxC or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    PA14_I2C0_PAD0 = MuxC or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(SAMD10XMINI)}
    ,D14_I2C = MuxC or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_I2C1_PAD0 = MuxC or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_I2C1_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA22_I2C3_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(ARDUINOZERO)}
    ,D14_I2C = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB12_I2C4_PAD0 = MuxC or Pad0 or TNativePin.PB12
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB16_I2C5_PAD0 = MuxC or Pad0 or TNativePin.PB16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA8_I2C2_PAD0 = MuxD or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_I2C4_PAD0 = MuxD or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA14_I2C2_PAD0 = MuxD or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_I2C3_PAD0 = MuxD or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_I2C2_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA22_I2C5_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  );

  TI2CSCLPins = (
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    PA9_I2C0_PAD1 = MuxC or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO)}
    ,D15_I2C = MuxC or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_I2C2_PAD1 = MuxC or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(SAMC21XPRO)}
    ,D15_I2C = MuxC or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    PA15_I2C0_PAD1 = MuxC or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(SAMD10XMINI)}
    ,D15_I2C = MuxC or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_I2C1_PAD1 = MuxC or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_I2C1_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA23_I2C3_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(ARDUINOZERO)}
    ,D15_I2C = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB13_I2C4_PAD1 = MuxC or Pad1 or TNativePin.PB13
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB17_I2C5_PAD1 = MuxC or Pad1 or TNativePin.PB17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA9_I2C2_PAD1 = MuxD or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_I2C4_PAD1 = MuxD or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA15_I2C2_PAD1 = MuxD or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_I2C3_PAD1 = MuxD or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_I2C2_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA23_I2C5_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  );
