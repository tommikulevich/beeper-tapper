/**
 *******************************************************************************
 * @file    io_pins.h
 * @brief   IO pins header file.
 *******************************************************************************
 */

#ifndef IO_PINS_H
#define IO_PINS_H

#ifdef __cplusplus
extern "C" {
#endif

/************
 * INCLUDES *
 ************/

#include "stm32f070xb.h"
#include "stm32f0xx_hal_gpio.h"

/***********
 * DEFINES *
 ***********/

#define DUMMY_LED_PORT  GPIOA
#define DUMMY_LED_PIN   GPIO_PIN_5

#ifdef __cplusplus
}
#endif

#endif /* IO_PINS_H */
  