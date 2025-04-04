#!/bin/bash

BIN_NAME="beeper-tapper"

PROJECT_DIR=$(dirname "$(dirname "$(realpath "$0")")")
BUILD_DIR="$PROJECT_DIR/build"
TOOLS_DIR="$PROJECT_DIR/tools"

SWD_CONFIG="$TOOLS_DIR/dbg_config/rpi-swd.cfg"
BIN_FILE="$BUILD_DIR/$BIN_NAME.elf"

echo "Flashing device..."

if [ ! -f "$BIN_FILE" ]; then
    echo "Binary file $BIN_FILE not found!"
    exit 1
fi

if [ ! -f "$SWD_CONFIG" ]; then
    echo "Configuration file $SWD_CONFIG not found!"
    exit 1
fi

sudo openocd -f "$SWD_CONFIG" -c "program $BIN_FILE verify reset exit"

if [ $? -eq 0 ]; then
    echo "Binary successfully uploaded!"
else
    echo "Failed to upload binary."
    exit 1
fi
