#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
echo Assembling blinky
/Users/ring/fpcupdeluxe/fpc/bin/x86_64-darwin/arm-embedded-as -march=armv6-m -mthumb -mthumb-interwork -mfpu=softvfp -o /Users/ring/devel/mbf/Samples/Blinky/lib/arm-embedded/Blinky.o  /Users/ring/devel/mbf/Samples/Blinky/lib/arm-embedded/Blinky.s
if [ $? != 0 ]; then DoExitAsm blinky; fi
rm /Users/ring/devel/mbf/Samples/Blinky/lib/arm-embedded/Blinky.s
echo Linking /Users/ring/devel/mbf/Samples/Blinky/Blinky
OFS=$IFS
IFS="
"
/Users/ring/fpcupdeluxe/fpc/bin/x86_64-darwin/arm-embedded-ld -g     --gc-sections   -L. -o /Users/ring/devel/mbf/Samples/Blinky/Blinky.elf -T /Users/ring/devel/mbf/Samples/Blinky/link17830.res
if [ $? != 0 ]; then DoExitLink /Users/ring/devel/mbf/Samples/Blinky/Blinky; fi
IFS=$OFS
echo Linking /Users/ring/devel/mbf/Samples/Blinky/Blinky
OFS=$IFS
IFS="
"
/Users/ring/fpcupdeluxe/fpc/bin/x86_64-darwin/arm-embedded-objcopy -O ihex /Users/ring/devel/mbf/Samples/Blinky/Blinky.elf /Users/ring/devel/mbf/Samples/Blinky/Blinky.hex
if [ $? != 0 ]; then DoExitLink /Users/ring/devel/mbf/Samples/Blinky/Blinky; fi
IFS=$OFS
echo Linking /Users/ring/devel/mbf/Samples/Blinky/Blinky
OFS=$IFS
IFS="
"
/Users/ring/fpcupdeluxe/fpc/bin/x86_64-darwin/arm-embedded-objcopy -O binary /Users/ring/devel/mbf/Samples/Blinky/Blinky.elf /Users/ring/devel/mbf/Samples/Blinky/Blinky.bin
if [ $? != 0 ]; then DoExitLink /Users/ring/devel/mbf/Samples/Blinky/Blinky; fi
IFS=$OFS
