/**
 *******************************************************************************
 * @file    uart.c
 * @brief   UART source file.
 *******************************************************************************
 */

/************
 * INCLUDES *
 ************/

#include <stdio.h>
#include <sys/unistd.h>

#include "uart.h"
#include "uart_hw.h"

/********************
 * GLOBAL FUNCTIONS *
 ********************/

int _write( int file, char * data, int len ) {
    // Retargeting _write to use UART for printf
    (void)file;
    uart_hw_transmit((uint8_t*)data, (uint16_t)len, HAL_MAX_DELAY);
    return len;
}

result_t uart_init( void ) {
    return uart_hw_init();
}
