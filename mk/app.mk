APP_ASM_SOURCES :=

APP_C_SOURCES 	:= src/main.c \
				   src/uart/uart_hw.c \
				   src/uart/uart.c

APP_INCLUDES  	:= -Isrc \
				   -Isrc/utils \
				   -Isrc/gpio \
				   -Isrc/uart
