#!/bin/bash

BIN_NAME="beeper-tapper"

PROJECT_DIR=$(dirname "$(dirname "$(realpath "$0")")")
BUILD_DIR="$PROJECT_DIR/build"
TOOLS_DIR="$PROJECT_DIR/tools"
DBG_CONFIG_DIR="$TOOLS_DIR/dbg_config"

SWD_CONFIG="$TOOLS_DIR/dbg_config/rpi-swd.cfg"
GDB_CONFIG="$TOOLS_DIR/dbg_config/debug.gdb"
BIN_FILE="$BUILD_DIR/$BIN_NAME.elf"

echo "Starting debug session..."

if [ ! -f "$BIN_FILE" ]; then
    echo "Binary file $BIN_FILE not found!"
    exit 1
fi

if [ ! -f "$SWD_CONFIG" ]; then
    echo "Configuration file $SWD_CONFIG not found!"
    exit 1
fi

if [ ! -f "$GDB_CONFIG" ]; then
    echo "Debug configuration file $GDB_CONFIG not found!"
    exit 1
fi

sudo openocd -f "$SWD_CONFIG" &
OPENOCD_PID=$!

sleep 1

gdb -ex "target extended-remote :3333" -x "$GDB_CONFIG" "$BIN_FILE"

kill $OPENOCD_PID
echo "Debug session ended."
