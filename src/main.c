/**
 *******************************************************************************
 * @file    main.c
 * @brief   Main app source file.
 *******************************************************************************
 */

// =============================================================================
// ================== WARNING: This is a test dummy program! ===================
// =============================================================================

/************
 * INCLUDES *
 ************/

#include "stm32f0xx_hal.h"

#include "FreeRTOS.h"
#include "task.h"

#include "uart.h"

#include "utils.h"
#include "io_pins.h"

/********************
 * STATIC FUNCTIONS *
 ********************/

static void dummy_led_gpio_init( void ) {
    __HAL_RCC_GPIOA_CLK_ENABLE();
    GPIO_InitTypeDef GPIO_InitStruct = {
        .Pin = DUMMY_LED_PIN,
        .Mode = GPIO_MODE_OUTPUT_PP,
        .Pull = GPIO_NOPULL,
        .Speed = GPIO_SPEED_FREQ_LOW
    };
    HAL_GPIO_Init(DUMMY_LED_PORT, &GPIO_InitStruct);
}

static void vDummyBlinkTask( void * arg UNUSED_PARAM ) {
    dummy_led_gpio_init();

    while(1) {
        HAL_GPIO_TogglePin(DUMMY_LED_PORT, DUMMY_LED_PIN);
        vTaskDelay(200 / portTICK_PERIOD_MS);
    }
}

/********************
 * GLOBAL FUNCTIONS *
 ********************/

void vApplicationStackOverflowHook( TaskHandle_t xTask UNUSED_PARAM, 
        char * pcTaskName UNUSED_PARAM ) {
    while(1);
}

/*****************
 * MAIN FUNCTION *
 *****************/

int main( void ) {
    HAL_Init();
    uart_init();

    xTaskCreate(vDummyBlinkTask, "Dummy Blink Task", 
        configMINIMAL_STACK_SIZE, NULL, 1, NULL);

    vTaskStartScheduler();

    while(1);

    return EXIT_FAILURE;
}
