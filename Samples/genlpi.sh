#!/bin/sh
APPNAME=$1
BOARD_OR_CPU=$2

if [ -z "$1" -o -z "$2" ]; then
	echo Usage: 
	echo genlpi.sh Projectname Board/CpuName
	exit 1
fi

if [ ! -d $APPNAME ]; then
  echo Project "$APPNAME" does not exist in current directory
  exit 1
fi

if [ -z "$BOARD_OR_CPU" ]; then
  echo Please provide an embedded board/cpu
fi

case $BOARD_OR_CPU in
  nucleof103re)  ARCH=arm
                 BINUTILS_PATH=/usr/local/bin/arm-none-eabi-
                 SUBARCH=armv7m
                 DEVICE=stm32f103re
                 ARCHSVD=Cortex-M3.svd
                 DEVICESVD=STM32F103.svd
                 ;;
  stm32f107vc)   ARCH=arm
                 BINUTILS_PATH=/usr/local/bin/arm-none-eabi-
                 SUBARCH=armv7m
                 DEVICE=stm32f107vc
                 ARCHSVD=Cortex-M3.svd
                 DEVICESVD=STM32F107.svd
                 ;;
  nucleof303k8)  ARCH=arm
                 BINUTILS_PATH=/usr/local/bin/arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=stm32f303k8
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=STM32F303.svd
                 ;;
  nucleof401re)  ARCH=arm
                 BINUTILS_PATH=/usr/local/bin/arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=stm32f401re
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=STM32F401.svd
                 ;;
  nucleof411re)  ARCH=arm
                 BINUTILS_PATH=/usr/local/bin/arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=stm32f411re
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=STM32F411.svd
                 ;;
  pic32mx150f128b) ARCH=mipsel
                 BINUTILS_PATH=/usr/local/bin/mips-sde-elf-
                 SUBARCH=mips32r2
                 DEVIVE=pic32mx150f128b
                 ARCHSVD=
                 DEVICESVD=
                 ;;
             *)  echo Board or CPU unknown
                 exit 1
                 ;;
esac

cat templates/template.lpi | sed -e "s,%%APPNAME%%,$APPNAME,g" \
                       -e "s,%%ARCH%%,$ARCH,g" \
                       -e "s,%%SUBARCH%%,$SUBARCH,g" \
                       -e "s,%%BINUTILS_PATH%%,$BINUTILS_PATH,g" \
                       -e "s,%%BOARD_OR_CPU%%,$BOARD_OR_CPU,g" >$APPNAME/$APPNAME-$BOARD_OR_CPU.lpi
if [ -n "$ARCHSVD" ]; then
  cat templates/template.jdebug | sed -e "s,%%APPNAME%%,$APPNAME,g" \
                                      -e "s,%%ARCHSVD%%,$ARCHSVD,g" \
                                      -e "s,%%DEVICESVD%%,$DEVICESVD,g" \
                                      -e "s,%%DEVICE%%,$DEVICE,g" >$APPNAME/$APPNAME-$BOARD_OR_CPU.jdebug
fi
if [ -f templates/$DEVICESVD ]; then
  cp templates/$DEVICESVD $APPNAME/
  echo $APPNAME/$DEVICESVD created
else
  echo "Warning, no SVD file copied"
fi

echo $APPNAME/$APPNAME-$BOARD_OR_CPU.lpi created
echo $APPNAME/$APPNAME-$BOARD_OR_CPU.jdebug created
