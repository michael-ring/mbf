//* ========== Instance parameters for TCC0 peripheral ========== */
const
  TCC_CC_NUM                = 4;        // Number of Compare/Capture units
  TCC_DITHERING             = 1;        // Dithering feature implemented
  TCC0_DMAC_ID_MC_0          = 8;
  TCC0_DMAC_ID_MC_1          = 9;
  TCC0_DMAC_ID_MC_2          = 10;
  TCC0_DMAC_ID_MC_3          = 11;
  TCC0_DMAC_ID_MC_LSB        = 8;
  TCC0_DMAC_ID_MC_MSB        = 11;
  TCC0_DMAC_ID_MC_SIZE       = 4;
  TCC0_DMAC_ID_OVF           = 7;        // DMA overflow/underflow/retrigger trigger
  TCC0_DTI                   = 1;        // Dead-Time-Insertion feature implemented
  TCC0_EXT                   = 31;       // (@_DITHERING*16+@_PG*8+@_SWAP*4+@_DTI*2+@_OTMX*1)
  TCC0_GCLK_ID               = 17;       // Index of Generic Clock
  TCC0_MASTER                = 0;
  TCC0_OTMX                  = 1;        // Output Matrix feature implemented
  TCC0_OW_NUM                = 8;        // Number of Output Waveforms
  TCC0_PG                    = 1;        // Pattern Generation feature implemented
  TCC0_SIZE                  = 24;
  TCC0_SWAP                  = 1;        // DTI outputs swap feature implemented
