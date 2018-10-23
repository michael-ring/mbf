type
  TUARTTXPins = (
  {$if defined(samd10d) or defined(samd11d)}
    PA6_UART0_PAD0 = MuxC or Pad0 or TNativePin.PA6
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    PA8_UART0_PAD0 = MuxC or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_UART2_PAD0 = MuxC or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA14_UART0_PAD0 = MuxC or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_UART1_PAD0 = MuxC or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_UART1_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA22_UART3_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(SAMC21XPRO)}
    ,D1_UART = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(SAMD21XPRO) or defined(ARDUINOZERO)}
    ,DEBUG_UART = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA30_UART1_PAD0 = MuxC or Pad0 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB12_UART4_PAD0 = MuxC or Pad0 or TNativePin.PB12
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB16_UART5_PAD0 = MuxC or Pad0 or TNativePin.PB16
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_UART3_PAD0 = MuxC or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_UART0_PAD0 = MuxC or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB30_UART1_PAD0 = MuxC or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC6_UART6_PAD0 = MuxC or Pad0 or TNativePin.PC6
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC8_UART6_PAD0 = MuxC or Pad0 or TNativePin.PC8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC16_UART6_PAD0 = MuxC or Pad0 or TNativePin.PC16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA0_UART1_PAD0 = MuxD or Pad0 or TNativePin.PA0
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA4_UART0_PAD0 = MuxD or Pad0 or TNativePin.PA4
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA8_UART2_PAD0 = MuxD or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_UART4_PAD0 = MuxD or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA14_UART2_PAD0 = MuxD or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_UART3_PAD0 = MuxD or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_UART2_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA22_UART5_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB2_UART5_PAD0 = MuxD or Pad0 or TNativePin.PB2
  {$endif}
  {$if defined(samc21g) or defined(samc21j) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB8_UART4_PAD0 = MuxD or Pad0 or TNativePin.PB8
  {$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO)}
    ,D1_UART = MuxD or Pad0 or TNativePin.PB8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_UART2_PAD0 = MuxD or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_UART4_PAD0 = MuxD or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB30_UART5_PAD0 = MuxD or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC27_UART1_PAD0 = MuxD or Pad0 or TNativePin.PC27
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA4_UART0_PAD2 = MuxC or Pad2 or TNativePin.PA4
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_UART1_PAD2 = MuxC or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_UART0_PAD2 = MuxC or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(SAMD10XMINI) or defined(SAMD11XPRO) or defined(ARDUINOZERO)}
    ,D1_UART = MuxC or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(SAMD10XMINI) or defined(SAMD11XPRO)}
    ,DEBUG_UART = MuxC or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA14_UART2_PAD2 = MuxC or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_UART1_PAD2 = MuxC or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_UART1_PAD2 = MuxC or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_UART5_PAD2 = MuxC or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA24_UART1_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA24_UART3_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(SAMD20XPRO)}
    ,DEBUG_UART = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB14_UART4_PAD2 = MuxC or Pad2 or TNativePin.PB14
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_UART5_PAD2 = MuxC or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB22_UART0_PAD2 = MuxC or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC10_UART6_PAD2 = MuxC or Pad2 or TNativePin.PC10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC18_UART6_PAD2 = MuxC or Pad2 or TNativePin.PC18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_UART0_PAD2 = MuxC or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA6_UART0_PAD2 = MuxD or Pad2 or TNativePin.PA6
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_UART0_PAD2 = MuxD or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_UART2_PAD2 = MuxD or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA14_UART4_PAD2 = MuxD or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_UART2_PAD2 = MuxD or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_UART3_PAD2 = MuxD or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_UART3_PAD2 = MuxD or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA24_UART2_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA24_UART5_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA30_UART1_PAD2 = MuxD or Pad2 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB0_UART5_PAD2 = MuxD or Pad2 or TNativePin.PB0
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB10_UART4_PAD2 = MuxD or Pad2 or TNativePin.PB10
  {$endif}
  {$if defined(SAMC21XPRO)}
    ,DEBUG_UART = MuxD or Pad2 or TNativePin.PB10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_UART3_PAD2 = MuxD or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB22_UART5_PAD2 = MuxD or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_UART4_PAD2 = MuxD or Pad2 or TNativePin.PC24
  {$endif}
  );

  TUARTRXPins = (
  {$if defined(samd10d) or defined(samd11d)}
    PA6_UART0_PAD0 = MuxC or Pad0 or TNativePin.PA6
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    PA8_UART0_PAD0 = MuxC or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_UART2_PAD0 = MuxC or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA14_UART0_PAD0 = MuxC or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_UART1_PAD0 = MuxC or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_UART1_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA22_UART3_PAD0 = MuxC or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA30_UART1_PAD0 = MuxC or Pad0 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB12_UART4_PAD0 = MuxC or Pad0 or TNativePin.PB12
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB16_UART5_PAD0 = MuxC or Pad0 or TNativePin.PB16
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_UART3_PAD0 = MuxC or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_UART0_PAD0 = MuxC or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB30_UART1_PAD0 = MuxC or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC6_UART6_PAD0 = MuxC or Pad0 or TNativePin.PC6
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC8_UART6_PAD0 = MuxC or Pad0 or TNativePin.PC8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC16_UART6_PAD0 = MuxC or Pad0 or TNativePin.PC16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA0_UART1_PAD0 = MuxD or Pad0 or TNativePin.PA0
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA4_UART0_PAD0 = MuxD or Pad0 or TNativePin.PA4
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA8_UART2_PAD0 = MuxD or Pad0 or TNativePin.PA8
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA12_UART4_PAD0 = MuxD or Pad0 or TNativePin.PA12
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA14_UART2_PAD0 = MuxD or Pad0 or TNativePin.PA14
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA16_UART3_PAD0 = MuxD or Pad0 or TNativePin.PA16
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA22_UART2_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA22_UART5_PAD0 = MuxD or Pad0 or TNativePin.PA22
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB2_UART5_PAD0 = MuxD or Pad0 or TNativePin.PB2
  {$endif}
  {$if defined(samc21g) or defined(samc21j) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB8_UART4_PAD0 = MuxD or Pad0 or TNativePin.PB8
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB20_UART2_PAD0 = MuxD or Pad0 or TNativePin.PB20
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB24_UART4_PAD0 = MuxD or Pad0 or TNativePin.PB24
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB30_UART5_PAD0 = MuxD or Pad0 or TNativePin.PB30
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC27_UART1_PAD0 = MuxD or Pad0 or TNativePin.PC27
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA7_UART0_PAD1 = MuxC or Pad1 or TNativePin.PA7
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA9_UART0_PAD1 = MuxC or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_UART2_PAD1 = MuxC or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA15_UART0_PAD1 = MuxC or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_UART1_PAD1 = MuxC or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_UART1_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA23_UART3_PAD1 = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(SAMC21XPRO)}
    ,D0_UART = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(SAMD21XPRO) or defined(ARDUINOZERO)}
    ,DEBUG_UART = MuxC or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA31_UART1_PAD1 = MuxC or Pad1 or TNativePin.PA31
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB13_UART4_PAD1 = MuxC or Pad1 or TNativePin.PB13
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB17_UART5_PAD1 = MuxC or Pad1 or TNativePin.PB17
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB21_UART3_PAD1 = MuxC or Pad1 or TNativePin.PB21
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB25_UART0_PAD1 = MuxC or Pad1 or TNativePin.PB25
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB31_UART1_PAD1 = MuxC or Pad1 or TNativePin.PB31
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC7_UART6_PAD1 = MuxC or Pad1 or TNativePin.PC7
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC9_UART6_PAD1 = MuxC or Pad1 or TNativePin.PC9
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC17_UART6_PAD1 = MuxC or Pad1 or TNativePin.PC17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21e15a) or defined(samd21e15b) or defined(samd21e15bu) or defined(samd21e16a) or defined(samd21e16b) or defined(samd21e16bu) or defined(samd21e17a) or defined(samd21e18a) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g17au) or defined(samd21g18a) or defined(samd21g18au) or defined(samd21j)}
    ,PA1_UART1_PAD1 = MuxD or Pad1 or TNativePin.PA1
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA5_UART0_PAD1 = MuxD or Pad1 or TNativePin.PA5
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA9_UART2_PAD1 = MuxD or Pad1 or TNativePin.PA9
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA13_UART4_PAD1 = MuxD or Pad1 or TNativePin.PA13
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA15_UART2_PAD1 = MuxD or Pad1 or TNativePin.PA15
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA17_UART3_PAD1 = MuxD or Pad1 or TNativePin.PA17
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA23_UART2_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA23_UART5_PAD1 = MuxD or Pad1 or TNativePin.PA23
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB3_UART5_PAD1 = MuxD or Pad1 or TNativePin.PB3
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PB9_UART4_PAD1 = MuxD or Pad1 or TNativePin.PB9
  {$endif}
  {$if defined(SAMD20XPRO) or defined(SAMD21XPRO)}
    ,D0_UART = MuxD or Pad1 or TNativePin.PB9
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB21_UART2_PAD1 = MuxD or Pad1 or TNativePin.PB21
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB25_UART4_PAD1 = MuxD or Pad1 or TNativePin.PB25
  {$endif}
  {$if defined(samc20n) or defined(samc21j15a) or defined(samc21j16a) or defined(samc21j17a) or defined(samc21j18a) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB31_UART5_PAD1 = MuxD or Pad1 or TNativePin.PB31
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC28_UART1_PAD1 = MuxD or Pad1 or TNativePin.PC28
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA4_UART0_PAD2 = MuxC or Pad2 or TNativePin.PA4
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_UART1_PAD2 = MuxC or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_UART0_PAD2 = MuxC or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA14_UART2_PAD2 = MuxC or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_UART1_PAD2 = MuxC or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_UART1_PAD2 = MuxC or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_UART5_PAD2 = MuxC or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA24_UART1_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA24_UART3_PAD2 = MuxC or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB14_UART4_PAD2 = MuxC or Pad2 or TNativePin.PB14
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_UART5_PAD2 = MuxC or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB22_UART0_PAD2 = MuxC or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC10_UART6_PAD2 = MuxC or Pad2 or TNativePin.PC10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC18_UART6_PAD2 = MuxC or Pad2 or TNativePin.PC18
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_UART0_PAD2 = MuxC or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA6_UART0_PAD2 = MuxD or Pad2 or TNativePin.PA6
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA8_UART0_PAD2 = MuxD or Pad2 or TNativePin.PA8
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA10_UART2_PAD2 = MuxD or Pad2 or TNativePin.PA10
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA14_UART4_PAD2 = MuxD or Pad2 or TNativePin.PA14
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA16_UART2_PAD2 = MuxD or Pad2 or TNativePin.PA16
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA18_UART3_PAD2 = MuxD or Pad2 or TNativePin.PA18
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA20_UART3_PAD2 = MuxD or Pad2 or TNativePin.PA20
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA24_UART2_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA24_UART5_PAD2 = MuxD or Pad2 or TNativePin.PA24
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA30_UART1_PAD2 = MuxD or Pad2 or TNativePin.PA30
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB0_UART5_PAD2 = MuxD or Pad2 or TNativePin.PB0
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB10_UART4_PAD2 = MuxD or Pad2 or TNativePin.PB10
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB18_UART3_PAD2 = MuxD or Pad2 or TNativePin.PB18
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB22_UART5_PAD2 = MuxD or Pad2 or TNativePin.PB22
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC24_UART4_PAD2 = MuxD or Pad2 or TNativePin.PC24
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA5_UART0_PAD3 = MuxC or Pad3 or TNativePin.PA5
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_UART1_PAD3 = MuxC or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_UART0_PAD3 = MuxC or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(SAMD10XMINI) or defined(SAMD11XPRO) or defined(ARDUINOZERO)}
    ,D0_UART = MuxC or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(SAMD10XMINI) or defined(SAMD11XPRO)}
    ,DEBUG_UART = MuxC or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA15_UART2_PAD3 = MuxC or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_UART1_PAD3 = MuxC or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_UART1_PAD3 = MuxC or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_UART5_PAD3 = MuxC or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA25_UART1_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA25_UART3_PAD3 = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(SAMD20XPRO)}
    ,DEBUG_UART = MuxC or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21j)}
    ,PB15_UART4_PAD3 = MuxC or Pad3 or TNativePin.PB15
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_UART5_PAD3 = MuxC or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB23_UART0_PAD3 = MuxC or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC5_UART6_PAD3 = MuxC or Pad3 or TNativePin.PC5
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC11_UART6_PAD3 = MuxC or Pad3 or TNativePin.PC11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC19_UART6_PAD3 = MuxC or Pad3 or TNativePin.PC19
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_UART0_PAD3 = MuxC or Pad3 or TNativePin.PC25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10d) or defined(samd11d) or defined(samd20) or defined(samd21)}
    ,PA7_UART0_PAD3 = MuxD or Pad3 or TNativePin.PA7
  {$endif}
  {$if defined(samd10) or defined(samd11)}
    ,PA9_UART0_PAD3 = MuxD or Pad3 or TNativePin.PA9
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd11d14am) or defined(samd20) or defined(samd21)}
    ,PA11_UART2_PAD3 = MuxD or Pad3 or TNativePin.PA11
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA15_UART4_PAD3 = MuxD or Pad3 or TNativePin.PA15
  {$endif}
  {$if defined(samd11d14am)}
    ,PA17_UART2_PAD3 = MuxD or Pad3 or TNativePin.PA17
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd20) or defined(samd21)}
    ,PA19_UART3_PAD3 = MuxD or Pad3 or TNativePin.PA19
  {$endif}
  {$if defined(samc20g) or defined(samc20j) or defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA21_UART3_PAD3 = MuxD or Pad3 or TNativePin.PA21
  {$endif}
  {$if defined(samd10d) or defined(samd11d)}
    ,PA25_UART2_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g) or defined(samd21j)}
    ,PA25_UART5_PAD3 = MuxD or Pad3 or TNativePin.PA25
  {$endif}
  {$if defined(samc20) or defined(samc21) or defined(samd10) or defined(samd11) or defined(samd20) or defined(samd21)}
    ,PA31_UART1_PAD3 = MuxD or Pad3 or TNativePin.PA31
  {$endif}
  {$if defined(samc20n) or defined(samc21j) or defined(samc21n) or defined(samd20j) or defined(samd21g15l) or defined(samd21g16l) or defined(samd21j)}
    ,PB1_UART5_PAD3 = MuxD or Pad3 or TNativePin.PB1
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g15l) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g16l) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB11_UART4_PAD3 = MuxD or Pad3 or TNativePin.PB11
  {$endif}
  {$if defined(SAMC21XPRO)}
    ,DEBUG_UART = MuxD or Pad3 or TNativePin.PB11
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PB19_UART3_PAD3 = MuxD or Pad3 or TNativePin.PB19
  {$endif}
  {$if defined(samc20n) or defined(samc21g) or defined(samc21j) or defined(samc21n) or defined(samd20g) or defined(samd20j) or defined(samd21g15a) or defined(samd21g15b) or defined(samd21g16a) or defined(samd21g16b) or defined(samd21g17a) or defined(samd21g18a) or defined(samd21j)}
    ,PB23_UART5_PAD3 = MuxD or Pad3 or TNativePin.PB23
  {$endif}
  {$if defined(samc20n) or defined(samc21n)}
    ,PC25_UART4_PAD3 = MuxD or Pad3 or TNativePin.PC25
  {$endif}
  );
