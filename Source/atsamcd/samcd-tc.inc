//* ========== Instance parameters for TC1 peripheral ========== */
const
  TC1_DMAC_ID_MC_0           = 13;
  TC1_DMAC_ID_MC_1           = 14;
  TC1_DMAC_ID_MC_LSB         = 13;
  TC1_DMAC_ID_MC_MSB         = 14;
  TC1_DMAC_ID_MC_SIZE        = 2;
  TC1_DMAC_ID_OVF            = 12;       // Indexes of DMA Overflow trigger
  TC1_GCLK_ID                = 18;       // Index of Generic Clock
  TC1_MASTER                 = 1;

  //* ========== Instance parameters for TC2 peripheral ========== */
  TC2_DMAC_ID_MC_0           = 16;
  TC2_DMAC_ID_MC_1           = 17;
  TC2_DMAC_ID_MC_LSB         = 16;
  TC2_DMAC_ID_MC_MSB         = 17;
  TC2_DMAC_ID_MC_SIZE        = 2;
  TC2_DMAC_ID_OVF            = 15;       // Indexes of DMA Overflow trigger
  TC2_GCLK_ID                = 18;       // Index of Generic Clock
  TC2_MASTER                 = 0;

  TC_CTRLA_OFFSET            = $00;         // (TC_CTRLA offset) Control A */
  TC_CTRLA_RESETVALUE        = $0000;     // (TC_CTRLA reset_value) Control A */

  TC_CTRLA_SWRST_Pos         = 0;            // (TC_CTRLA) Software Reset */
  TC_CTRLA_SWRST             = ($1 shl TC_CTRLA_SWRST_Pos);
  TC_CTRLA_ENABLE_Pos        = 1;            // (TC_CTRLA) Enable */
  TC_CTRLA_ENABLE            = ($1 shl TC_CTRLA_ENABLE_Pos);
  TC_CTRLA_MODE_Pos          = 2;            // (TC_CTRLA) TC Mode */
  TC_CTRLA_MODE_Msk          = ($3 shl TC_CTRLA_MODE_Pos);
  TC_CTRLA_MODE_COUNT16_Val  = $0;  // (TC_CTRLA) Counter in 16-bit mode */
  TC_CTRLA_MODE_COUNT8_Val   = $1;  // (TC_CTRLA) Counter in 8-bit mode */
  TC_CTRLA_MODE_COUNT32_Val  = $2;  // (TC_CTRLA) Counter in 32-bit mode */
  TC_CTRLA_MODE_COUNT16      = (TC_CTRLA_MODE_COUNT16_Val     shl TC_CTRLA_MODE_Pos);
  TC_CTRLA_MODE_COUNT8       = (TC_CTRLA_MODE_COUNT8_Val      shl TC_CTRLA_MODE_Pos);
  TC_CTRLA_MODE_COUNT32      = (TC_CTRLA_MODE_COUNT32_Val     shl TC_CTRLA_MODE_Pos);
  TC_CTRLA_WAVEGEN_Pos       = 5;            // (TC_CTRLA) Waveform Generation Operation */
  TC_CTRLA_WAVEGEN_Msk       = ($3 shl TC_CTRLA_WAVEGEN_Pos);
  TC_CTRLA_WAVEGEN_NFRQ_Val  = $0;  // (TC_CTRLA)  */
  TC_CTRLA_WAVEGEN_MFRQ_Val  = $1;  // (TC_CTRLA)  */
  TC_CTRLA_WAVEGEN_NPWM_Val  = $2;  // (TC_CTRLA)  */
  TC_CTRLA_WAVEGEN_MPWM_Val  = $3;  // (TC_CTRLA)  */
  TC_CTRLA_WAVEGEN_NFRQ      = (TC_CTRLA_WAVEGEN_NFRQ_Val     shl TC_CTRLA_WAVEGEN_Pos);
  TC_CTRLA_WAVEGEN_MFRQ      = (TC_CTRLA_WAVEGEN_MFRQ_Val     shl TC_CTRLA_WAVEGEN_Pos);
  TC_CTRLA_WAVEGEN_NPWM      = (TC_CTRLA_WAVEGEN_NPWM_Val     shl TC_CTRLA_WAVEGEN_Pos);
  TC_CTRLA_WAVEGEN_MPWM      = (TC_CTRLA_WAVEGEN_MPWM_Val     shl TC_CTRLA_WAVEGEN_Pos);
  TC_CTRLA_PRESCALER_Pos     = 8;            // (TC_CTRLA) Prescaler */
  TC_CTRLA_PRESCALER_Msk     = ($7 shl TC_CTRLA_PRESCALER_Pos);
  TC_CTRLA_PRESCALER_DIV1_Val    = $00;  // (TC_CTRLA) Prescaler: GCLK_TC */
  TC_CTRLA_PRESCALER_DIV2_Val    = $01;  // (TC_CTRLA) Prescaler: GCLK_TC/2 */
  TC_CTRLA_PRESCALER_DIV4_Val    = $02;  // (TC_CTRLA) Prescaler: GCLK_TC/4 */
  TC_CTRLA_PRESCALER_DIV8_Val    = $03;  // (TC_CTRLA) Prescaler: GCLK_TC/8 */
  TC_CTRLA_PRESCALER_DIV16_Val   =$04;  // (TC_CTRLA) Prescaler: GCLK_TC/16 */
  TC_CTRLA_PRESCALER_DIV64_Val   =$05;  // (TC_CTRLA) Prescaler: GCLK_TC/64 */
  TC_CTRLA_PRESCALER_DIV256_Val  =$06;  // (TC_CTRLA) Prescaler: GCLK_TC/256 */
  TC_CTRLA_PRESCALER_DIV1024_Val =$07;  // (TC_CTRLA) Prescaler: GCLK_TC/1024 */
  TC_CTRLA_PRESCALER_DIV1    = (TC_CTRLA_PRESCALER_DIV1_Val   shl TC_CTRLA_PRESCALER_Pos);
  TC_CTRLA_PRESCALER_DIV2    = (TC_CTRLA_PRESCALER_DIV2_Val   shl TC_CTRLA_PRESCALER_Pos);
  TC_CTRLA_PRESCALER_DIV4    = (TC_CTRLA_PRESCALER_DIV4_Val   shl TC_CTRLA_PRESCALER_Pos);
  TC_CTRLA_PRESCALER_DIV8    = (TC_CTRLA_PRESCALER_DIV8_Val   shl TC_CTRLA_PRESCALER_Pos);
  TC_CTRLA_PRESCALER_DIV16   = (TC_CTRLA_PRESCALER_DIV16_Val  shl TC_CTRLA_PRESCALER_Pos);
  TC_CTRLA_PRESCALER_DIV64   = (TC_CTRLA_PRESCALER_DIV64_Val  shl TC_CTRLA_PRESCALER_Pos);
  TC_CTRLA_PRESCALER_DIV256  = (TC_CTRLA_PRESCALER_DIV256_Val shl TC_CTRLA_PRESCALER_Pos);
  TC_CTRLA_PRESCALER_DIV1024 = (TC_CTRLA_PRESCALER_DIV1024_Val shl TC_CTRLA_PRESCALER_Pos);
  TC_CTRLA_RUNSTDBY_Pos      = 11;           // (TC_CTRLA) Run in Standby */
  TC_CTRLA_RUNSTDBY          = ($1 shl TC_CTRLA_RUNSTDBY_Pos);
  TC_CTRLA_PRESCSYNC_Pos     = 12;           // (TC_CTRLA) Prescaler and Counter Synchronization */
  TC_CTRLA_PRESCSYNC_Msk     = ($3 shl TC_CTRLA_PRESCSYNC_Pos);
  TC_CTRLA_PRESCSYNC_GCLK_Val   = $0;  // (TC_CTRLA) Reload or reset the counter on next generic clock */
  TC_CTRLA_PRESCSYNC_PRESC_Val  = $1;  // (TC_CTRLA) Reload or reset the counter on next prescaler clock */
  TC_CTRLA_PRESCSYNC_RESYNC_Val = $2;  // (TC_CTRLA) Reload or reset the counter on next generic clock. Reset the prescaler counter */
  TC_CTRLA_PRESCSYNC_GCLK    = (TC_CTRLA_PRESCSYNC_GCLK_Val   shl TC_CTRLA_PRESCSYNC_Pos);
  TC_CTRLA_PRESCSYNC_PRESC   = (TC_CTRLA_PRESCSYNC_PRESC_Val  shl TC_CTRLA_PRESCSYNC_Pos);
  TC_CTRLA_PRESCSYNC_RESYNC  = (TC_CTRLA_PRESCSYNC_RESYNC_Val shl TC_CTRLA_PRESCSYNC_Pos);
  TC_CTRLA_MASK              = $3F6F;     // (TC_CTRLA) MASK Register */

  TC_INTENSET_OFFSET         = $0D;          // (TC_INTENSET offset) Interrupt Enable Set */
  TC_INTENSET_RESETVALUE     = $00;          // (TC_INTENSET reset_value) Interrupt Enable Set */

  TC_INTENSET_OVF_Pos        = 0;            // (TC_INTENSET) Overflow Interrupt Enable */
  TC_INTENSET_OVF            = (1 shl TC_INTENSET_OVF_Pos);
  TC_INTENSET_ERR_Pos        = 1;            // (TC_INTENSET) Error Interrupt Enable */
  TC_INTENSET_ERR            = (1 shl TC_INTENSET_ERR_Pos);
  TC_INTENSET_SYNCRDY_Pos    = 3;            // (TC_INTENSET) Synchronization Ready Interrupt Enable */
  TC_INTENSET_SYNCRDY        = (1 shl TC_INTENSET_SYNCRDY_Pos);
  TC_INTENSET_MC0_Pos        = 4;            // (TC_INTENSET) Match or Capture Channel 0 Interrupt Enable */
  TC_INTENSET_MC0            = (1 shl TC_INTENSET_MC0_Pos);
  TC_INTENSET_MC1_Pos        = 5;            // (TC_INTENSET) Match or Capture Channel 1 Interrupt Enable */
  TC_INTENSET_MC1            = (1 shl TC_INTENSET_MC1_Pos);
  TC_INTENSET_MC_Pos         = 4;            // (TC_INTENSET) Match or Capture Channel x Interrupt Enable */
  TC_INTENSET_MC_Msk         = ($3 shl TC_INTENSET_MC_Pos);
  TC_INTENSET_MASK           = $3B;       // (TC_INTENSET) MASK Register */

  TC_INTFLAG_OFFSET          = $0E;         // (TC_INTFLAG offset) Interrupt Flag Status and Clear */
  TC_INTFLAG_RESETVALUE      = $00;       // (TC_INTFLAG reset_value) Interrupt Flag Status and Clear */

  TC_INTFLAG_OVF_Pos         = 0;            // (TC_INTFLAG) Overflow */
  TC_INTFLAG_OVF             = (1 shl TC_INTFLAG_OVF_Pos);
  TC_INTFLAG_ERR_Pos         = 1;            // (TC_INTFLAG) Error */
  TC_INTFLAG_ERR             = (1 shl TC_INTFLAG_ERR_Pos);
  TC_INTFLAG_SYNCRDY_Pos     = 3;            // (TC_INTFLAG) Synchronization Ready */
  TC_INTFLAG_SYNCRDY         = (1 shl TC_INTFLAG_SYNCRDY_Pos);
  TC_INTFLAG_MC0_Pos         = 4;            // (TC_INTFLAG) Match or Capture Channel 0 */
  TC_INTFLAG_MC0             = (1 shl TC_INTFLAG_MC0_Pos);
  TC_INTFLAG_MC1_Pos         = 5;            // (TC_INTFLAG) Match or Capture Channel 1 */
  TC_INTFLAG_MC1             = (1 shl TC_INTFLAG_MC1_Pos);
  TC_INTFLAG_MC_Pos          = 4;            // (TC_INTFLAG) Match or Capture Channel x */
  TC_INTFLAG_MC_Msk          = ($3 shl TC_INTFLAG_MC_Pos);
  TC_INTFLAG_MASK            = $3B;       // (TC_INTFLAG) MASK Register */

