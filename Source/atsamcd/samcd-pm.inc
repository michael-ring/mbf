//* ========== Instance parameters for PM peripheral ========== */
const
  PM_CTRL_MCSEL_DFLL48M      = 3;
  PM_CTRL_MCSEL_GCLK         = 0;
  PM_CTRL_MCSEL_OSC8M        = 1;
  PM_CTRL_MCSEL_XOSC         = 2;
  PM_PM_CLK_APB_NUM          = 2;


  //******PM_APBA******
  PM_APBAMASK_OFFSET         = $18;          // (PM_APBAMASK offset) APBA Mask */
  PM_APBAMASK_RESETVALUE     = $0000007F;    // (PM_APBAMASK reset_value) APBA Mask */

  PM_APBAMASK_PAC0_Pos       = 0;            // (PM_APBAMASK) PAC0 APB Clock Enable */
  PM_APBAMASK_PAC0           = (1 shl PM_APBAMASK_PAC0_Pos);
  PM_APBAMASK_PM_Pos         = 1;            // (PM_APBAMASK) PM APB Clock Enable */
  PM_APBAMASK_PM             = (1 shl PM_APBAMASK_PM_Pos);
  PM_APBAMASK_SYSCTRL_Pos    = 2;            // (PM_APBAMASK) SYSCTRL APB Clock Enable */
  PM_APBAMASK_SYSCTRL        = (1 shl PM_APBAMASK_SYSCTRL_Pos);
  PM_APBAMASK_GCLK_Pos       = 3;            // (PM_APBAMASK) GCLK APB Clock Enable */
  PM_APBAMASK_GCLK           = (1 shl PM_APBAMASK_GCLK_Pos);
  PM_APBAMASK_WDT_Pos        = 4;            // (PM_APBAMASK) WDT APB Clock Enable */
  PM_APBAMASK_WDT            = (1 shl PM_APBAMASK_WDT_Pos);
  PM_APBAMASK_RTC_Pos        = 5;            // (PM_APBAMASK) RTC APB Clock Enable */
  PM_APBAMASK_RTC            = (1 shl PM_APBAMASK_RTC_Pos);
  PM_APBAMASK_EIC_Pos        = 6;            // (PM_APBAMASK) EIC APB Clock Enable */
  PM_APBAMASK_EIC            = (1 shl PM_APBAMASK_EIC_Pos);
  PM_APBAMASK_MASK           = $0000007F;    // (PM_APBAMASK) MASK Register */

  //******PM_APBB******
  PM_APBBMASK_PORT_Pos       = 3;            // PORT APB Clock Enable */
  PM_APBBMASK_PORT           = (1 shl PM_APBBMASK_PORT_Pos);

  //******PM_APBC******

  {$ifdef samd10}
  PM_APBCMASK_PAC2_Pos       = 0;            // PAC2 APB Clock Enable */
  PM_APBCMASK_PAC2           = (1 shl PM_APBCMASK_PAC2_Pos);
  PM_APBCMASK_EVSYS_Pos      = 1;            // EVSYS APB Clock Enable */
  PM_APBCMASK_EVSYS          = (1 shl PM_APBCMASK_EVSYS_Pos);
  PM_APBCMASK_SERCOM0_Pos    = 2;            // SERCOM0 APB Clock Enable */
  PM_APBCMASK_SERCOM0        = (1 shl PM_APBCMASK_SERCOM0_Pos);
  PM_APBCMASK_SERCOM1_Pos    = 3;            // SERCOM1 APB Clock Enable */
  PM_APBCMASK_SERCOM1        = (1 shl PM_APBCMASK_SERCOM1_Pos);
  PM_APBCMASK_SERCOM2_Pos    = 4;            // SERCOM2 APB Clock Enable */
  PM_APBCMASK_SERCOM2        = (1 shl PM_APBCMASK_SERCOM2_Pos);
  PM_APBCMASK_TCC0_Pos       = 5;            // TCC0 APB Clock Enable */
  PM_APBCMASK_TCC0           = (1 shl PM_APBCMASK_TCC0_Pos);
  PM_APBCMASK_TC1_Pos        = 6;            // TC1 APB Clock Enable */
  PM_APBCMASK_TC1            = (1 shl PM_APBCMASK_TC1_Pos);
  PM_APBCMASK_TC2_Pos        = 7;            // TC2 APB Clock Enable */
  PM_APBCMASK_TC2            = (1 shl PM_APBCMASK_TC2_Pos);
  PM_APBCMASK_ADC_Pos        = 8;            // ADC APB Clock Enable */
  PM_APBCMASK_ADC            = (1 shl PM_APBCMASK_ADC_Pos);
  PM_APBCMASK_AC_Pos         = 9;            // AC APB Clock Enable */
  PM_APBCMASK_AC             = (1 shl PM_APBCMASK_AC_Pos);
  PM_APBCMASK_DAC_Pos        = 10;           // DAC APB Clock Enable */
  PM_APBCMASK_DAC            = (1 shl PM_APBCMASK_DAC_Pos);
  PM_APBCMASK_PTC_Pos        = 11;           // PTC APB Clock Enable */
  PM_APBCMASK_PTC            = (1 shl PM_APBCMASK_PTC_Pos);
  {$endif}

  {$if defined(samd20) or defined(samd21)}
  PM_APBCMASK_PAC2_Pos       = 0;            // PAC2 APB Clock Enable */
  PM_APBCMASK_PAC2           = (1 shl PM_APBCMASK_PAC2_Pos);
  PM_APBCMASK_EVSYS_Pos      = 1;            // EVSYS APB Clock Enable */
  PM_APBCMASK_EVSYS          = (1 shl PM_APBCMASK_EVSYS_Pos);
  PM_APBCMASK_SERCOM0_Pos    = 2;            // SERCOM0 APB Clock Enable */
  PM_APBCMASK_SERCOM0        = (1 shl PM_APBCMASK_SERCOM0_Pos);
  PM_APBCMASK_SERCOM1_Pos    = 3;            // SERCOM1 APB Clock Enable */
  PM_APBCMASK_SERCOM1        = (1 shl PM_APBCMASK_SERCOM1_Pos);
  PM_APBCMASK_SERCOM2_Pos    = 4;            // SERCOM2 APB Clock Enable */
  PM_APBCMASK_SERCOM2        = (1 shl PM_APBCMASK_SERCOM2_Pos);
  PM_APBCMASK_SERCOM3_Pos    = 5;            // SERCOM3 APB Clock Enable */
  PM_APBCMASK_SERCOM3        = (1 shl PM_APBCMASK_SERCOM3_Pos);
  PM_APBCMASK_SERCOM4_Pos    = 6;            // SERCOM4 APB Clock Enable */
  PM_APBCMASK_SERCOM4        = (1 shl PM_APBCMASK_SERCOM4_Pos);
  PM_APBCMASK_SERCOM5_Pos    = 7;            // SERCOM5 APB Clock Enable */
  PM_APBCMASK_SERCOM5        = (1 shl PM_APBCMASK_SERCOM5_Pos);
  PM_APBCMASK_TCC0_Pos       = 8;            // TCC0 APB Clock Enable */
  PM_APBCMASK_TCC0           = (1 shl PM_APBCMASK_TCC0_Pos);
  PM_APBCMASK_TCC1_Pos       = 9;            // TCC1 APB Clock Enable */
  PM_APBCMASK_TCC1           = (1 shl PM_APBCMASK_TCC1_Pos);
  PM_APBCMASK_TCC2_Pos       = 10;            // TCC2 APB Clock Enable */
  PM_APBCMASK_TCC2           = (1 shl PM_APBCMASK_TCC2_Pos);

  PM_APBCMASK_TC1_Pos        = 11;            // TC1 APB Clock Enable */
  PM_APBCMASK_TC1            = (1 shl PM_APBCMASK_TC1_Pos);
  PM_APBCMASK_TC2_Pos        = 12;            // TC2 APB Clock Enable */
  PM_APBCMASK_TC2            = (1 shl PM_APBCMASK_TC2_Pos);
  PM_APBCMASK_TC3_Pos        = 13;            // TC3 APB Clock Enable */
  PM_APBCMASK_TC3            = (1 shl PM_APBCMASK_TC3_Pos);
  PM_APBCMASK_TC4_Pos        = 14;            // TC4 APB Clock Enable */
  PM_APBCMASK_TC4            = (1 shl PM_APBCMASK_TC4_Pos);
  PM_APBCMASK_TC5_Pos        = 15;            // TC5 APB Clock Enable */
  PM_APBCMASK_TC5            = (1 shl PM_APBCMASK_TC5_Pos);

  PM_APBCMASK_ADC_Pos        = 16;            // ADC APB Clock Enable */
  PM_APBCMASK_ADC            = (1 shl PM_APBCMASK_ADC_Pos);
  PM_APBCMASK_AC_Pos         = 17;            // AC APB Clock Enable */
  PM_APBCMASK_AC             = (1 shl PM_APBCMASK_AC_Pos);
  PM_APBCMASK_DAC_Pos        = 18;           // DAC APB Clock Enable */
  PM_APBCMASK_DAC            = (1 shl PM_APBCMASK_DAC_Pos);
  PM_APBCMASK_PTC_Pos        = 19;           // PTC APB Clock Enable */
  PM_APBCMASK_PTC            = (1 shl PM_APBCMASK_PTC_Pos);
  PM_APBCMASK_I2S_Pos        = 20;           // PTC I2S Clock Enable */
  PM_APBCMASK_I2S            = (1 shl PM_APBCMASK_I2S_Pos);
  PM_APBCMASK_AC1_Pos        = 21;            // AC1 APB Clock Enable */
  PM_APBCMASK_AC1            = (1 shl PM_APBCMASK_AC1_Pos);
  {$endif}

  PM_GENERALDIV_Pos        = 0;            //(PM_CPUSEL) CPU Prescaler Selection */
  PM_GENERALDIV_Msk        = ($7 shl PM_GENERALDIV_Pos);
  PM_GENERALDIV_DIV1_Val   = $0;  //(PM_CPUSEL) Divide by 1 */
  PM_GENERALDIV_DIV2_Val   = $1;  //(PM_CPUSEL) Divide by 2 */
  PM_GENERALDIV_DIV4_Val   = $2;  //(PM_CPUSEL) Divide by 4 */
  PM_GENERALDIV_DIV8_Val   = $3;  //(PM_CPUSEL) Divide by 8 */
  PM_GENERALDIV_DIV16_Val  = $4;  //(PM_CPUSEL) Divide by 16 */
  PM_GENERALDIV_DIV32_Val  = $5;  //(PM_CPUSEL) Divide by 32 */
  PM_GENERALDIV_DIV64_Val  = $6;  //(PM_CPUSEL) Divide by 64 */
  PM_GENERALDIV_DIV128_Val = $7;  //(PM_CPUSEL) Divide by 128 */
  PM_GENERALDIV_DIV1       = (PM_GENERALDIV_DIV1_Val     shl PM_GENERALDIV_Pos);
  PM_GENERALDIV_DIV2       = (PM_GENERALDIV_DIV2_Val     shl PM_GENERALDIV_Pos);
  PM_GENERALDIV_DIV4       = (PM_GENERALDIV_DIV4_Val     shl PM_GENERALDIV_Pos);
  PM_GENERALDIV_DIV8       = (PM_GENERALDIV_DIV8_Val     shl PM_GENERALDIV_Pos);
  PM_GENERALDIV_DIV16      = (PM_GENERALDIV_DIV16_Val    shl PM_GENERALDIV_Pos);
  PM_GENERALDIV_DIV32      = (PM_GENERALDIV_DIV32_Val    shl PM_GENERALDIV_Pos);
  PM_GENERALDIV_DIV64      = (PM_GENERALDIV_DIV64_Val    shl PM_GENERALDIV_Pos);
  PM_GENERALDIV_DIV128     = (PM_GENERALDIV_DIV128_Val   shl PM_GENERALDIV_Pos);




