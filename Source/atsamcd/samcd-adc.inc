//* ========== Instance parameters for ADC peripheral ========== */
const
  ADC_DMAC_ID_RESRDY        = 18;       // Index of DMA RESRDY trigger
  ADC_EXTCHANNEL_MSB        = 9;        // Number of external channels

  {$ifdef samd10}
  ADC_GCLK_ID               = $13;       // Index of Generic Clock
  {$endif}
  {$ifdef samd20}
  ADC_GCLK_ID               = $17;       // Index of Generic Clock
  {$endif}
  {$ifdef samd21}
  ADC_GCLK_ID               = $1E;       // Index of Generic Clock
  {$endif}
  {$ifdef samc21}
  ADC_GCLK_ID               = 33;       // Index of Generic Clock
  ADC1_GCLK_ID              = 34;       // Index of Generic Clock
  {$endif}

  ADC_RESULT_BITS           = 16;       // Size of RESULT bitfield
  ADC_RESULT_MSB            = 15;       // Size of Result

  ADC_STATUS_SYNCBUSY_Pos   = 7;

  ADC_CTRLA_SWRST_Pos       =  0;       // (ADC_CTRLA) Software Reset */
  ADC_CTRLA_SWRST           =  ($1 shl ADC_CTRLA_SWRST_Pos);
  ADC_CTRLA_ENABLE_Pos      =  1;       // (ADC_CTRLA) Enable */
  ADC_CTRLA_ENABLE          =  ($1 shl ADC_CTRLA_ENABLE_Pos);
  ADC_CTRLA_RUNSTDBY_Pos    =  2;       // (ADC_CTRLA) Run in Standby */
  ADC_CTRLA_RUNSTDBY        =  ($1 shl ADC_CTRLA_RUNSTDBY_Pos);
  ADC_CTRLA_MASK            =  $07;     // (ADC_CTRLA) MASK Register */

  ADC_REFCTRL_REFSEL_Pos          =  0;   //(ADC_REFCTRL) Reference Selection */
  ADC_REFCTRL_REFSEL_Msk          = ($F shl ADC_REFCTRL_REFSEL_Pos);
  ADC_REFCTRL_REFSEL_INT1V_Val    = $0;   //(ADC_REFCTRL) 1.0V voltage reference */
  ADC_REFCTRL_REFSEL_INTVCC0_Val  = $1;   //(ADC_REFCTRL) 1/1.48 VDDANA */
  ADC_REFCTRL_REFSEL_INTVCC1_Val  = $2;   //(ADC_REFCTRL) 1/2 VDDANA (only for VDDANA > 2.0V) */
  ADC_REFCTRL_REFSEL_AREFA_Val    = $3;   //(ADC_REFCTRL) External reference */
  {$ifdef samd}
  ADC_REFCTRL_REFSEL_AREFB_Val    = $4;   //(ADC_REFCTRL) External reference */
  {$endif}
  {$ifdef samc}
  ADC_REFCTRL_REFSEL_DAC_Val      = $4;   //(ADC_REFCTRL) External reference */
  ADC_REFCTRL_REFSEL_INTVCC2_Val  = $5;   //(ADC_REFCTRL) External reference */
  {$endif}
  ADC_REFCTRL_REFSEL_INT1V        = (ADC_REFCTRL_REFSEL_INT1V_Val  shl ADC_REFCTRL_REFSEL_Pos);
  ADC_REFCTRL_REFSEL_INTVCC0      = (ADC_REFCTRL_REFSEL_INTVCC0_Val shl ADC_REFCTRL_REFSEL_Pos);
  ADC_REFCTRL_REFSEL_INTVCC1      = (ADC_REFCTRL_REFSEL_INTVCC1_Val shl ADC_REFCTRL_REFSEL_Pos);
  ADC_REFCTRL_REFSEL_AREFA        = (ADC_REFCTRL_REFSEL_AREFA_Val  shl ADC_REFCTRL_REFSEL_Pos);
  {$ifdef samd}
  ADC_REFCTRL_REFSEL_AREFB        = (ADC_REFCTRL_REFSEL_AREFB_Val  shl ADC_REFCTRL_REFSEL_Pos);
  {$endif}
  {$ifdef samc}
  ADC_REFCTRL_REFSEL_DAC          = (ADC_REFCTRL_REFSEL_DAC_Val  shl ADC_REFCTRL_REFSEL_Pos);
  ADC_REFCTRL_REFSEL_INTVCC2      = (ADC_REFCTRL_REFSEL_INTVCC2_Val  shl ADC_REFCTRL_REFSEL_Pos);
  {$endif}
  ADC_REFCTRL_REFCOMP_Pos         = 7;    //(ADC_REFCTRL) Reference Buffer Offset Compensation Enable */
  ADC_REFCTRL_REFCOMP             = ($1 shl ADC_REFCTRL_REFCOMP_Pos);
  ADC_REFCTRL_MASK                = $8F;  //(ADC_REFCTRL) MASK Register */

  ADC_CTRLB_DIFFMODE_Pos           = 0;   //(ADC_CTRLB) Differential Mode */
  ADC_CTRLB_DIFFMODE               = ($1 shl ADC_CTRLB_DIFFMODE_Pos);
  ADC_CTRLB_LEFTADJ_Pos            = 1;   //(ADC_CTRLB) Left-Adjusted Result */
  ADC_CTRLB_LEFTADJ                = ($1 shl ADC_CTRLB_LEFTADJ_Pos);
  ADC_CTRLB_FREERUN_Pos            = 2;   //(ADC_CTRLB) Free Running Mode */
  ADC_CTRLB_FREERUN                = ($1 shl ADC_CTRLB_FREERUN_Pos);
  ADC_CTRLB_CORREN_Pos             = 3;   //(ADC_CTRLB) Digital Correction Logic Enabled */
  ADC_CTRLB_CORREN                 = ($1 shl ADC_CTRLB_CORREN_Pos);
  ADC_CTRLB_RESSEL_Pos             = 4;   //(ADC_CTRLB) Conversion Result Resolution */
  ADC_CTRLB_RESSEL_Msk             = ($3 shl ADC_CTRLB_RESSEL_Pos);
  ADC_CTRLB_RESSEL_12BIT_Val       = $0;  //(ADC_CTRLB) 12-bit result */
  ADC_CTRLB_RESSEL_16BIT_Val       = $1;  //(ADC_CTRLB) For averaging mode output */
  ADC_CTRLB_RESSEL_10BIT_Val       = $2;  //(ADC_CTRLB) 10-bit result */
  ADC_CTRLB_RESSEL_8BIT_Val        = $3;  //(ADC_CTRLB) 8-bit result */
  ADC_CTRLB_RESSEL_12BIT           = (ADC_CTRLB_RESSEL_12BIT_Val    shl ADC_CTRLB_RESSEL_Pos);
  ADC_CTRLB_RESSEL_16BIT           = (ADC_CTRLB_RESSEL_16BIT_Val    shl ADC_CTRLB_RESSEL_Pos);
  ADC_CTRLB_RESSEL_10BIT           = (ADC_CTRLB_RESSEL_10BIT_Val    shl ADC_CTRLB_RESSEL_Pos);
  ADC_CTRLB_RESSEL_8BIT            = (ADC_CTRLB_RESSEL_8BIT_Val     shl ADC_CTRLB_RESSEL_Pos);

  {$ifdef samc}
  ADC_CTRLC_R2R_Pos                = 7;
  ADC_CTRLC_R2R                    = ($1 shl ADC_CTRLC_R2R_Pos);

  ADC_CTRLC_WINMODE_Pos            = 8;
  ADC_CTRLC_WINMODE_Msk            = ($7 shl ADC_CTRLC_WINMODE_Pos);
  ADC_CTRLC_WINMODE_DISABLE_Val    = $0;
  ADC_CTRLC_WINMODE_MODE1_Val      = $1;
  ADC_CTRLC_WINMODE_MODE2_Val      = $2;
  ADC_CTRLC_WINMODE_MODE3_Val      = $3;
  ADC_CTRLC_WINMODE_MODE4_Val      = $4;

  ADC_CTRLC_DUALSEL_Pos            = 12;
  ADC_CTRLC_DUALSEL_Msk            = ($3 shl ADC_CTRLC_DUALSEL_Pos);
  ADC_CTRLC_DUALSEL_BOTH_Val       = $0;
  ADC_CTRLC_DUALSEL_INTERLEAVE_Val = $1;
  {$endif}

  {$ifdef samd}
  ADC_CTRLB_PRESCALER_Pos          = 8;            //(ADC_CTRLB) Prescaler Configuration */
  ADC_CTRLB_PRESCALER_Msk          = ($7 shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV4_Val     = $0;  //(ADC_CTRLB) Peripheral clock divided by 4 */
  ADC_CTRLB_PRESCALER_DIV8_Val     = $1;  //(ADC_CTRLB) Peripheral clock divided by 8 */
  ADC_CTRLB_PRESCALER_DIV16_Val    = $2;  //(ADC_CTRLB) Peripheral clock divided by 16 */
  ADC_CTRLB_PRESCALER_DIV32_Val    = $3;  //(ADC_CTRLB) Peripheral clock divided by 32 */
  ADC_CTRLB_PRESCALER_DIV64_Val    = $4;  //(ADC_CTRLB) Peripheral clock divided by 64 */
  ADC_CTRLB_PRESCALER_DIV128_Val   = $5;  //(ADC_CTRLB) Peripheral clock divided by 128 */
  ADC_CTRLB_PRESCALER_DIV256_Val   = $6;  //(ADC_CTRLB) Peripheral clock divided by 256 */
  ADC_CTRLB_PRESCALER_DIV512_Val   = $7;  //(ADC_CTRLB) Peripheral clock divided by 512 */
  ADC_CTRLB_PRESCALER_DIV4         = (ADC_CTRLB_PRESCALER_DIV4_Val  shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV8         = (ADC_CTRLB_PRESCALER_DIV8_Val  shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV16        = (ADC_CTRLB_PRESCALER_DIV16_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV32        = (ADC_CTRLB_PRESCALER_DIV32_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV64        = (ADC_CTRLB_PRESCALER_DIV64_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV128       = (ADC_CTRLB_PRESCALER_DIV128_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV256       = (ADC_CTRLB_PRESCALER_DIV256_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV512       = (ADC_CTRLB_PRESCALER_DIV512_Val shl ADC_CTRLB_PRESCALER_Pos);
  {$endif}

  {$ifdef samc}
  ADC_CTRLB_PRESCALER_Pos          = 0;            //(ADC_CTRLB) Prescaler Configuration */
  ADC_CTRLB_PRESCALER_Msk          = ($7 shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV2_Val     = $0;  //(ADC_CTRLB) Peripheral clock divided by 4 */
  ADC_CTRLB_PRESCALER_DIV4_Val     = $1;  //(ADC_CTRLB) Peripheral clock divided by 8 */
  ADC_CTRLB_PRESCALER_DIV8_Val     = $2;  //(ADC_CTRLB) Peripheral clock divided by 16 */
  ADC_CTRLB_PRESCALER_DIV16_Val    = $3;  //(ADC_CTRLB) Peripheral clock divided by 32 */
  ADC_CTRLB_PRESCALER_DIV32_Val    = $4;  //(ADC_CTRLB) Peripheral clock divided by 64 */
  ADC_CTRLB_PRESCALER_DIV64_Val    = $5;  //(ADC_CTRLB) Peripheral clock divided by 128 */
  ADC_CTRLB_PRESCALER_DIV128_Val   = $6;  //(ADC_CTRLB) Peripheral clock divided by 256 */
  ADC_CTRLB_PRESCALER_DIV256_Val   = $7;  //(ADC_CTRLB) Peripheral clock divided by 512 */
  ADC_CTRLB_PRESCALER_DIV2         = (ADC_CTRLB_PRESCALER_DIV2_Val  shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV4         = (ADC_CTRLB_PRESCALER_DIV4_Val  shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV8         = (ADC_CTRLB_PRESCALER_DIV8_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV16        = (ADC_CTRLB_PRESCALER_DIV16_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV32        = (ADC_CTRLB_PRESCALER_DIV32_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV64        = (ADC_CTRLB_PRESCALER_DIV64_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV128       = (ADC_CTRLB_PRESCALER_DIV128_Val shl ADC_CTRLB_PRESCALER_Pos);
  ADC_CTRLB_PRESCALER_DIV256       = (ADC_CTRLB_PRESCALER_DIV256_Val shl ADC_CTRLB_PRESCALER_Pos);
  {$endif}


  ADC_AVGCTRL_SAMPLENUM_Pos        = 0;            //(ADC_AVGCTRL) Number of Samples to be Collected */
  ADC_AVGCTRL_SAMPLENUM_Msk        = ($F shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_1_Val      = $0;  //(ADC_AVGCTRL) 1 sample */
  ADC_AVGCTRL_SAMPLENUM_2_Val      = $1;  //(ADC_AVGCTRL) 2 samples */
  ADC_AVGCTRL_SAMPLENUM_4_Val      = $2;  //(ADC_AVGCTRL) 4 samples */
  ADC_AVGCTRL_SAMPLENUM_8_Val      = $3;  //(ADC_AVGCTRL) 8 samples */
  ADC_AVGCTRL_SAMPLENUM_16_Val     = $4;  //(ADC_AVGCTRL) 16 samples */
  ADC_AVGCTRL_SAMPLENUM_32_Val     = $5;  //(ADC_AVGCTRL) 32 samples */
  ADC_AVGCTRL_SAMPLENUM_64_Val     = $6;  //(ADC_AVGCTRL) 64 samples */
  ADC_AVGCTRL_SAMPLENUM_128_Val    = $7;  //(ADC_AVGCTRL) 128 samples */
  ADC_AVGCTRL_SAMPLENUM_256_Val    = $8;  //(ADC_AVGCTRL) 256 samples */
  ADC_AVGCTRL_SAMPLENUM_512_Val    = $9;  //(ADC_AVGCTRL) 512 samples */
  ADC_AVGCTRL_SAMPLENUM_1024_Val   = $A;  //(ADC_AVGCTRL) 1024 samples */
  ADC_AVGCTRL_SAMPLENUM_1          = (ADC_AVGCTRL_SAMPLENUM_1_Val   shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_2          = (ADC_AVGCTRL_SAMPLENUM_2_Val   shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_4          = (ADC_AVGCTRL_SAMPLENUM_4_Val   shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_8          = (ADC_AVGCTRL_SAMPLENUM_8_Val   shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_16         = (ADC_AVGCTRL_SAMPLENUM_16_Val  shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_32         = (ADC_AVGCTRL_SAMPLENUM_32_Val  shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_64         = (ADC_AVGCTRL_SAMPLENUM_64_Val  shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_128        = (ADC_AVGCTRL_SAMPLENUM_128_Val shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_256        = (ADC_AVGCTRL_SAMPLENUM_256_Val shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_512        = (ADC_AVGCTRL_SAMPLENUM_512_Val shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_SAMPLENUM_1024       = (ADC_AVGCTRL_SAMPLENUM_1024_Val shl ADC_AVGCTRL_SAMPLENUM_Pos);
  ADC_AVGCTRL_ADJRES_Pos           = 4;            //(ADC_AVGCTRL) Adjusting Rest / Division Coefficient */
  ADC_AVGCTRL_ADJRES_Msk           = ($7 shl ADC_AVGCTRL_ADJRES_Pos);
  ADC_AVGCTRL_MASK                 = $7F;       //(ADC_AVGCTRL) MASK Register */

  ADC_INPUTCTRL_MUXPOS_Pos               = 0;            //(ADC_INPUTCTRL) Positive Mux Input Selection */
  ADC_INPUTCTRL_MUXPOS_Msk               = ($1F shl ADC_INPUTCTRL_MUXPOS_Pos);
  ADC_INPUTCTRL_MUXPOS_BANDGAP_Val       = $19;  //(ADC_INPUTCTRL) Bandgap Voltage */
  ADC_INPUTCTRL_MUXPOS_DAC_Val           = $1C;  //(ADC_INPUTCTRL) DAC Output */
  {$ifdef samd}
  ADC_INPUTCTRL_MUXPOS_TEMP_Val          = $18;  //(ADC_INPUTCTRL) Temperature Reference */
  ADC_INPUTCTRL_MUXPOS_SCALEDCOREVCC_Val = $1A;  //(ADC_INPUTCTRL) 1/4  Scaled Core Supply */
  ADC_INPUTCTRL_MUXPOS_SCALEDIOVCC_Val   = $1B;  //(ADC_INPUTCTRL) 1/4  Scaled I/O Supply */
  {$endif}

  ADC_INPUTCTRL_MUXNEG_Pos               = 8;            //(ADC_INPUTCTRL) Negative Mux Input Selection */
  ADC_INPUTCTRL_MUXNEG_Msk               = ($1F shl ADC_INPUTCTRL_MUXNEG_Pos);
  ADC_INPUTCTRL_MUXNEG_GND_Val           = $18;  //(ADC_INPUTCTRL) Internal Ground */
  {$ifdef samd}
  ADC_INPUTCTRL_MUXNEG_IOGND_Val         = $19;  //(ADC_INPUTCTRL) I/O Ground */
  {$endif}

  ADC_INPUTCTRL_INPUTSCAN_Pos            = 16;           //(ADC_INPUTCTRL) Number of Input Channels Included in Scan */
  ADC_INPUTCTRL_INPUTSCAN_Msk            = ($F shl ADC_INPUTCTRL_INPUTSCAN_Pos);
  ADC_INPUTCTRL_INPUTOFFSET_Pos          = 20;           //(ADC_INPUTCTRL) Positive Mux Setting Offset */
  ADC_INPUTCTRL_INPUTOFFSET_Msk          = ($F shl ADC_INPUTCTRL_INPUTOFFSET_Pos);
  ADC_INPUTCTRL_GAIN_Pos                 = 24;           //(ADC_INPUTCTRL) Gain Factor Selection */
  ADC_INPUTCTRL_GAIN_Msk                 = ($F shl ADC_INPUTCTRL_GAIN_Pos);
  ADC_INPUTCTRL_GAIN_1X_Val              = $0;  //(ADC_INPUTCTRL) 1x */
  ADC_INPUTCTRL_GAIN_2X_Val              = $1;  //(ADC_INPUTCTRL) 2x */
  ADC_INPUTCTRL_GAIN_4X_Val              = $2;  //(ADC_INPUTCTRL) 4x */
  ADC_INPUTCTRL_GAIN_8X_Val              = $3;  //(ADC_INPUTCTRL) 8x */
  ADC_INPUTCTRL_GAIN_16X_Val             = $4;  //(ADC_INPUTCTRL) 16x */
  ADC_INPUTCTRL_GAIN_DIV2_Val            = $F;  //(ADC_INPUTCTRL) 1/2x */
  ADC_INPUTCTRL_GAIN_1X                  = (ADC_INPUTCTRL_GAIN_1X_Val     shl ADC_INPUTCTRL_GAIN_Pos);
  ADC_INPUTCTRL_GAIN_2X                  = (ADC_INPUTCTRL_GAIN_2X_Val     shl ADC_INPUTCTRL_GAIN_Pos);
  ADC_INPUTCTRL_GAIN_4X                  = (ADC_INPUTCTRL_GAIN_4X_Val     shl ADC_INPUTCTRL_GAIN_Pos);
  ADC_INPUTCTRL_GAIN_8X                  = (ADC_INPUTCTRL_GAIN_8X_Val     shl ADC_INPUTCTRL_GAIN_Pos);
  ADC_INPUTCTRL_GAIN_16X                 = (ADC_INPUTCTRL_GAIN_16X_Val    shl ADC_INPUTCTRL_GAIN_Pos);
  ADC_INPUTCTRL_GAIN_DIV2                = (ADC_INPUTCTRL_GAIN_DIV2_Val   shl ADC_INPUTCTRL_GAIN_Pos);
  ADC_INPUTCTRL_MASK                     = $0FFF1F1F; //(ADC_INPUTCTRL) MASK Register */

  ADC_CALIB_LINEARITY_CAL_Pos            = 0;            //(ADC_CALIB) Linearity Calibration Value */
  ADC_CALIB_LINEARITY_CAL_Msk            = ($FF shl ADC_CALIB_LINEARITY_CAL_Pos);
  ADC_CALIB_BIAS_CAL_Pos                 = 8;            //(ADC_CALIB) Bias Calibration Value */
  ADC_CALIB_BIAS_CAL_Msk                 = ($7 shl ADC_CALIB_BIAS_CAL_Pos);
  ADC_CALIB_MASK                         = $07FF;     //(ADC_CALIB) MASK Register */

  ADC_SWTRIG_FLUSH_Pos                   = 0;            //(ADC_SWTRIG) ADC Conversion Flush */
  ADC_SWTRIG_FLUSH                       = ($1 shl ADC_SWTRIG_FLUSH_Pos);
  ADC_SWTRIG_START_Pos                   = 1;            //(ADC_SWTRIG) ADC Start Conversion */
  ADC_SWTRIG_START                       = ($1 shl ADC_SWTRIG_START_Pos);
  ADC_SWTRIG_MASK                        = $03;       //(ADC_SWTRIG) MASK Register */

  ADC_INTFLAG_RESRDY_Pos                 = 0;            //(ADC_INTFLAG) Result Ready */
  ADC_INTFLAG_RESRDY                     = ($1 shl ADC_INTFLAG_RESRDY_Pos);
  ADC_INTFLAG_OVERRUN_Pos                = 1;            //(ADC_INTFLAG) Overrun */
  ADC_INTFLAG_OVERRUN                    = ($1 shl ADC_INTFLAG_OVERRUN_Pos);
  ADC_INTFLAG_WINMON_Pos                 = 2;            //(ADC_INTFLAG) Window Monitor */
  ADC_INTFLAG_WINMON                     = ($1 shl ADC_INTFLAG_WINMON_Pos);
  ADC_INTFLAG_SYNCRDY_Pos                = 3;           //(ADC_INTFLAG) Synchronization Ready */
  ADC_INTFLAG_SYNCRDY                    = ($1 shl ADC_INTFLAG_SYNCRDY_Pos);
  ADC_INTFLAG_MASK                       = $0F;       //(ADC_INTFLAG) MASK Register */

