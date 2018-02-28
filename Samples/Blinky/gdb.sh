#!/bin/sh
BIN=Blinky.elf
mipsel-none-elf-gdb $BIN --tui --eval-command="target extended :2331" --eval-command="monitor reset halt" --eval-command="set mem inaccessible-by-default off" --eval-command="load" --eval-command="layout asm" --eval-command="layout regs"  --eval-command="set remotetimeout 3000"
