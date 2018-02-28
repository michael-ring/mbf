This directory contains example code for using the library, everything from a simple blinky program that light up a LED to units for managing output to TFT, OLED and LCD displays.

To try the examples use lazbuild (You have Lazarus installed, have you????)

cd Blinky
lazbuild Blinky-nucleof303k8.lpi

You can also directly open the available projects in Lazarus.

Please note that you will need to first compile and install trunk version of fpc to be able to use the embedded target and mbf

Here's how to build fpc on Unix-ish systems:
```shell
CROSSOPT="-O1 -gw2 -dDEBUG"
SUBARCH=armv6m
make clean buildbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- || exit 1
make     installbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- INSTALL_UNITDIR=/usr/local/lib/fpc/3.1.1/units/arm-embedded/$SUBARCH/rtl || exit 1

SUBARCH=armv7m
make clean buildbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- || exit 1
make     installbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- INSTALL_UNITDIR=/usr/local/lib/fpc/3.1.1/units/arm-embedded/$SUBARCH/rtl || exit 1

SUBARCH=armv7em
make clean buildbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- || exit 1
make     installbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- INSTALL_UNITDIR=/usr/local/lib/fpc/3.1.1/units/arm-embedded/$SUBARCH/rtl || exit 1
cp /usr/local/lib/fpc/3.1.1/ppcrossarm /usr/local/lib/fpc/3.1.1/ppcrossarm-$SUBARCH
ln -sf /usr/local/lib/fpc/3.1.1/ppcrossarm /usr/local/bin/ppcarm


CROSSOPT="-O1 -gw2 -dDEBUG"
SUBARCH=mips32r2 
make clean buildbase  CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=mipsel SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=mips-sde-elf- || exit 1
make      installbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=mipsel SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=mips-sde-elf- INSTALL_UNITDIR=/usr/local/lib/fpc/3.1.1/units/mipsel-embedded/$SUBARCH/rtl || exit 1
fi
```
