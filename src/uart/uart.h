/**
 *******************************************************************************
 * @file    uart.h
 * @brief   UART header file.
 *******************************************************************************
 */

#ifndef UART_H
#define UART_H

#ifdef __cplusplus
extern "C" {
#endif

/************
 * INCLUDES *
 ************/

#include "utils.h"

/******************************
 * GLOBAL FUNCTION PROTOTYPES *
 ******************************/

result_t uart_init( void );

#ifdef __cplusplus
}
#endif

#endif /* UART_H */
