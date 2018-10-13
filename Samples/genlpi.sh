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
  nucleof072rb)  ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv6m
                 DEVICE=stm32f072rb
                 ARCHSVD=Cortex-M0.svd
                 DEVICESVD=STM32F0x2.svd
                 ;;
  nucleof103rb)  ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7m
                 DEVICE=stm32f103rb
                 ARCHSVD=Cortex-M3.svd
                 DEVICESVD=STM32F103.svd
                 ;;
  stm32f107vc)   ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7m
                 DEVICE=stm32f107vc
                 ARCHSVD=Cortex-M3.svd
                 DEVICESVD=STM32F107.svd
                 ;;
  nucleof303k8)  ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=stm32f303k8
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=STM32F303.svd
                 ;;
  nucleof401re)  ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=stm32f401re
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=STM32F401.svd
                 ;;
  stm32f407vg)   ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=stm32f407vg
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=STM32F407.svd
                 ;;
  nucleof411re)  ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=stm32f411re
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=STM32F411.svd
                 ;;
  nucleol432kc)  ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=stm32l432kc
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=STM32L4x2.svd
                 ;;
  freedom_k22f)  ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=mk22fn512vlh12
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=
                 ;;
  freedom_k64f)  ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=mk64fn1m0vll12
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=
                 ;;
  teensy31)      ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv7em
                 DEVICE=mk20dx256vlh7
                 ARCHSVD=Cortex-M4.svd
                 DEVICESVD=
                 ;;
  arduinozero)   ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv6m
                 DEVICE=atsamd21g18
                 ARCHSVD=Cortex-M0.svd
                 DEVICESVD=ATSAMD21G18A.svd
                 ;;
  samd10xmini)   ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv6m
                 DEVICE=atsamd10d14
                 ARCHSVD=Cortex-M0.svd
                 DEVICESVD=ATSAMD10D14A.svd
                 ;;
  samc21xpro)    ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv6m
                 DEVICE=atsamc21j18
                 ARCHSVD=Cortex-M0.svd
                 DEVICESVD=ATSAMC21J18A.svd
                 ;;
  samd20xpro)    ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv6m
                 DEVICE=atsamd20j18
                 ARCHSVD=Cortex-M0.svd
                 DEVICESVD=ATSAMD20J18.svd
                 ;;
  samd21xpro)    ARCH=arm
                 BINUTILS_PATH=arm-none-eabi-
                 SUBARCH=armv6m
                 DEVICE=atsamd21j18
                 ARCHSVD=Cortex-M0.svd
                 DEVICESVD=ATSAMD21J18A.svd
                 ;;
  chipkitlenny)  ARCH=mipsel
                 BINUTILS_PATH=mips-sde-elf-
                 SUBARCH=mips32r2
                 DEVICE=pic32mx270f256d
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

if [ ! -f $APPNAME/$APPNAME.lpr ]; then
  cat templates/template.lpr | sed "s,%%APPNAME%%,$APPNAME,g" >$APPNAME/$APPNAME.lpr
  echo $APPNAME/$APPNAME.lpr created
fi

echo $APPNAME/$APPNAME-$BOARD_OR_CPU.lpi created
echo $APPNAME/$APPNAME-$BOARD_OR_CPU.jdebug created
