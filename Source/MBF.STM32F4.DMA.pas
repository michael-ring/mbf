unit mbf.stm32f4.dma;
{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}
{
  Related Reference Manuals

  STM32F405415, STM32F407417, STM32F427437 and STM32F429439 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00031020.pdf

  STM32F401xBC and STM32F401xDE advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00096844.pdf

  STM32F411xCE advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00119316.pdf

  STM32F446xx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00135183.pdf

  STM32F469xx and STM32F479xx advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00127514.pdf

  STM32F410 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00180366.pdf

  STM32F412 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00180369.pdf

  STM32F413423 advanced Arm
  http://www.st.com/resource/en/reference_manual/DM00305666.pdf
}

interface

{$include MBF.Config.inc}

const
  TDMACHANNEL0 = 0;
  TDMACHANNEL1 = 1;
  TDMACHANNEL2 = 2;
  TDMACHANNEL3 = 3;
  TDMACHANNEL4 = 4;
  TDMACHANNEL5 = 5;
  TDMACHANNEL6 = 6;
  TDMACHANNEL7 = 7;

TDMAChannels = (
  {$if defined(has_ADC1)        }   DMA2_STREAM0_ADC1     = DMA2_Stream0_BASE + TDMACHANNEL0 {$endif}
  {$if defined(has_ADC1)        },  DMA2_STREAM0_ADC1     = DMA2_Stream0_BASE + TDMACHANNEL0 {$endif}
  {$if defined(has_ADC1)        },  DMA2_STREAM4_ADC1     = DMA2_Stream4_BASE + TDMACHANNEL0 {$endif}
  {$if defined(has_ADC1)        },  DMA2_STREAM4_APC1     = DMA2_Stream4_BASE + TDMACHANNEL0 {$endif}
  {$if defined(has_TIM1)        },  DMA2_STREAM6_TIM1_CH1 = DMA2_Stream6_BASE + TDMACHANNEL0 {$endif}
  {$if defined(has_TIM1)        },  DMA2_STREAM6_TIM1_CH2 = DMA2_Stream6_BASE + TDMACHANNEL0 {$endif}
  {$if defined(has_TIM1)        },  DMA2_STREAM6_TIM1_CH3 = DMA2_Stream6_BASE + TDMACHANNEL0 {$endif}
  {$if defined(has_SPI1)        },  DMA2_STREAM0_SPI1_RX  = DMA2_Stream0_BASE + TDMACHANNEL3 {$endif}
  {$if defined(has_SPI1)        },  DMA2_STREAM2_SPI1_RX  = DMA2_Stream2_BASE + TDMACHANNEL3 {$endif}
  {$if defined(has_SPI1)        },  DMA2_STREAM3_SPI1_TX  = DMA2_Stream3_BASE + TDMACHANNEL3 {$endif}
  {$if defined(has_SPI1)        },  DMA2_STREAM5_SPI1_TX  = DMA2_Stream5_BASE + TDMACHANNEL3 {$endif}
  {$if defined(has_SPI4)        },  DMA2_STREAM0_SPI4_RX  = DMA2_Stream0_BASE + TDMACHANNEL4 {$endif}

  {$if defined(has_USART1)      },  DMA2_STREAM2_USART1_RX = DMA2_Stream2_BASE + TDMACHANNEL4 {$endif}
  {$if defined(has_SDIO)        },  DMA2_STREAM3_SDIO      = DMA2_Stream3_BASE + TDMACHANNEL4 {$endif}
  {$if defined(has_USART1)      },  DMA2_STREAM5_USART1_RX = DMA2_Stream5_BASE + TDMACHANNEL4 {$endif}
  {$if defined(has_SDIO)        },  DMA2_STREAM6_SDIO      = DMA2_Stream6_BASE + TDMACHANNEL4 {$endif}
  {$if defined(has_USART1)      },  DMA2_STREAM7_USART1_TX = DMA2_Stream7_BASE + TDMACHANNEL4 {$endif}
  {$if defined(has_SPI4)        },  DMA2_STREAM1_SPI4_TX   = DMA2_Stream1_BASE + TDMACHANNEL4 {$endif}
  {$if defined(has_SPI4)        },  DMA2_STREAM3_SPI3_RX   = DMA2_Stream3_BASE + TDMACHANNEL5 {$endif}
  {$if defined(has_SPI4)        },  DMA2_STREAM4_SPI3_TX   = DMA2_Stream4_BASE + TDMACHANNEL5 {$endif}


  {$if defined(has_arduinopins) }   DMA_SPI_RX =   DMA2_Stream0_BASE {$endif}
  {$if defined(has_arduinopins) },  DMA_SPI_TX =   DMA2_Stream3_BASE,{$endif}

  {$if defined(has_SPI2)        },  DMA1_STREAM3_SPI2_RX = DMA1_Stream3_BASE {$endif}
  {$if defined(has_SPI2)        },  DMA1_STREAM4_SPI2_TX = DMA1_Stream4_BASE {$endif}

  {$if defined(has_SPI3)        },  DMA1_STREAM0_SPI3_RX = DMA1_Stream0_BASE {$endif}
  {$if defined(has_SPI3)        },  DMA1_STREAM2_SPI3_RX = DMA1_Stream2_BASE {$endif}
  {$if defined(has_SPI3)        },  DMA1_STREAM5_SPI3_TX = DMA1_Stream5_BASE {$endif}
  {$if defined(has_SPI3)        },  DMA1_STREAM7_SPI3_TX = DMA1_Stream7_BASE {$endif}

);

TDMARegistersMode = (
  MemoryToPeripheral=0,
  PeripheralToMemory=1,
  MemoryToMemory=2
);

TDMARegistersHelper = object
public
  procedure Initialize;
  procedure Initialize(const DMAChannel : TDMAChannels,const Mode : TDMARegistersMode);
end;


//TDMAStreamRegistersHelper = record helper for TDMA_Stream_Registers
//end;



implementation
  procedure TDMARegistersHelper.Initialize;
  begin
  end;
  procedure TDMARegistersHelper.Initialize(const DMAChannel : TDMAChannels, const Mode : TDMARegistersMode);
  begin
  end;
end.
