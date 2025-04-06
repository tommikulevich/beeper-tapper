/**
 *******************************************************************************
 * @file    uart_hw.h
 * @brief   UART HW abstraction header file.
 *******************************************************************************
 */

#ifndef UART_HW_H
#define UART_HW_H

#ifdef __cplusplus
extern "C" {
#endif

/************
 * INCLUDES *
 ************/

#include <stdint.h>

#include "utils.h"

/******************************
 * GLOBAL FUNCTION PROTOTYPES *
 ******************************/

result_t uart_hw_transmit( uint8_t * data, uint16_t size, uint32_t timeout);
result_t uart_hw_init( void );

#ifdef __cplusplus
}
#endif

#endif /* UART_HW_H */
