type
  TSPIMOSIPins = (
  {$if defined(samd10d) or defined(samd11d)}
    PA6_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA6
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    PA8_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_SPI2_PAD0 = MuxC or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA14_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(SAMD10XMINI)}
    ,D11_SPI = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA22_SPI3_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA30_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB12_SPI4_PAD0 = MuxC or Pad0 or TNativePin.PB12
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB16_SPI5_PAD0 = MuxC or Pad0 or TNativePin.PB16
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_SPI3_PAD0 = MuxC or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB30_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC6_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC6
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC8_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC16_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA0_SPI1_PAD0 = MuxD or Pad0 or TNativePin.PA0
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA4_SPI0_PAD0 = MuxD or Pad0 or TNativePin.PA4
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA8_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA14_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_SPI3_PAD0 = MuxD or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA22_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB2_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PB2
  {$endif}
  {$if defined(samc21g) or defined(samc21j) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB8_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PB8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB30_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC27_SPI1_PAD0 = MuxD or Pad0 or TNativePin.PC27
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA4_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PA4
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA14_SPI2_PAD2 = MuxC or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(ARDUINOZERO)}
    ,D11_SPI = MuxC or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_SPI5_PAD2 = MuxC or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA24_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA24_SPI3_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB14_SPI4_PAD2 = MuxC or Pad2 or TNativePin.PB14
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_SPI5_PAD2 = MuxC or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB22_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC10_SPI6_PAD2 = MuxC or Pad2 or TNativePin.PC10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC18_SPI6_PAD2 = MuxC or Pad2 or TNativePin.PC18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA6_SPI0_PAD2 = MuxD or Pad2 or TNativePin.PA6
  {$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO)}
    ,D11_SPI = MuxD or Pad2 or TNativePin.PA6
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_SPI0_PAD2 = MuxD or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA14_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA24_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA24_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA30_SPI1_PAD2 = MuxD or Pad2 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB0_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PB0
  {$endif}
  {$if defined(SAMC21XPRO)}
    ,D11_SPI = MuxD or Pad2 or TNativePin.PB0
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB10_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PB10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB22_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA5_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PA5
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA15_SPI2_PAD3 = MuxC or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_SPI5_PAD3 = MuxC or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA25_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA25_SPI3_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB15_SPI4_PAD3 = MuxC or Pad3 or TNativePin.PB15
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_SPI5_PAD3 = MuxC or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB23_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC5_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC5
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC11_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC19_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PC25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA7_SPI0_PAD3 = MuxD or Pad3 or TNativePin.PA7
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_SPI0_PAD3 = MuxD or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA15_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA25_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA25_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA31_SPI1_PAD3 = MuxD or Pad3 or TNativePin.PA31
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB1_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PB1
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB11_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PB11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB23_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PC25
  {$endif}
  );

  TSPIMISOPins = (
  {$if defined(samd10d) or defined(samd11d)}
    PA6_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA6
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    PA8_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_SPI2_PAD0 = MuxC or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA14_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA22_SPI3_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA30_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB12_SPI4_PAD0 = MuxC or Pad0 or TNativePin.PB12
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB16_SPI5_PAD0 = MuxC or Pad0 or TNativePin.PB16
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_SPI3_PAD0 = MuxC or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB30_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC6_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC6
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC8_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC16_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA0_SPI1_PAD0 = MuxD or Pad0 or TNativePin.PA0
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA4_SPI0_PAD0 = MuxD or Pad0 or TNativePin.PA4
  {$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO)}
    ,D12_SPI = MuxD or Pad0 or TNativePin.PA4
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA8_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA14_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_SPI3_PAD0 = MuxD or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA22_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB2_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PB2
  {$endif}
  {$if defined(SAMC21XPRO)}
    ,D12_SPI = MuxD or Pad0 or TNativePin.PB2
  {$endif}
  {$if defined(samc21g) or defined(samc21j) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB8_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PB8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB30_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC27_SPI1_PAD0 = MuxD or Pad0 or TNativePin.PC27
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA7_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PA7
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA9_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_SPI2_PAD1 = MuxC or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA15_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA23_SPI3_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA31_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PA31
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB13_SPI4_PAD1 = MuxC or Pad1 or TNativePin.PB13
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB17_SPI5_PAD1 = MuxC or Pad1 or TNativePin.PB17
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB21_SPI3_PAD1 = MuxC or Pad1 or TNativePin.PB21
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB25_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PB25
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB31_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PB31
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC7_SPI6_PAD1 = MuxC or Pad1 or TNativePin.PC7
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC9_SPI6_PAD1 = MuxC or Pad1 or TNativePin.PC9
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC17_SPI6_PAD1 = MuxC or Pad1 or TNativePin.PC17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA1_SPI1_PAD1 = MuxD or Pad1 or TNativePin.PA1
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA5_SPI0_PAD1 = MuxD or Pad1 or TNativePin.PA5
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA9_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_SPI4_PAD1 = MuxD or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA15_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_SPI3_PAD1 = MuxD or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA23_SPI5_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB3_SPI5_PAD1 = MuxD or Pad1 or TNativePin.PB3
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB9_SPI4_PAD1 = MuxD or Pad1 or TNativePin.PB9
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB21_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PB21
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB25_SPI4_PAD1 = MuxD or Pad1 or TNativePin.PB25
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB31_SPI5_PAD1 = MuxD or Pad1 or TNativePin.PB31
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC28_SPI1_PAD1 = MuxD or Pad1 or TNativePin.PC28
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA4_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PA4
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA14_SPI2_PAD2 = MuxC or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_SPI5_PAD2 = MuxC or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA24_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(SAMD10XMINI)}
    ,D12_SPI = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA24_SPI3_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB14_SPI4_PAD2 = MuxC or Pad2 or TNativePin.PB14
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_SPI5_PAD2 = MuxC or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB22_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC10_SPI6_PAD2 = MuxC or Pad2 or TNativePin.PC10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC18_SPI6_PAD2 = MuxC or Pad2 or TNativePin.PC18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA6_SPI0_PAD2 = MuxD or Pad2 or TNativePin.PA6
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_SPI0_PAD2 = MuxD or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA14_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA24_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA24_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA30_SPI1_PAD2 = MuxD or Pad2 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB0_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PB0
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB10_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PB10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB22_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA5_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PA5
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA15_SPI2_PAD3 = MuxC or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(ARDUINOZERO)}
    ,D12_SPI = MuxC or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_SPI5_PAD3 = MuxC or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA25_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA25_SPI3_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB15_SPI4_PAD3 = MuxC or Pad3 or TNativePin.PB15
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_SPI5_PAD3 = MuxC or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB23_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC5_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC5
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC11_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC19_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PC25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA7_SPI0_PAD3 = MuxD or Pad3 or TNativePin.PA7
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_SPI0_PAD3 = MuxD or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA15_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA25_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA25_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA31_SPI1_PAD3 = MuxD or Pad3 or TNativePin.PA31
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB1_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PB1
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB11_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PB11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB23_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PC25
  {$endif}
  );

  TSPISCLKPins = (
  {$if defined(samd10d) or defined(samd11d)}
    PA6_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA6
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    PA8_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_SPI2_PAD0 = MuxC or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA14_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA22_SPI3_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA30_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB12_SPI4_PAD0 = MuxC or Pad0 or TNativePin.PB12
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB16_SPI5_PAD0 = MuxC or Pad0 or TNativePin.PB16
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_SPI3_PAD0 = MuxC or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB30_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC6_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC6
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC8_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC16_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA0_SPI1_PAD0 = MuxD or Pad0 or TNativePin.PA0
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA4_SPI0_PAD0 = MuxD or Pad0 or TNativePin.PA4
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA8_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA14_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_SPI3_PAD0 = MuxD or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA22_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB2_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PB2
  {$endif}
  {$if defined(samc21g) or defined(samc21j) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB8_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PB8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB30_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC27_SPI1_PAD0 = MuxD or Pad0 or TNativePin.PC27
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA7_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PA7
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA9_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_SPI2_PAD1 = MuxC or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA15_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(ARDUINOZERO)}
    ,D13_SPI = MuxC or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA23_SPI3_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA31_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PA31
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB13_SPI4_PAD1 = MuxC or Pad1 or TNativePin.PB13
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB17_SPI5_PAD1 = MuxC or Pad1 or TNativePin.PB17
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB21_SPI3_PAD1 = MuxC or Pad1 or TNativePin.PB21
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB25_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PB25
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB31_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PB31
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC7_SPI6_PAD1 = MuxC or Pad1 or TNativePin.PC7
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC9_SPI6_PAD1 = MuxC or Pad1 or TNativePin.PC9
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC17_SPI6_PAD1 = MuxC or Pad1 or TNativePin.PC17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA1_SPI1_PAD1 = MuxD or Pad1 or TNativePin.PA1
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA5_SPI0_PAD1 = MuxD or Pad1 or TNativePin.PA5
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA9_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_SPI4_PAD1 = MuxD or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA15_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_SPI3_PAD1 = MuxD or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA23_SPI5_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB3_SPI5_PAD1 = MuxD or Pad1 or TNativePin.PB3
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB9_SPI4_PAD1 = MuxD or Pad1 or TNativePin.PB9
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB21_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PB21
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB25_SPI4_PAD1 = MuxD or Pad1 or TNativePin.PB25
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB31_SPI5_PAD1 = MuxD or Pad1 or TNativePin.PB31
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC28_SPI1_PAD1 = MuxD or Pad1 or TNativePin.PC28
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA4_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PA4
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA14_SPI2_PAD2 = MuxC or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_SPI5_PAD2 = MuxC or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA24_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA24_SPI3_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB14_SPI4_PAD2 = MuxC or Pad2 or TNativePin.PB14
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_SPI5_PAD2 = MuxC or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB22_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC10_SPI6_PAD2 = MuxC or Pad2 or TNativePin.PC10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC18_SPI6_PAD2 = MuxC or Pad2 or TNativePin.PC18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA6_SPI0_PAD2 = MuxD or Pad2 or TNativePin.PA6
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_SPI0_PAD2 = MuxD or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA14_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA24_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA24_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA30_SPI1_PAD2 = MuxD or Pad2 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB0_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PB0
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB10_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PB10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB22_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA5_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PA5
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(SAMD10XMINI)}
    ,D13_SPI = MuxC or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA15_SPI2_PAD3 = MuxC or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_SPI5_PAD3 = MuxC or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA25_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA25_SPI3_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB15_SPI4_PAD3 = MuxC or Pad3 or TNativePin.PB15
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_SPI5_PAD3 = MuxC or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB23_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC5_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC5
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC11_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC19_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PC25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA7_SPI0_PAD3 = MuxD or Pad3 or TNativePin.PA7
  {$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO)}
    ,D13_SPI = MuxD or Pad3 or TNativePin.PA7
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_SPI0_PAD3 = MuxD or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA15_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA25_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA25_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA31_SPI1_PAD3 = MuxD or Pad3 or TNativePin.PA31
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB1_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PB1
  {$endif}
  {$if defined(SAMC21XPRO)}
    ,D13_SPI = MuxD or Pad3 or TNativePin.PB1
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB11_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PB11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB23_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PC25
  {$endif}
  );

  TSPINSSPins = (
  {$if defined(SAMC21XPRO)}
    D10_SPI = TNativePin.PA27,
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    PA6_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA6
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    PA8_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_SPI2_PAD0 = MuxC or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA14_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA22_SPI3_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA30_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB12_SPI4_PAD0 = MuxC or Pad0 or TNativePin.PB12
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB16_SPI5_PAD0 = MuxC or Pad0 or TNativePin.PB16
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_SPI3_PAD0 = MuxC or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_SPI0_PAD0 = MuxC or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB30_SPI1_PAD0 = MuxC or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC6_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC6
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC8_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC16_SPI6_PAD0 = MuxC or Pad0 or TNativePin.PC16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA0_SPI1_PAD0 = MuxD or Pad0 or TNativePin.PA0
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA4_SPI0_PAD0 = MuxD or Pad0 or TNativePin.PA4
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA8_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA14_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_SPI3_PAD0 = MuxD or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA22_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB2_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PB2
  {$endif}
  {$if defined(samc21g) or defined(samc21j) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB8_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PB8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_SPI2_PAD0 = MuxD or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_SPI4_PAD0 = MuxD or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB30_SPI5_PAD0 = MuxD or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC27_SPI1_PAD0 = MuxD or Pad0 or TNativePin.PC27
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA7_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PA7
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA9_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_SPI2_PAD1 = MuxC or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA15_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(SAMD10XMINI)}
    ,D10_SPI = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA23_SPI3_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA31_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PA31
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB13_SPI4_PAD1 = MuxC or Pad1 or TNativePin.PB13
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB17_SPI5_PAD1 = MuxC or Pad1 or TNativePin.PB17
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB21_SPI3_PAD1 = MuxC or Pad1 or TNativePin.PB21
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB25_SPI0_PAD1 = MuxC or Pad1 or TNativePin.PB25
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB31_SPI1_PAD1 = MuxC or Pad1 or TNativePin.PB31
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC7_SPI6_PAD1 = MuxC or Pad1 or TNativePin.PC7
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC9_SPI6_PAD1 = MuxC or Pad1 or TNativePin.PC9
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC17_SPI6_PAD1 = MuxC or Pad1 or TNativePin.PC17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA1_SPI1_PAD1 = MuxD or Pad1 or TNativePin.PA1
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA5_SPI0_PAD1 = MuxD or Pad1 or TNativePin.PA5
  {$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO)}
    ,D10_SPI = MuxD or Pad1 or TNativePin.PA5
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA9_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_SPI4_PAD1 = MuxD or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA15_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_SPI3_PAD1 = MuxD or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA23_SPI5_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB3_SPI5_PAD1 = MuxD or Pad1 or TNativePin.PB3
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB9_SPI4_PAD1 = MuxD or Pad1 or TNativePin.PB9
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB21_SPI2_PAD1 = MuxD or Pad1 or TNativePin.PB21
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB25_SPI4_PAD1 = MuxD or Pad1 or TNativePin.PB25
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB31_SPI5_PAD1 = MuxD or Pad1 or TNativePin.PB31
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC28_SPI1_PAD1 = MuxD or Pad1 or TNativePin.PC28
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA4_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PA4
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA14_SPI2_PAD2 = MuxC or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(ARDUINOZERO)}
    ,D10_SPI = MuxC or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_SPI5_PAD2 = MuxC or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA24_SPI1_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA24_SPI3_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB14_SPI4_PAD2 = MuxC or Pad2 or TNativePin.PB14
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_SPI5_PAD2 = MuxC or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB22_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC10_SPI6_PAD2 = MuxC or Pad2 or TNativePin.PC10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC18_SPI6_PAD2 = MuxC or Pad2 or TNativePin.PC18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_SPI0_PAD2 = MuxC or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA6_SPI0_PAD2 = MuxD or Pad2 or TNativePin.PA6
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_SPI0_PAD2 = MuxD or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA14_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA24_SPI2_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA24_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA30_SPI1_PAD2 = MuxD or Pad2 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB0_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PB0
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB10_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PB10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_SPI3_PAD2 = MuxD or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB22_SPI5_PAD2 = MuxD or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_SPI4_PAD2 = MuxD or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA5_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PA5
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA15_SPI2_PAD3 = MuxC or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_SPI5_PAD3 = MuxC or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA25_SPI1_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA25_SPI3_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB15_SPI4_PAD3 = MuxC or Pad3 or TNativePin.PB15
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_SPI5_PAD3 = MuxC or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB23_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC5_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC5
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC11_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC19_SPI6_PAD3 = MuxC or Pad3 or TNativePin.PC19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_SPI0_PAD3 = MuxC or Pad3 or TNativePin.PC25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA7_SPI0_PAD3 = MuxD or Pad3 or TNativePin.PA7
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_SPI0_PAD3 = MuxD or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA15_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA25_SPI2_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA25_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA31_SPI1_PAD3 = MuxD or Pad3 or TNativePin.PA31
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB1_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PB1
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB11_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PB11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_SPI3_PAD3 = MuxD or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB23_SPI5_PAD3 = MuxD or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_SPI4_PAD3 = MuxD or Pad3 or TNativePin.PC25
  {$endif}
  );
