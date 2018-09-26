//* ========== Instance parameters for NVMCTRL peripheral ========== */
const
  FLASH_BASE                 = longword($00000000);      // FLASH base address in the alias region
  NVMCTRL_CAL_BASE           = (FLASH_BASE+$00800000);   // NVMCTRL CAL Base Address

  NVMCTRL_AUX0_ADDRESS       = (NVMCTRL_CAL_BASE+$00004000);
  NVMCTRL_AUX1_ADDRESS       = (NVMCTRL_CAL_BASE+$00006000);
  NVMCTRL_AUX2_ADDRESS       = (NVMCTRL_CAL_BASE+$00008000);
  NVMCTRL_AUX3_ADDRESS       = (NVMCTRL_CAL_BASE+$0000A000);
  NVMCTRL_CLK_AHB_ID         = 4;        // Index of AHB Clock in PM.AHBMASK register
  NVMCTRL_FACTORY_WORD_IMPLEMENTED_MASK= $C0000007FFFFFFFF;
  NVMCTRL_FLASH_SIZE         = 16384;
  //{$define NVMCTRL_FUSES_SECURE_NVM}             // NVM Vault Address
  //{$define NVMCTRL_FUSES_SECURE_RAM}             // RAM Vault Address
  //{$define NVMCTRL_FUSES_SECURE_STATE}           // Vault State
  NVMCTRL_LOCKBIT_ADDRESS    = (NVMCTRL_CAL_BASE+$00002000);
  NVMCTRL_PAGES              = 256;
  NVMCTRL_PAGE_HW            = 32;
  NVMCTRL_PAGE_SIZE          = 64;
  NVMCTRL_PAGE_W             = 16;
  NVMCTRL_PMSB               = 3;
  NVMCTRL_PSZ_BITS           = 6;
  NVMCTRL_ROW_PAGES          = 4;
  NVMCTRL_ROW_SIZE           = 256;
  NVMCTRL_USER_PAGE_ADDRESS  = (NVMCTRL_CAL_BASE);
  NVMCTRL_USER_PAGE_OFFSET   = (NVMCTRL_CAL_BASE);
  NVMCTRL_USER_WORD_IMPLEMENTED_MASK = $C01FFFFFFFFFFFFF;

  NVMCTRL_CTRLB_OFFSET       = $04;       // (NVMCTRL_CTRLB offset) Control B */
  NVMCTRL_CTRLB_RESETVALUE   = $00000000; // (NVMCTRL_CTRLB reset_value) Control B */

  NVMCTRL_CTRLB_RWS_Pos                = 1;            // (NVMCTRL_CTRLB) NVM Read Wait States */
  NVMCTRL_CTRLB_RWS_Msk                = ($F shl NVMCTRL_CTRLB_RWS_Pos);
  NVMCTRL_CTRLB_RWS_SINGLE_Val         = $0;  // (NVMCTRL_CTRLB) Single Auto Wait State */
  NVMCTRL_CTRLB_RWS_HALF_Val           = $1;  // (NVMCTRL_CTRLB) Half Auto Wait State */
  NVMCTRL_CTRLB_RWS_DUAL_Val           = $2;  // (NVMCTRL_CTRLB) Dual Auto Wait State */
  NVMCTRL_CTRLB_RWS_SINGLE             = (NVMCTRL_CTRLB_RWS_SINGLE_Val  shl NVMCTRL_CTRLB_RWS_Pos);
  NVMCTRL_CTRLB_RWS_HALF               = (NVMCTRL_CTRLB_RWS_HALF_Val    shl NVMCTRL_CTRLB_RWS_Pos);
  NVMCTRL_CTRLB_RWS_DUAL               = (NVMCTRL_CTRLB_RWS_DUAL_Val    shl NVMCTRL_CTRLB_RWS_Pos);
  NVMCTRL_CTRLB_MANW_Pos               = 7;            // (NVMCTRL_CTRLB) Manual Write */
  NVMCTRL_CTRLB_MANW                   = ($1 shl NVMCTRL_CTRLB_MANW_Pos);
  NVMCTRL_CTRLB_SLEEPPRM_Pos           = 8;            // (NVMCTRL_CTRLB) Power Reduction Mode during Sleep */
  NVMCTRL_CTRLB_SLEEPPRM_Msk           = ($3 shl NVMCTRL_CTRLB_SLEEPPRM_Pos);
  NVMCTRL_CTRLB_SLEEPPRM_WAKEONACCESS_Val= $0;  // (NVMCTRL_CTRLB) NVM block enters low-power mode when entering sleep.NVM block exits low-power mode upon first access. */
  NVMCTRL_CTRLB_SLEEPPRM_WAKEUPINSTANT_Val= $1;  // (NVMCTRL_CTRLB) NVM block enters low-power mode when entering sleep.NVM block exits low-power mode when exiting sleep. */
  NVMCTRL_CTRLB_SLEEPPRM_DISABLED_Val  = $3;  // (NVMCTRL_CTRLB) Auto power reduction disabled. */
  NVMCTRL_CTRLB_SLEEPPRM_WAKEONACCESS  = (NVMCTRL_CTRLB_SLEEPPRM_WAKEONACCESS_Val shl NVMCTRL_CTRLB_SLEEPPRM_Pos);
  NVMCTRL_CTRLB_SLEEPPRM_WAKEUPINSTANT = (NVMCTRL_CTRLB_SLEEPPRM_WAKEUPINSTANT_Val shl NVMCTRL_CTRLB_SLEEPPRM_Pos);
  NVMCTRL_CTRLB_SLEEPPRM_DISABLED      = (NVMCTRL_CTRLB_SLEEPPRM_DISABLED_Val shl NVMCTRL_CTRLB_SLEEPPRM_Pos);
  NVMCTRL_CTRLB_READMODE_Pos           = 16;           // (NVMCTRL_CTRLB) NVMCTRL Read Mode */
  NVMCTRL_CTRLB_READMODE_Msk           = ($3 shl NVMCTRL_CTRLB_READMODE_Pos);
  NVMCTRL_CTRLB_READMODE_NO_MISS_PENALTY_Val = $0;  // (NVMCTRL_CTRLB) The NVM Controller (cache system) does not insert wait states on a cache miss. Gives the best system performance. */
  NVMCTRL_CTRLB_READMODE_LOW_POWER_Val = $1;  // (NVMCTRL_CTRLB) Reduces power consumption of the cache system, but inserts a wait state each time there is a cache miss. This mode may not be relevant if CPU performance is required, as the application will be stalled and may lead to increase run time. */
  NVMCTRL_CTRLB_READMODE_DETERMINISTIC_Val = $2;  // (NVMCTRL_CTRLB) The cache system ensures that a cache hit or miss takes the same amount of time, determined by the number of programmed flash wait states. This mode can be used for real-time applications that require deterministic execution timings. */
  NVMCTRL_CTRLB_READMODE_NO_MISS_PENALTY = (NVMCTRL_CTRLB_READMODE_NO_MISS_PENALTY_Val shl NVMCTRL_CTRLB_READMODE_Pos);
  NVMCTRL_CTRLB_READMODE_LOW_POWER     = (NVMCTRL_CTRLB_READMODE_LOW_POWER_Val shl NVMCTRL_CTRLB_READMODE_Pos);
  NVMCTRL_CTRLB_READMODE_DETERMINISTIC = (NVMCTRL_CTRLB_READMODE_DETERMINISTIC_Val shl NVMCTRL_CTRLB_READMODE_Pos);
  NVMCTRL_CTRLB_CACHEDIS_Pos           = 18;           // (NVMCTRL_CTRLB) Cache Disable */
  NVMCTRL_CTRLB_CACHEDIS               = ($1 shl NVMCTRL_CTRLB_CACHEDIS_Pos);
  NVMCTRL_CTRLB_MASK                   = $0007039E; // (NVMCTRL_CTRLB) MASK Register */

  NVMCTRL_CAL                          = (NVMCTRL_CAL_BASE+$0000); //(NVMCTRL) CAL Base Address */
  NVMCTRL_LOCKBIT                      = (NVMCTRL_CAL_BASE+$2000); //(NVMCTRL) LOCKBIT Base Address */
  NVMCTRL_OTP1                         = (NVMCTRL_CAL_BASE+$6000); //(NVMCTRL) OTP1 Base Address */
  NVMCTRL_OTP2                         = (NVMCTRL_CAL_BASE+$6008); //(NVMCTRL) OTP2 Base Address */
  NVMCTRL_OTP4                         = (NVMCTRL_CAL_BASE+$6020); //(NVMCTRL) OTP4 Base Address */
  NVMCTRL_TEMP_LOG                     = (NVMCTRL_CAL_BASE+$6030); //(NVMCTRL) TEMP_LOG Base Address */
  NVMCTRL_USER                         = (NVMCTRL_CAL_BASE+$4000); //(NVMCTRL) USER Base Address */

  NVM_ADC_LINEARITY_POS       = 27;
  NVM_ADC_LINEARITY_SIZE      = 8;

  NVM_ADC_BIASCAL_POS         = 35;
  NVM_ADC_BIASCAL_SIZE        = 3;

  NVM_OSC32K_CAL_POS          = 38;
  NVM_OSC32K_CAL_SIZE         = 7;

  NVM_USB_TRANSN_POS          = 45;
  NVM_USB_TRANSN_SIZE         = 5;

  NVM_USB_TRANSP_POS          = 50;
  NVM_USB_TRANSP_SIZE         = 5;

  NVM_USB_TRIM_POS            = 55;
  NVM_USB_TRIM_SIZE           = 3;

  NVM_DFLL48M_COARSE_CAL_POS  = 58;
  NVM_DFLL48M_COARSE_CAL_SIZE = 6;

  NVM_DFLL48M_FINE_CAL_POS    = 64;
  NVM_DFLL48M_FINE_CAL_SIZE   = 10;


  SERIAL0                     = NVMCTRL_AUX3_ADDRESS+$0C;
  SERIAL1                     = NVMCTRL_AUX3_ADDRESS+$40;
  SERIAL2                     = NVMCTRL_AUX3_ADDRESS+$44;
  SERIAL3                     = NVMCTRL_AUX3_ADDRESS+$48;
