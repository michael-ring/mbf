#!/bin/sh
BIN=SerialPort.elf
arm-none-eabi-gdb $BIN --tui --eval-command="target extended :3333" --eval-command="set gdb_memory_map disable" --eval-command="monitor halt" --eval-command="set mem inaccessible-by-default off" --eval-command="load" --eval-command="layout asm" --eval-command="layout regs"  #--eval-command="set remotetimeout 3000"
