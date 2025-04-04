# ==============================
# === Beeper Tapper Makefile ===
# ==============================

BIN_NAME        := beeper-tapper
BUILD_DIR       := build
OBJ_DIR         := $(BUILD_DIR)/obj

CC              := arm-none-eabi-gcc
AS              := arm-none-eabi-gcc -x assembler-with-cpp
CP              := arm-none-eabi-objcopy
SZ              := arm-none-eabi-size

LDSCRIPT        := ldscripts/linker_stm32f070rbtx.ld

CFLAGS  		:= -mcpu=cortex-m0 -mthumb -O0 -g -Wall -Wextra -Werror -Wpedantic \
           		   -Wconversion -Wshadow -Wformat=2 -Wstrict-aliasing=2 -Wnull-dereference \
           		   -ffunction-sections -fdata-sections -DUSE_STDPERIPH_DRIVER -DSTM32F070xB
LDFLAGS 		:= -mcpu=cortex-m0 -mthumb -O0 -g -Wall -Wextra -Werror -Wpedantic \
           		   -Wconversion -Wshadow -Wl,--gc-sections --specs=nano.specs \
           		   -T$(LDSCRIPT) -Wl,-Map=$(BUILD_DIR)/$(BIN_NAME).map

include mk/stm.mk
include mk/rtos.mk
include mk/app.mk

INCLUDES    := $(APP_INCLUDES) $(STM_INCLUDES) $(RTOS_INCLUDES)
C_SOURCES   := $(APP_C_SOURCES) $(STM_C_SOURCES) $(RTOS_C_SOURCES)
ASM_SOURCES := $(APP_ASM_SOURCES) $(STM_ASM_SOURCES) $(RTOS_ASM_SOURCES)
SOURCES     := $(C_SOURCES) $(ASM_SOURCES)

OBJECTS := $(addprefix $(OBJ_DIR)/, $(notdir $(C_SOURCES:.c=.o))) \
           $(addprefix $(OBJ_DIR)/, $(notdir $(ASM_SOURCES:.s=.o)))

vpath %.c $(sort $(dir $(C_SOURCES)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

.PHONY: all clean flash debug

all: $(BUILD_DIR)/$(BIN_NAME).elf $(BUILD_DIR)/$(BIN_NAME).bin $(BUILD_DIR)/$(BIN_NAME).hex

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	@echo "Compiling $<"
	@$(CC) -c $(CFLAGS) $(INCLUDES) -MMD -MP -o $@ $<

$(OBJ_DIR)/%.o: %.s | $(OBJ_DIR)
	@echo "Assembling $<"
	@$(AS) -c $(CFLAGS) -o $@ $<

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/$(BIN_NAME).elf: $(OBJECTS) | $(BUILD_DIR)
	@echo "Linking $(BIN_NAME)"
	@$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	@$(SZ) $@

$(BUILD_DIR)/$(BIN_NAME).bin: $(BUILD_DIR)/$(BIN_NAME).elf | $(BUILD_DIR)
	@$(CP) -O binary $< $@

$(BUILD_DIR)/$(BIN_NAME).hex: $(BUILD_DIR)/$(BIN_NAME).elf | $(BUILD_DIR)
	@$(CP) -O ihex $< $@

clean:
	@echo "Cleaning build directory"
	@rm -rf $(BUILD_DIR)
