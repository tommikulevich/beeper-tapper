STM_ASM_SOURCES := startup/startup_stm32f070xb.s

STM_C_SOURCES   := src/system/stm32f0xx_it.c \
                   src/system/system_stm32f0xx.c \
                   drivers/STM32F0xx-Nucleo/HAL/Src/stm32f0xx_hal.c \
                   drivers/STM32F0xx-Nucleo/HAL/Src/stm32f0xx_hal_cortex.c \
                   drivers/STM32F0xx-Nucleo/HAL/Src/stm32f0xx_hal_rcc.c \
                   drivers/STM32F0xx-Nucleo/HAL/Src/stm32f0xx_hal_gpio.c \
                   drivers/STM32F0xx-Nucleo/HAL/Src/stm32f0xx_hal_uart.c \
                   drivers/STM32F0xx-Nucleo/HAL/Src/stm32f0xx_hal_dma.c

STM_INCLUDES    := -Isrc/system \
                   -Idrivers/ARM/CMSIS/CMSIS/Core/Include \
                   -Idrivers/STM32F0xx-Nucleo/CMSIS_Device/Include \
                   -Idrivers/STM32F0xx-Nucleo/BSP \
                   -Idrivers/STM32F0xx-Nucleo/HAL/Inc
    