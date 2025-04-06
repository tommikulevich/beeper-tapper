/**
 *******************************************************************************
 * @file    uart_hw.c
 * @brief   UART HW abstraction source file.
 *******************************************************************************
 */

/************
 * INCLUDES *
 ************/

#include "stm32f070xb.h"
#include "stm32f0xx_hal_dma.h"
#include "stm32f0xx_hal_uart.h"

#include "uart_hw.h"

/********************
 * GLOBAL VARIABLES *
 ********************/

UART_HandleTypeDef huart1;

/********************
 * GLOBAL FUNCTIONS *
 ********************/

result_t uart_hw_transmit( uint8_t * data, uint16_t size, uint32_t timeout ) {
    RETURN_ERROR_IF(
        HAL_UART_Transmit(&huart1, data, size, timeout) != HAL_OK, 
        RES_ERR_GENERIC
    );

    return RES_OK;
}

result_t uart_hw_init( void ) {
    huart1.Instance = USART1;
    huart1.Init.BaudRate = 115200;
    huart1.Init.WordLength = UART_WORDLENGTH_8B;
    huart1.Init.StopBits = UART_STOPBITS_1;
    huart1.Init.Parity = UART_PARITY_NONE;
    huart1.Init.Mode = UART_MODE_TX_RX;
    huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
    huart1.Init.OverSampling = UART_OVERSAMPLING_16;

    RETURN_ERROR_IF(
        HAL_UART_Init(&huart1) != HAL_OK, 
        RES_ERR_NOT_READY
    );

    return RES_OK;
}
