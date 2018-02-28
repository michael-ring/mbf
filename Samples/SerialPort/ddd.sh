#!/bin/sh
BIN=SerialPort.elf
ddd --debugger 'arm-none-eabi-gdb --eval-command="target extended :3333" --eval-command="monitor halt"  --eval-command="monitor reset" --eval-command="set mem inaccessible-by-default off"' $BIN
