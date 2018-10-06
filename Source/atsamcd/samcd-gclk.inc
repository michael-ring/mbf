//* ========== Instance parameters for GCLK peripheral ========== */
const
  GCLK_GENDIV_BITS           = 16;
  GCLK_GEN_NUM               = 6;        // Number of Generic Clock Generators
  GCLK_GEN_NUM_MSB           = 5;        // Number of Generic Clock Generators - 1
  GCLK_GEN_SOURCE_NUM_MSB    = 8;        // Number of Generic Clock Sources - 1
  GCLK_NUM                   = 24;       // Number of Generic Clock Users

  {$ifdef samd}
  GCLK_SOURCE_DFLL48M        = 7;
  GCLK_SOURCE_FDPLL          = 8;
  {$endif}
  {$ifdef samc}
  GCLK_SOURCE_FDPLL          = 7;
  {$endif}
  GCLK_SOURCE_GCLKGEN1       = 2;
  GCLK_SOURCE_GCLKIN         = 1;
  GCLK_SOURCE_NUM            = 9;        // Number of Generic Clock Sources
  GCLK_SOURCE_OSCULP32K      = 3;
  {$ifdef samd}
  GCLK_SOURCE_OSC8M          = 6;
  {$endif}
  {$ifdef samc}
  GCLK_SOURCE_OSC48M         = 6;
  {$endif}
  GCLK_SOURCE_OSC32K         = 4;
  GCLK_SOURCE_XOSC           = 0;
  GCLK_SOURCE_XOSC32K        = 5;

  GCLK_CLKCTRL_OFFSET        = $2;          //(GCLK_CLKCTRL offset) Generic Clock Control */
  GCLK_CLKCTRL_RESETVALUE    = $0000;     //(GCLK_CLKCTRL reset_value) Generic Clock Control */

  GCLK_CLKCTRL_ID_Pos          = 0;   //(GCLK_CLKCTRL) Generic Clock Selection ID */
  GCLK_CLKCTRL_ID_Msk          = ($3F shl GCLK_CLKCTRL_ID_Pos);

  GCLK_CLKCTRL_ID_DFLL48_Val   = $00;  //(GCLK_CLKCTRL) DFLL48 */

  {$ifdef has_fdpll}
  SAMD_GCLK_CLKCTRL_FDPLL_OFFSET   = 2;
  {$else}
  SAMD_GCLK_CLKCTRL_FDPLL_OFFSET   = 0;
  {$endif}
  {$ifdef has_usb}
  SAMD_GCLK_CLKCTRL_USB_OFFSET   = 1;
  {$else}
  SAMD_GCLK_CLKCTRL_USB_OFFSET   = 0;
  {$endif}

  {$ifdef has_fdpll}
  GCLK_CLKCTRL_ID_FDPLL_Val    = $01;  //(GCLK_CLKCTRL) FDPLL */
  GCLK_CLKCTRL_ID_FDPLL32K_Val = $02;  //(GCLK_CLKCTRL) FDPLL32K */
  {$endif has_fdpll}
  GCLK_CLKCTRL_ID_WDT_Val      = $01+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET;  //(GCLK_CLKCTRL) WDT */
  GCLK_CLKCTRL_ID_RTC_Val      = $02+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET;  //(GCLK_CLKCTRL) RTC */
  GCLK_CLKCTRL_ID_EIC_Val      = $03+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET;  //(GCLK_CLKCTRL) EIC */
  {$ifdef has_usb}
  GCLK_CLKCTRL_ID_USB_Val      = $04+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET;  //(GCLK_CLKCTRL) USB */
  {$endif}
  GCLK_CLKCTRL_ID_EVSYS_0_Val  = $04+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_0 */
  GCLK_CLKCTRL_ID_EVSYS_1_Val  = $05+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_1 */
  GCLK_CLKCTRL_ID_EVSYS_2_Val  = $06+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_2 */
  GCLK_CLKCTRL_ID_EVSYS_3_Val  = $07+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_3 */
  GCLK_CLKCTRL_ID_EVSYS_4_Val  = $08+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_4 */
  GCLK_CLKCTRL_ID_EVSYS_5_Val  = $09+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_5 */
  GCLK_CLKCTRL_ID_EVSYS_6_Val  = $0A+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_6 */
  GCLK_CLKCTRL_ID_EVSYS_7_Val  = $0B+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_7 */
  GCLK_CLKCTRL_ID_EVSYS_8_Val  = $0C+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_8 */
  GCLK_CLKCTRL_ID_EVSYS_9_Val  = $0D+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_9 */
  GCLK_CLKCTRL_ID_EVSYS_10_Val = $0E+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_10 */
  GCLK_CLKCTRL_ID_EVSYS_11_Val = $0F+SAMD_GCLK_CLKCTRL_FDPLL_OFFSET+SAMD_GCLK_CLKCTRL_USB_OFFSET;  //(GCLK_CLKCTRL) EVSYS_11 */

  GCLK_CLKCTRL_ID_DFLL48       = (GCLK_CLKCTRL_ID_DFLL48_Val shl GCLK_CLKCTRL_ID_Pos);
  {$ifdef has_fdpll}
  GCLK_CLKCTRL_ID_FDPLL        = (GCLK_CLKCTRL_ID_FDPLL_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_FDPLL32K     = (GCLK_CLKCTRL_ID_FDPLL32K_Val shl GCLK_CLKCTRL_ID_Pos);
  {$endif has_fdpll}
  GCLK_CLKCTRL_ID_WDT          = (GCLK_CLKCTRL_ID_WDT_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_RTC          = (GCLK_CLKCTRL_ID_RTC_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EIC          = (GCLK_CLKCTRL_ID_EIC_Val shl GCLK_CLKCTRL_ID_Pos);
  {$ifdef has_usb}
  GCLK_CLKCTRL_ID_USB          = (GCLK_CLKCTRL_ID_USB_Val shl GCLK_CLKCTRL_ID_Pos);
  {$endif has_usb}
  GCLK_CLKCTRL_ID_EVSYS_0      = (GCLK_CLKCTRL_ID_EVSYS_0_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_1      = (GCLK_CLKCTRL_ID_EVSYS_1_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_2      = (GCLK_CLKCTRL_ID_EVSYS_2_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_3      = (GCLK_CLKCTRL_ID_EVSYS_3_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_4      = (GCLK_CLKCTRL_ID_EVSYS_4_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_5      = (GCLK_CLKCTRL_ID_EVSYS_5_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_6      = (GCLK_CLKCTRL_ID_EVSYS_6_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_7      = (GCLK_CLKCTRL_ID_EVSYS_7_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_8      = (GCLK_CLKCTRL_ID_EVSYS_8_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_9      = (GCLK_CLKCTRL_ID_EVSYS_9_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_10     = (GCLK_CLKCTRL_ID_EVSYS_10_Val shl GCLK_CLKCTRL_ID_Pos);
  GCLK_CLKCTRL_ID_EVSYS_11     = (GCLK_CLKCTRL_ID_EVSYS_11_Val shl GCLK_CLKCTRL_ID_Pos);

  {$ifdef samd}
  GCLK_CLKCTRL_GEN_Pos         = 8; //(GCLK_CLKCTRL) Generic Clock Generator */
  {$endif}
  {$ifdef samc}
  GCLK_CLKCTRL_GEN_Pos         = 0; //(GCLK_PCHCTRL) Generic Clock Generator */
  {$endif}
  GCLK_CLKCTRL_GEN_Msk         = ($0F shl GCLK_CLKCTRL_GEN_Pos);
  GCLK_CLKCTRL_GEN_GCLK0_Val   = $00;  //(GCLK_CLKCTRL) Generic clock generator 0 */
  GCLK_CLKCTRL_GEN_GCLK1_Val   = $01;  //(GCLK_CLKCTRL) Generic clock generator 1 */
  GCLK_CLKCTRL_GEN_GCLK2_Val   = $02;  //(GCLK_CLKCTRL) Generic clock generator 2 */
  GCLK_CLKCTRL_GEN_GCLK3_Val   = $03;  //(GCLK_CLKCTRL) Generic clock generator 3 */
  GCLK_CLKCTRL_GEN_GCLK4_Val   = $04;  //(GCLK_CLKCTRL) Generic clock generator 4 */
  GCLK_CLKCTRL_GEN_GCLK5_Val   = $05;  //(GCLK_CLKCTRL) Generic clock generator 5 */
  GCLK_CLKCTRL_GEN_GCLK6_Val   = $06;  //(GCLK_CLKCTRL) Generic clock generator 6 */
  GCLK_CLKCTRL_GEN_GCLK7_Val   = $07;  //(GCLK_CLKCTRL) Generic clock generator 7 */
  {$ifdef samd21}
  GCLK_CLKCTRL_GEN_GCLK8_Val   = $08;  //(GCLK_CLKCTRL) Generic clock generator 8 */
  {$endif}
  GCLK_CLKCTRL_GEN_GCLK0       = (GCLK_CLKCTRL_GEN_GCLK0_Val shl GCLK_CLKCTRL_GEN_Pos);
  GCLK_CLKCTRL_GEN_GCLK1       = (GCLK_CLKCTRL_GEN_GCLK1_Val shl GCLK_CLKCTRL_GEN_Pos);
  GCLK_CLKCTRL_GEN_GCLK2       = (GCLK_CLKCTRL_GEN_GCLK2_Val shl GCLK_CLKCTRL_GEN_Pos);
  GCLK_CLKCTRL_GEN_GCLK3       = (GCLK_CLKCTRL_GEN_GCLK3_Val shl GCLK_CLKCTRL_GEN_Pos);
  GCLK_CLKCTRL_GEN_GCLK4       = (GCLK_CLKCTRL_GEN_GCLK4_Val shl GCLK_CLKCTRL_GEN_Pos);
  GCLK_CLKCTRL_GEN_GCLK5       = (GCLK_CLKCTRL_GEN_GCLK5_Val shl GCLK_CLKCTRL_GEN_Pos);
  GCLK_CLKCTRL_GEN_GCLK6       = (GCLK_CLKCTRL_GEN_GCLK6_Val shl GCLK_CLKCTRL_GEN_Pos);
  GCLK_CLKCTRL_GEN_GCLK7       = (GCLK_CLKCTRL_GEN_GCLK7_Val shl GCLK_CLKCTRL_GEN_Pos);
  {$ifdef samd21}
  GCLK_CLKCTRL_GEN_GCLK8       = (GCLK_CLKCTRL_GEN_GCLK8_Val shl GCLK_CLKCTRL_GEN_Pos);
  {$endif}
  {$ifdef samd}
  GCLK_CLKCTRL_CLKEN_Pos       = 14;           //(GCLK_CLKCTRL) Clock Enable */
  GCLK_CLKCTRL_CLKEN           = (1 shl GCLK_CLKCTRL_CLKEN_Pos);
  GCLK_CLKCTRL_WRTLOCK_Pos     = 15;           //(GCLK_CLKCTRL) Write Lock */
  GCLK_CLKCTRL_WRTLOCK         = (1 shl GCLK_CLKCTRL_WRTLOCK_Pos);
  {$endif}
  {$ifdef samc}
  GCLK_PCHCTRL_CLKEN_Pos       = 6;           //(GCLK_PCHCTRL) Clock Enable */
  GCLK_PCHCTRL_CLKEN           = (1 shl GCLK_PCHCTRL_CLKEN_Pos);
  GCLK_PCHCTRL_CHEN_Pos        = GCLK_PCHCTRL_CLKEN_Pos;
  GCLK_PCHCTRL_CHEN            = GCLK_PCHCTRL_CLKEN;
  GCLK_PCHCTRL_WRTLOCK_Pos     = 7;           //(GCLK_PCHCTRL) Write Lock */
  GCLK_PCHCTRL_WRTLOCK         = (1 shl GCLK_PCHCTRL_WRTLOCK_Pos);
  {$endif}

  GCLK_GENCTRL_OFFSET          = $04;          // (GCLK_GENCTRL offset) Generic Clock Generator Control */
  GCLK_GENCTRL_RESETVALUE      = $00000000; // (GCLK_GENCTRL reset_value) Generic Clock Generator Control */

  {$ifdef samd}
  GCLK_GENCTRL_ID_Pos          = 0;            // (GCLK_GENCTRL) Generic Clock Generator Selection */
  GCLK_GENCTRL_ID_Msk          = ($0F shl GCLK_GENCTRL_ID_Pos);
  GCLK_GENCTRL_SRC_Pos         = 8;            // (GCLK_GENCTRL) Source Select */
  GCLK_GENCTRL_SRC_Msk         = ($1F shl GCLK_GENCTRL_SRC_Pos);
  {$endif}
  {$ifdef samc}
  GCLK_GENCTRL_SRC_Pos           = 0;        // (GCLK_GENCTRL) Source Select */
  GCLK_GENCTRL_SRC_Msk           = ($7 shl GCLK_GENCTRL_SRC_Pos);
  {$endif}

  GCLK_GENCTRL_SRC_XOSC_Val    = $00;  // (GCLK_GENCTRL) XOSC oscillator output */
  GCLK_GENCTRL_SRC_GCLKIN_Val  = $01;  // (GCLK_GENCTRL) Generator input pad */
  GCLK_GENCTRL_SRC_GCLKGEN1_Val= $02;  // (GCLK_GENCTRL) Generic clock generator 1 output */
  GCLK_GENCTRL_SRC_OSCULP32K_Val = $03;  // (GCLK_GENCTRL) OSCULP32K oscillator output */
  GCLK_GENCTRL_SRC_OSC32K_Val  = $04;  // (GCLK_GENCTRL) OSC32K oscillator output */
  GCLK_GENCTRL_SRC_XOSC32K_Val = $05;  // (GCLK_GENCTRL) XOSC32K oscillator output */

  {$ifdef samd}
  GCLK_GENCTRL_SRC_OSC8M_Val   = $06;  // (GCLK_GENCTRL) OSC8M oscillator output */
  GCLK_GENCTRL_SRC_DFLL48M_Val = $07;  // (GCLK_GENCTRL) DFLL48M output */
  {$ifdef has_fdpll}
  GCLK_GENCTRL_SRC_FDPLL_Val   = $08;  // (GCLK_GENCTRL) FDPLL output */
  {$endif has_fdpll}
  {$endif}

  {$ifdef samc}
  GCLK_GENCTRL_SRC_OSC48M_Val    = $06;  // (GCLK_GENCTRL) OSC8M oscillator output */
  GCLK_GENCTRL_SRC_DPLL96M_Val   = $07;  // (GCLK_GENCTRL) DFLL48M output */
  {$endif}

  GCLK_GENCTRL_SRC_XOSC      = (GCLK_GENCTRL_SRC_XOSC_Val      shl GCLK_GENCTRL_SRC_Pos);
  GCLK_GENCTRL_SRC_GCLKIN    = (GCLK_GENCTRL_SRC_GCLKIN_Val    shl GCLK_GENCTRL_SRC_Pos);
  GCLK_GENCTRL_SRC_GCLKGEN1  = (GCLK_GENCTRL_SRC_GCLKGEN1_Val  shl GCLK_GENCTRL_SRC_Pos);
  GCLK_GENCTRL_SRC_OSCULP32K = (GCLK_GENCTRL_SRC_OSCULP32K_Val shl GCLK_GENCTRL_SRC_Pos);
  GCLK_GENCTRL_SRC_OSC32K    = (GCLK_GENCTRL_SRC_OSC32K_Val    shl GCLK_GENCTRL_SRC_Pos);
  GCLK_GENCTRL_SRC_XOSC32K   = (GCLK_GENCTRL_SRC_XOSC32K_Val   shl GCLK_GENCTRL_SRC_Pos);

  {$ifdef samd}
  GCLK_GENCTRL_SRC_OSC8M     = (GCLK_GENCTRL_SRC_OSC8M_Val     shl GCLK_GENCTRL_SRC_Pos);
  GCLK_GENCTRL_SRC_DFLL48M   = (GCLK_GENCTRL_SRC_DFLL48M_Val   shl GCLK_GENCTRL_SRC_Pos);
  {$ifdef has_fdpll}
  GCLK_GENCTRL_SRC_FDPLL     = (GCLK_GENCTRL_SRC_FDPLL_Val     shl GCLK_GENCTRL_SRC_Pos);
  {$endif has_fdpll}
  {$endif}

  {$ifdef samc}
  GCLK_GENCTRL_SRC_OSC48M    = (GCLK_GENCTRL_SRC_OSC48M_Val    shl GCLK_GENCTRL_SRC_Pos);
  GCLK_GENCTRL_SRC_DPLL96M   = (GCLK_GENCTRL_SRC_DPLL96M_Val   shl GCLK_GENCTRL_SRC_Pos);
  {$endif}

  {$ifdef samd}
  SAM_GCLK_GENCTRL_OFFSET   = 16;
  {$endif}
  {$ifdef samc}
  SAM_GCLK_GENCTRL_OFFSET   = 8;
  {$endif}

  GCLK_GENCTRL_GENEN_Pos     = 0+SAM_GCLK_GENCTRL_OFFSET;           // (GCLK_GENCTRL) Generic Clock Generator Enable */
  GCLK_GENCTRL_GENEN         = (1 shl GCLK_GENCTRL_GENEN_Pos);
  GCLK_GENCTRL_IDC_Pos       = 1+SAM_GCLK_GENCTRL_OFFSET;           // (GCLK_GENCTRL) Improve Duty Cycle */
  GCLK_GENCTRL_IDC           = (1 shl GCLK_GENCTRL_IDC_Pos);
  GCLK_GENCTRL_OOV_Pos       = 2+SAM_GCLK_GENCTRL_OFFSET;           // (GCLK_GENCTRL) Output Off Value */
  GCLK_GENCTRL_OOV           = (1 shl GCLK_GENCTRL_OOV_Pos);
  GCLK_GENCTRL_OE_Pos        = 3+SAM_GCLK_GENCTRL_OFFSET;           // (GCLK_GENCTRL) Output Enable */
  GCLK_GENCTRL_OE            = (1 shl GCLK_GENCTRL_OE_Pos);
  GCLK_GENCTRL_DIVSEL_Pos    = 4+SAM_GCLK_GENCTRL_OFFSET;           // (GCLK_GENCTRL) Divide Selection */
  GCLK_GENCTRL_DIVSEL        = (1 shl GCLK_GENCTRL_DIVSEL_Pos);
  GCLK_GENCTRL_RUNSTDBY_Pos  = 5+SAM_GCLK_GENCTRL_OFFSET;           // (GCLK_GENCTRL) Run in Standby */
  GCLK_GENCTRL_RUNSTDBY      = (1 shl GCLK_GENCTRL_RUNSTDBY_Pos);

  {$ifdef samc}
  GCLK_GENCTRL_DIV_Pos       = 8+SAM_GCLK_GENCTRL_OFFSET;           // \brief (GCLK_GENCTRL) Division Factor */
  GCLK_GENCTRL_DIV_Msk       = ($FFFF shl GCLK_GENCTRL_DIV_Pos);
  {$endif}


   GCLK_GENDIV_OFFSET        = $8;          // (GCLK_GENDIV offset) Generic Clock Generator Division */
   GCLK_GENDIV_RESETVALUE    = $00000000; // (GCLK_GENDIV reset_value) Generic Clock Generator Division */

   GCLK_GENDIV_ID_Pos        = 0;            // (GCLK_GENDIV) Generic Clock Generator Selection */
   GCLK_GENDIV_ID_Msk        = ($F shl GCLK_GENDIV_ID_Pos);
   GCLK_GENDIV_GEN_GCLK0_Val   = $00;  //(GCLK_GENDIV) Generic clock divisor 0 */
   GCLK_GENDIV_GEN_GCLK1_Val   = $01;  //(GCLK_GENDIV) Generic clock divisor 1 */
   GCLK_GENDIV_GEN_GCLK2_Val   = $02;  //(GCLK_GENDIV) Generic clock divisor 2 */
   GCLK_GENDIV_GEN_GCLK3_Val   = $03;  //(GCLK_GENDIV) Generic clock divisor 3 */
   GCLK_GENDIV_GEN_GCLK4_Val   = $04;  //(GCLK_GENDIV) Generic clock divisor 4 */
   GCLK_GENDIV_GEN_GCLK5_Val   = $05;  //(GCLK_GENDIV) Generic clock divisor 5 */
   GCLK_GENDIV_GEN_GCLK6_Val   = $06;  //(GCLK_GENDIV) Generic clock divisor 6 */
   GCLK_GENDIV_GEN_GCLK7_Val   = $07;  //(GCLK_GENDIV) Generic clock divisor 7 */
   GCLK_GENDIV_GEN_GCLK0       = (GCLK_GENDIV_GEN_GCLK0_Val shl GCLK_GENDIV_ID_Pos);
   GCLK_GENDIV_GEN_GCLK1       = (GCLK_GENDIV_GEN_GCLK1_Val shl GCLK_GENDIV_ID_Pos);
   GCLK_GENDIV_GEN_GCLK2       = (GCLK_GENDIV_GEN_GCLK2_Val shl GCLK_GENDIV_ID_Pos);
   GCLK_GENDIV_GEN_GCLK3       = (GCLK_GENDIV_GEN_GCLK3_Val shl GCLK_GENDIV_ID_Pos);
   GCLK_GENDIV_GEN_GCLK4       = (GCLK_GENDIV_GEN_GCLK4_Val shl GCLK_GENDIV_ID_Pos);
   GCLK_GENDIV_GEN_GCLK5       = (GCLK_GENDIV_GEN_GCLK5_Val shl GCLK_GENDIV_ID_Pos);
   GCLK_GENDIV_GEN_GCLK6       = (GCLK_GENDIV_GEN_GCLK6_Val shl GCLK_GENDIV_ID_Pos);
   GCLK_GENDIV_GEN_GCLK7       = (GCLK_GENDIV_GEN_GCLK7_Val shl GCLK_GENDIV_ID_Pos);
  {$ifdef samd}
   GCLK_GENDIV_DIV_Pos       = 8;            // (GCLK_GENDIV) Division Factor */
   GCLK_GENDIV_DIV_Msk       = ($FFFF shl GCLK_GENDIV_DIV_Pos);
  {$endif}

  GCLK_CTRL_OFFSET           = $0;        // (GCLK_CTRL offset) Control */
  GCLK_CTRL_RESETVALUE       = $00;       // (GCLK_CTRL reset_value) Control */

  GCLK_CTRL_SWRST_Pos        = 0;         // (GCLK_CTRL) Software Reset */
  GCLK_CTRL_SWRST            = (1 << GCLK_CTRL_SWRST_Pos);
  GCLK_CTRL_MASK             = $01;       // (GCLK_CTRL) MASK Register */

  GCLK_STATUS_OFFSET         = $1;          // (GCLK_STATUS offset) Status */
  GCLK_STATUS_RESETVALUE     = $00;       // (GCLK_STATUS reset_value) Status */

  GCLK_STATUS_SYNCBUSY_Pos   = 7;            // (GCLK_STATUS) Synchronization Busy Status */
  GCLK_STATUS_SYNCBUSY       = (1 shl GCLK_STATUS_SYNCBUSY_Pos);
  GCLK_STATUS_MASK           = $80;       // (GCLK_STATUS) MASK Register */

