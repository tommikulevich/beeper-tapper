RTOS_ASM_SOURCES :=

RTOS_C_SOURCES 	 := drivers/ARM/RTOS/Source/tasks.c \
                  	drivers/ARM/RTOS/Source/queue.c \
                  	drivers/ARM/RTOS/Source/list.c \
                  	drivers/ARM/RTOS/Source/portable/GCC/ARM_CM0/port.c \
                  	drivers/ARM/RTOS/Source/portable/GCC/ARM_CM0/portasm.c \
                  	drivers/ARM/RTOS/Source/portable/MemMang/heap_4.c

RTOS_INCLUDES  	 := -Isrc/rtos \
					-Idrivers/ARM/RTOS/Source/include \
                  	-Idrivers/ARM/RTOS/Source/portable/GCC/ARM_CM0
