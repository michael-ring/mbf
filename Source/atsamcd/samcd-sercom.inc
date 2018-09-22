//* ========== Instance parameters for SERCOM0 peripheral ========== */
const
  SERCOM0_DMAC_ID_RX        = 1;        // Index of DMA RX trigger
  SERCOM0_DMAC_ID_TX        = 2;        // Index of DMA TX trigger

  {$ifdef samd10}
  SERCOM0_GCLK_ID_SLOW      = $0D;       // Index of Generic Clock for SMbus Timeout
  SERCOM0_GCLK_ID_CORE      = $0E;       // Index of Generic Clock for Core
  SERCOM1_GCLK_ID_CORE      = $0F;       // Index of Generic Clock for Core
  SERCOM2_GCLK_ID_CORE      = $10;       // Index of Generic Clock for Core
  {$endif}
  {$ifdef samd21}
  SERCOM_GCLK_ID_SLOW       = $13;      // Index of Generic Clock for Slow
  SERCOM0_GCLK_ID_CORE      = $14;      // Index of Generic Clock for Core
  SERCOM1_GCLK_ID_CORE      = $15;      // Index of Generic Clock for Core
  SERCOM2_GCLK_ID_CORE      = $16;      // Index of Generic Clock for Core
  SERCOM3_GCLK_ID_CORE      = $17;      // Index of Generic Clock for Core
  SERCOM4_GCLK_ID_CORE      = $18;      // Index of Generic Clock for Core
  SERCOM5_GCLK_ID_CORE      = $19;      // Index of Generic Clock for Core
  {$endif}
  {$ifdef samc21}
  SERCOM0_GCLK_ID_SLOW      = 18;      // Index of Generic Clock for Slow
  SERCOM0_GCLK_ID_CORE      = 19;      // Index of Generic Clock for Core
  SERCOM1_GCLK_ID_SLOW      = 18;      // Index of Generic Clock for Slow
  SERCOM1_GCLK_ID_CORE      = 20;      // Index of Generic Clock for Core
  SERCOM2_GCLK_ID_SLOW      = 18;      // Index of Generic Clock for Slow
  SERCOM2_GCLK_ID_CORE      = 21;      // Index of Generic Clock for Core
  SERCOM3_GCLK_ID_SLOW      = 18;      // Index of Generic Clock for Slow
  SERCOM3_GCLK_ID_CORE      = 22;      // Index of Generic Clock for Core
  SERCOM4_GCLK_ID_SLOW      = 18;      // Index of Generic Clock for Slow
  SERCOM4_GCLK_ID_CORE      = 23;      // Index of Generic Clock for Core
  SERCOM5_GCLK_ID_SLOW      = 24;      // Index of Generic Clock for Slow
  SERCOM5_GCLK_ID_CORE      = 25;      // Index of Generic Clock for Core
  {$endif}

  SERCOM0_INT_MSB           = 6;

  SERCOM1_DMAC_ID_RX        = 3;        // Index of DMA RX trigger
  SERCOM1_DMAC_ID_TX        = 4;        // Index of DMA TX trigger
  SERCOM1_INT_MSB           = 6;

  SERCOM2_DMAC_ID_RX        = 5;        // Index of DMA RX trigger
  SERCOM2_DMAC_ID_TX        = 6;        // Index of DMA TX trigger
  SERCOM2_INT_MSB           = 6;

  SERCOM_SWRST_Pos              = 0;       // (ADC_CTRLA) Software Reset */
  SERCOM_SWRST                  = ($1 shl SERCOM_SWRST_Pos);
  SERCOM_ENABLE_Pos             = 1;       // (ADC_CTRLA) Enable */
  SERCOM_ENABLE                 = ($1 shl SERCOM_ENABLE_Pos);
  SERCOM_MODE_Pos               = 2;            // (SERCOM_I2CM_CTRLA) Operating Mode */
  SERCOM_MODE_Msk               = ($7 shl SERCOM_MODE_Pos);
  SERCOM_MODE_USART_EXT_CLK_Val = $0;  // (SERCOM_I2CM_CTRLA) USART mode with external clock */
  SERCOM_MODE_USART_INT_CLK_Val = $1;  // (SERCOM_I2CM_CTRLA) USART mode with internal clock */
  SERCOM_MODE_SPI_SLAVE_Val     = $2;  // (SERCOM_I2CM_CTRLA) SPI mode with external clock */
  SERCOM_MODE_SPI_MASTER_Val    = $3;  // (SERCOM_I2CM_CTRLA) SPI mode with internal clock */
  SERCOM_MODE_I2C_SLAVE_Val     = $4;  // (SERCOM_I2CM_CTRLA) I2C mode with external clock */
  SERCOM_MODE_I2C_MASTER_Val    = $5;  // (SERCOM_I2CM_CTRLA) I2C mode with internal clock */
  SERCOM_MODE_USART_EXT_CLK     = (SERCOM_MODE_USART_EXT_CLK_Val shl SERCOM_MODE_Pos);
  SERCOM_MODE_USART_INT_CLK     = (SERCOM_MODE_USART_INT_CLK_Val shl SERCOM_MODE_Pos);
  SERCOM_MODE_SPI_SLAVE         = (SERCOM_MODE_SPI_SLAVE_Val shl SERCOM_MODE_Pos);
  SERCOM_MODE_SPI_MASTER        = (SERCOM_MODE_SPI_MASTER_Val shl SERCOM_MODE_Pos);
  SERCOM_MODE_I2C_SLAVE         = (SERCOM_MODE_I2C_SLAVE_Val shl SERCOM_MODE_Pos);
  SERCOM_MODE_I2C_MASTER        = (SERCOM_MODE_I2C_MASTER_Val shl SERCOM_MODE_Pos);
  SERCOM_RUNSTDBY_Pos           = 7;       // (ADC_CTRLA) Run in Standby */
  SERCOM_RUNSTDBY               = ($1 shl SERCOM_RUNSTDBY_Pos);

  SERCOM_I2CM_CTRLA_PINOUT_Pos             = 16;           // (SERCOM_I2CM_CTRLA) Pin Usage */
  SERCOM_I2CM_CTRLA_PINOUT                 = ($1 shl SERCOM_I2CM_CTRLA_PINOUT_Pos);
  SERCOM_I2CM_CTRLA_SDAHOLD_Pos            = 20;           // (SERCOM_I2CM_CTRLA) SDA Hold Time */
  SERCOM_I2CM_CTRLA_SDAHOLD_Msk            = ($3 shl SERCOM_I2CM_CTRLA_SDAHOLD_Pos);

  SERCOM_I2CM_CTRLB_SMEN_Pos = 8;            // (SERCOM_I2CM_CTRLB) Smart Mode Enable */
  SERCOM_I2CM_CTRLB_SMEN     = ($1 shl SERCOM_I2CM_CTRLB_SMEN_Pos);
  SERCOM_I2CM_CTRLB_QCEN_Pos = 9;            // (SERCOM_I2CM_CTRLB) Quick Command Enable */
  SERCOM_I2CM_CTRLB_QCEN     = ($1 shl SERCOM_I2CM_CTRLB_QCEN_Pos);
  SERCOM_I2CM_CTRLB_CMD_Pos  = 16;           // (SERCOM_I2CM_CTRLB) Command */
  SERCOM_I2CM_CTRLB_CMD_Msk  = ($3 shl SERCOM_I2CM_CTRLB_CMD_Pos);
  SERCOM_I2CM_CTRLB_ACKACT_Pos= 18;           // (SERCOM_I2CM_CTRLB) Acknowledge Action */
  SERCOM_I2CM_CTRLB_ACKACT    =($1 shl SERCOM_I2CM_CTRLB_ACKACT_Pos);

  SERCOM_I2CS_CTRLB_SMEN_Pos = 8;            // (SERCOM_I2CS_CTRLB) Smart Mode Enable */
  SERCOM_I2CS_CTRLB_SMEN     = ($1 shl SERCOM_I2CS_CTRLB_SMEN_Pos);
  SERCOM_I2CS_CTRLB_GCMD_Pos = 9;            // (SERCOM_I2CS_CTRLB) PMBus Group Command */
  SERCOM_I2CS_CTRLB_GCMD     = ($1 shl SERCOM_I2CS_CTRLB_GCMD_Pos);
  SERCOM_I2CS_CTRLB_AACKEN_Pos= 10;           // (SERCOM_I2CS_CTRLB) Automatic Address Acknowledge */
  SERCOM_I2CS_CTRLB_AACKEN   = ($1 shl SERCOM_I2CS_CTRLB_AACKEN_Pos);
  SERCOM_I2CS_CTRLB_AMODE_Pos= 14;           // (SERCOM_I2CS_CTRLB) Address Mode */
  SERCOM_I2CS_CTRLB_AMODE_Msk= ($3 shl SERCOM_I2CS_CTRLB_AMODE_Pos);
  SERCOM_I2CS_CTRLB_CMD_Pos  = 16;           // (SERCOM_I2CS_CTRLB) Command */
  SERCOM_I2CS_CTRLB_CMD_Msk  = ($3 shl SERCOM_I2CS_CTRLB_CMD_Pos);
  SERCOM_I2CS_CTRLB_ACKACT_Pos= 18;           // (SERCOM_I2CS_CTRLB) Acknowledge Action */
  SERCOM_I2CS_CTRLB_ACKACT   = ($1 shl SERCOM_I2CS_CTRLB_ACKACT_Pos);

  SERCOM_I2CM_STATUS_BUSERR_Pos   = 0;            //(SERCOM_I2CM_STATUS) Bus Error */
  SERCOM_I2CM_STATUS_BUSERR       = ($1 shl SERCOM_I2CM_STATUS_BUSERR_Pos);
  SERCOM_I2CM_STATUS_ARBLOST_Pos  = 1;            //(SERCOM_I2CM_STATUS) Arbitration Lost */
  SERCOM_I2CM_STATUS_ARBLOST      = ($1 shl SERCOM_I2CM_STATUS_ARBLOST_Pos);
  SERCOM_I2CM_STATUS_RXNACK_Pos   = 2;            //(SERCOM_I2CM_STATUS) Received Not Acknowledge */
  SERCOM_I2CM_STATUS_RXNACK       = ($1 shl SERCOM_I2CM_STATUS_RXNACK_Pos);
  SERCOM_I2CM_STATUS_BUSSTATE_Pos = 4;            //(SERCOM_I2CM_STATUS) Bus State */
  SERCOM_I2CM_STATUS_BUSSTATE_Msk = ($3 shl SERCOM_I2CM_STATUS_BUSSTATE_Pos);
  SERCOM_I2CM_STATUS_LOWTOUT_Pos  = 6;            //(SERCOM_I2CM_STATUS) SCL Low Timeout */
  SERCOM_I2CM_STATUS_LOWTOUT      = ($1 shl SERCOM_I2CM_STATUS_LOWTOUT_Pos);
  SERCOM_I2CM_STATUS_CLKHOLD_Pos  = 7;            //(SERCOM_I2CM_STATUS) Clock Hold */
  SERCOM_I2CM_STATUS_CLKHOLD      = ($1 shl SERCOM_I2CM_STATUS_CLKHOLD_Pos);
  SERCOM_I2CM_STATUS_MEXTTOUT_Pos = 8;            //(SERCOM_I2CM_STATUS) Master SCL Low Extend Timeout */
  SERCOM_I2CM_STATUS_MEXTTOUT     = ($1 shl SERCOM_I2CM_STATUS_MEXTTOUT_Pos);
  SERCOM_I2CM_STATUS_SEXTTOUT_Pos = 9;            //(SERCOM_I2CM_STATUS) Slave SCL Low Extend Timeout */
  SERCOM_I2CM_STATUS_SEXTTOUT     = ($1 shl SERCOM_I2CM_STATUS_SEXTTOUT_Pos);
  SERCOM_I2CM_STATUS_LENERR_Pos   = 10;           //(SERCOM_I2CM_STATUS) Length Error */
  SERCOM_I2CM_STATUS_LENERR       = ($1 shl SERCOM_I2CM_STATUS_LENERR_Pos);

  SERCOM_I2CM_INTFLAG_MB_Pos      = 0;            //(SERCOM_I2CM_INTFLAG) Master On Bus Interrupt */
  SERCOM_I2CM_INTFLAG_MB          = ($1 shl SERCOM_I2CM_INTFLAG_MB_Pos);
  SERCOM_I2CM_INTFLAG_SB_Pos      = 1;            //(SERCOM_I2CM_INTFLAG) Slave On Bus Interrupt */
  SERCOM_I2CM_INTFLAG_SB          = ($1 shl SERCOM_I2CM_INTFLAG_SB_Pos);
  SERCOM_I2CM_INTFLAG_ERROR_Pos   = 7;            //(SERCOM_I2CM_INTFLAG) Combined Error Interrupt */
  SERCOM_I2CM_INTFLAG_ERROR       = ($1 shl SERCOM_I2CM_INTFLAG_ERROR_Pos);

  SERCOM_I2CS_INTFLAG_PREC_Pos      = 0;
  SERCOM_I2CS_INTFLAG_PREC          = ($1 shl SERCOM_I2CS_INTFLAG_PREC_Pos);
  SERCOM_I2CS_INTFLAG_AMATCH_Pos    = 1;
  SERCOM_I2CS_INTFLAG_AMATCH        = ($1 shl SERCOM_I2CS_INTFLAG_AMATCH_Pos);
  SERCOM_I2CS_INTFLAG_DRDY_Pos      = 2;
  SERCOM_I2CS_INTFLAG_DRDY          = ($1 shl SERCOM_I2CS_INTFLAG_DRDY_Pos);

  SERCOM_I2CS_STATUS_DIR_Pos        = 3;
  SERCOM_I2CS_STATUS_DIR            = ($1 shl SERCOM_I2CS_STATUS_DIR_Pos);
  SERCOM_I2CS_STATUS_SR_Pos         = 4;
  SERCOM_I2CS_STATUS_SR             = ($1 shl SERCOM_I2CS_STATUS_SR_Pos);


  SERCOM_SPI_CTRLA_IBON_Pos  = 8;            // (SERCOM_SPI_CTRLA) Immediate Buffer Overflow Notification */
  SERCOM_SPI_CTRLA_IBON      = (1 shl SERCOM_SPI_CTRLA_IBON_Pos);
  SERCOM_SPI_CTRLA_DOPO_Pos  = 16;           // (SERCOM_SPI_CTRLA) Data Out Pinout */
  SERCOM_SPI_CTRLA_DOPO_Msk  = (3 shl SERCOM_SPI_CTRLA_DOPO_Pos);
  //SERCOM_SPI_CTRLA_DOPO(value)= (SERCOM_SPI_CTRLA_DOPO_Msk & ((value) shl SERCOM_SPI_CTRLA_DOPO_Pos))
  SERCOM_SPI_CTRLA_DIPO_Pos  = 20;           // (SERCOM_SPI_CTRLA) Data In Pinout */
  SERCOM_SPI_CTRLA_DIPO_Msk  = (3 shl SERCOM_SPI_CTRLA_DIPO_Pos);
  //SERCOM_SPI_CTRLA_DIPO(value) (SERCOM_SPI_CTRLA_DIPO_Msk & ((value) shl SERCOM_SPI_CTRLA_DIPO_Pos))
  SERCOM_SPI_CTRLA_FORM_Pos  = 24;           // (SERCOM_SPI_CTRLA) Frame Format */
  SERCOM_SPI_CTRLA_FORM_Msk  = ($F shl SERCOM_SPI_CTRLA_FORM_Pos);
  //SERCOM_SPI_CTRLA_FORM(value) (SERCOM_SPI_CTRLA_FORM_Msk & ((value) shl SERCOM_SPI_CTRLA_FORM_Pos))
  SERCOM_SPI_CTRLA_CPHA_Pos  = 28;           // (SERCOM_SPI_CTRLA) Clock Phase */
  SERCOM_SPI_CTRLA_CPHA      = (1 shl SERCOM_SPI_CTRLA_CPHA_Pos);
  SERCOM_SPI_CTRLA_CPOL_Pos  = 29;           // (SERCOM_SPI_CTRLA) Clock Polarity */
  SERCOM_SPI_CTRLA_CPOL      = (1 shl SERCOM_SPI_CTRLA_CPOL_Pos);
  SERCOM_SPI_CTRLA_DORD_Pos  = 30;           // (SERCOM_SPI_CTRLA) Data Order */
  SERCOM_SPI_CTRLA_DORD      = (1 shl SERCOM_SPI_CTRLA_DORD_Pos);


  SERCOM_SPI_CTRLB_CHSIZE_Pos= 0;           // (SERCOM_SPI_CTRLB) Character Size */
  SERCOM_SPI_CTRLB_CHSIZE_Msk= ($7 shl SERCOM_SPI_CTRLB_CHSIZE_Pos);
  SERCOM_SPI_CTRLB_PLOADEN_Pos= 6;            // (SERCOM_SPI_CTRLB) Data Preload Enable */
  SERCOM_SPI_CTRLB_PLOADEN   = ($1 shl SERCOM_SPI_CTRLB_PLOADEN_Pos);
  SERCOM_SPI_CTRLB_SSDE_Pos  = 9;            // (SERCOM_SPI_CTRLB) Slave Select Low Detect Enable */
  SERCOM_SPI_CTRLB_SSDE      = ($1 shl SERCOM_SPI_CTRLB_SSDE_Pos);
  SERCOM_SPI_CTRLB_MSSEN_Pos = 13;           // (SERCOM_SPI_CTRLB) Master Slave Select Enable */
  SERCOM_SPI_CTRLB_MSSEN     = ($1 shl SERCOM_SPI_CTRLB_MSSEN_Pos);
  SERCOM_SPI_CTRLB_AMODE_Pos = 14;           // (SERCOM_SPI_CTRLB) Address Mode */
  SERCOM_SPI_CTRLB_AMODE_Msk = ($3 shl SERCOM_SPI_CTRLB_AMODE_Pos);
  SERCOM_SPI_CTRLB_RXEN_Pos  = 17;           // (SERCOM_SPI_CTRLB) Receiver Enable */
  SERCOM_SPI_CTRLB_RXEN      = ($1 shl SERCOM_SPI_CTRLB_RXEN_Pos);

  SERCOM_SPI_INTFLAG_DRE_Pos      = 0;
  SERCOM_SPI_INTFLAG_DRE          = ($1 shl SERCOM_SPI_INTFLAG_DRE_Pos);
  SERCOM_SPI_INTFLAG_TXC_Pos      = 1;
  SERCOM_SPI_INTFLAG_TXC          = ($1 shl SERCOM_SPI_INTFLAG_TXC_Pos);
  SERCOM_SPI_INTFLAG_RXC_Pos      = 2;
  SERCOM_SPI_INTFLAG_RXC          = ($1 shl SERCOM_SPI_INTFLAG_RXC_Pos);
  SERCOM_SPI_INTFLAG_SSL_Pos      = 2;
  SERCOM_SPI_INTFLAG_SSL          = ($1 shl SERCOM_SPI_INTFLAG_SSL_Pos);
  SERCOM_SPI_INTFLAG_ERROR_Pos    = 7;
  SERCOM_SPI_INTFLAG_ERROR        = ($1 shl SERCOM_SPI_INTFLAG_ERROR_Pos);


  SERCOM_USART_CTRLA_IBON_Pos     = 8;            // (SERCOM_USART_CTRLA) Immediate Buffer Overflow Notification */
  SERCOM_USART_CTRLA_IBON         = (($1) shl SERCOM_USART_CTRLA_IBON_Pos);
  SERCOM_USART_CTRLA_SAMPR_Pos    = 13;           // (SERCOM_USART_CTRLA) Sample */
  SERCOM_USART_CTRLA_SAMPR_Msk    = (($7) shl SERCOM_USART_CTRLA_SAMPR_Pos);
  //SERCOM_USART_CTRLA_SAMPR(value) = (SERCOM_USART_CTRLA_SAMPR_Msk & ((value) shl SERCOM_USART_CTRLA_SAMPR_Pos))
  SERCOM_USART_CTRLA_TXPO_Pos     = 16;           // (SERCOM_USART_CTRLA) Transmit Data Pinout */
  SERCOM_USART_CTRLA_TXPO_Msk     = (($3) shl SERCOM_USART_CTRLA_TXPO_Pos);
  //SERCOM_USART_CTRLA_TXPO(value) (SERCOM_USART_CTRLA_TXPO_Msk & ((value) shl SERCOM_USART_CTRLA_TXPO_Pos))
  SERCOM_USART_CTRLA_RXPO_Pos    = 20;           // (SERCOM_USART_CTRLA) Receive Data Pinout */
  SERCOM_USART_CTRLA_RXPO_Msk    = (($3) shl SERCOM_USART_CTRLA_RXPO_Pos);
  //SERCOM_USART_CTRLA_RXPO(value) (SERCOM_USART_CTRLA_RXPO_Msk & ((value) shl SERCOM_USART_CTRLA_RXPO_Pos))
  SERCOM_USART_CTRLA_SAMPA_Pos   = 22;           // (SERCOM_USART_CTRLA) Sample Adjustment */
  SERCOM_USART_CTRLA_SAMPA_Msk   = (($3) shl SERCOM_USART_CTRLA_SAMPA_Pos);
  //SERCOM_USART_CTRLA_SAMPA(value) (SERCOM_USART_CTRLA_SAMPA_Msk & ((value) shl SERCOM_USART_CTRLA_SAMPA_Pos))
  SERCOM_USART_CTRLA_FORM_Pos     = 24;           // (SERCOM_USART_CTRLA) Frame Format */
  SERCOM_USART_CTRLA_FORM_Msk     = (($F) shl SERCOM_USART_CTRLA_FORM_Pos);
  //SERCOM_USART_CTRLA_FORM(value) (SERCOM_USART_CTRLA_FORM_Msk & ((value) shl SERCOM_USART_CTRLA_FORM_Pos))
  SERCOM_USART_CTRLA_CMODE_Pos   = 28;           // (SERCOM_USART_CTRLA) Communication Mode */
  SERCOM_USART_CTRLA_CMODE       = (($1) shl SERCOM_USART_CTRLA_CMODE_Pos);
  SERCOM_USART_CTRLA_CPOL_Pos    = 29;           // (SERCOM_USART_CTRLA) Clock Polarity */
  SERCOM_USART_CTRLA_CPOL        = (($1) shl SERCOM_USART_CTRLA_CPOL_Pos);
  SERCOM_USART_CTRLA_DORD_Pos    = 30;           // (SERCOM_USART_CTRLA) Data Order */
  SERCOM_USART_CTRLA_DORD        = (($1) shl SERCOM_USART_CTRLA_DORD_Pos);


  SERCOM_USART_CTRLB_CHSIZE_Pos= 0;            // (SERCOM_USART_CTRLB) Character Size */
  SERCOM_USART_CTRLB_CHSIZE_Msk= ($7 shl SERCOM_USART_CTRLB_CHSIZE_Pos);
  SERCOM_USART_CTRLB_SBMODE_Pos= 6;            // (SERCOM_USART_CTRLB) Stop Bit Mode */
  SERCOM_USART_CTRLB_SBMODE  = ($1 shl SERCOM_USART_CTRLB_SBMODE_Pos);
  SERCOM_USART_CTRLB_COLDEN_Pos= 8;            // (SERCOM_USART_CTRLB) Collision Detection Enable */
  SERCOM_USART_CTRLB_COLDEN  = ($1 shl SERCOM_USART_CTRLB_COLDEN_Pos);
  SERCOM_USART_CTRLB_SFDE_Pos= 9;            // (SERCOM_USART_CTRLB) Start of Frame Detection Enable */
  SERCOM_USART_CTRLB_SFDE    = ($1 shl SERCOM_USART_CTRLB_SFDE_Pos);
  SERCOM_USART_CTRLB_ENC_Pos = 10;           // (SERCOM_USART_CTRLB) Encoding Format */
  SERCOM_USART_CTRLB_ENC     = ($1 shl SERCOM_USART_CTRLB_ENC_Pos);
  SERCOM_USART_CTRLB_PMODE_Pos= 13;           // (SERCOM_USART_CTRLB) Parity Mode */
  SERCOM_USART_CTRLB_PMODE   = ($1 shl SERCOM_USART_CTRLB_PMODE_Pos);
  SERCOM_USART_CTRLB_TXEN_Pos= 16;           // (SERCOM_USART_CTRLB) Transmitter Enable */
  SERCOM_USART_CTRLB_TXEN    = ($1 shl SERCOM_USART_CTRLB_TXEN_Pos);
  SERCOM_USART_CTRLB_RXEN_Pos= 17;           // (SERCOM_USART_CTRLB) Receiver Enable */
  SERCOM_USART_CTRLB_RXEN    = ($1 shl SERCOM_USART_CTRLB_RXEN_Pos);

  SERCOM_USART_BAUD_BAUD_Pos = 0;            // (SERCOM_USART_BAUD) Baud Rate Value */
  SERCOM_USART_BAUD_BAUD_Msk = ($FFFF shl SERCOM_USART_BAUD_BAUD_Pos);

  SERCOM_USART_SAMPLE_RATE_x16 = $1;	//Fractional
  SERCOM_USART_SAMPLE_RATE_x8  = $3;	//Fractional

  SERCOM_USART_INTFLAG_DRE_Pos      = 0;
  SERCOM_USART_INTFLAG_DRE          = ($1 shl SERCOM_USART_INTFLAG_DRE_Pos);
  SERCOM_USART_INTFLAG_TXC_Pos      = 1;
  SERCOM_USART_INTFLAG_TXC          = ($1 shl SERCOM_USART_INTFLAG_TXC_Pos);
  SERCOM_USART_INTFLAG_RXC_Pos      = 2;
  SERCOM_USART_INTFLAG_RXC          = ($1 shl SERCOM_USART_INTFLAG_RXC_Pos);
  SERCOM_USART_INTFLAG_ERROR_Pos   = 7;
  SERCOM_USART_INTFLAG_ERROR       = ($1 shl SERCOM_USART_INTFLAG_ERROR_Pos);

