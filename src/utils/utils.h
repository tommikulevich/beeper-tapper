/**
 *******************************************************************************
 * @file    utils.h
 * @brief   Utility header file.
 *          Macros, typedef etc. for common tasks such as I/O operations, 
 *          assertions and time measurements.
 *******************************************************************************
 */

#ifndef UTILS_H
#define UTILS_H

#ifdef __cplusplus
extern "C" {
#endif

/************
 * INCLUDES *
 ************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// ===========
// = General =
// ===========

#define OUTPUT
#define UNUSED_PARAM            __attribute__((unused))
#define NELEMS(x)               (sizeof(x)/sizeof((x)[0]))
#define STRUCT_INIT_ALL_ZEROS   {0}

typedef enum {
    RES_OK,
    RES_ERR_GENERIC,
    RES_ERR_NOT_READY,
    RES_ERR_INVALID_SIZE,
    RES_ERR_WRONG_ARGS,
    RES_ERR_NULL_PTR
} result_t;

#define RETURN_ON_ERROR(result) \
    do { \
        if ((result) != RES_OK) { \
            return (result); \
        } \
    } while (0)

#define RETURN_IF_NULL(ptr) \
    do { \
        if ((ptr) == NULL) { \
            return RES_ERR_NULL_PTR; \
        } \
    } while (0)

#define RETURN_ERROR_IF(condition, error) \
    do { \
        if ((condition)) { \
            return (error); \
        } \
    } while (0)

// ======
// = IO =
// ======

// ===========
// = Asserts =
// ===========

// ========
// = Time =
// ========

#ifdef __cplusplus
}
#endif

#endif