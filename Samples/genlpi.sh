#!/bin/sh
APPNAME=$1

if [ -z "$1" ]; then
	echo Usage: 
	echo genlpi.sh Projectname
	exit 1
fi

if [ ! -d $APPNAME ]; then
  echo Project "$APPNAME" does not exist in current directory
  exit 1
fi

rm -f $APPNAME/*.lpi
rm -f $APPNAME/*.svd
rm -f $APPNAME/*.SVD
rm -f $APPNAME/*.user

cat devicelist | grep -v "^#" | while read BOARD_OR_CPU SUBARCH DEVICE DEVICESVD; do
  ARCH=
  ARCHSVD=
  BINUTILS_PATH=
  EXTRACUSTOMOPTION1=
  EXTRACUSTOMOPTION2=
  EXTRACUSTOMOPTION3=

  if [ "$SUBARCH" = ARMV6M ]; then
    ARCH=arm
    ARCHSVD=Cortex-M0.svd
    BINUTILS_PATH=arm-none-eabi-
  fi

  if [ "$SUBARCH" = ARMV7M ]; then
    ARCH=arm
    ARCHSVD=Cortex-M3.svd
    BINUTILS_PATH=arm-none-eabi-
  fi

  if [ "$SUBARCH" = ARMV7EM ]; then
    ARCH=arm
    ARCHSVD=Cortex-M4.svd
    BINUTILS_PATH=arm-none-eabi-
  fi

  if [ "$SUBARCH" = MIPS32R2 ]; then
    ARCH=mipsel
    ARCHSVD=
    BINUTILS_PATH=mips-sde-elf-
  fi

  if [ "$SUBARCH" = AVR5 ]; then
    ARCH=avr
    ARCHSVD=
    BINUTILS_PATH=avr-
    EXTRACUSTOMOPTION1=-godwarfcpp
  fi

  if [ "$BOARD_OR_CPU" = "samd10xmini" -o "$BOARD_OR_CPU" = "nucleof042k6" -o "$SUBARCH" = "AVR5" ]; then
    HEAPSIZE=2048
    STACKSIZE=2048
  else
    HEAPSIZE=8192
    STACKSIZE=8192
  fi

  DEVICESVD=$(echo `pwd`/templates/$DEVICESVD)

  cat templates/template.lpi | sed -e "s,%%APPNAME%%,$APPNAME,g" \
                       -e "s,%%ARCH%%,$ARCH,g" \
                       -e "s,%%SUBARCH%%,$SUBARCH,g" \
                       -e "s,%%BINUTILS_PATH%%,$BINUTILS_PATH,g" \
                       -e "s,%%HEAPSIZE%%,$HEAPSIZE,g" \
                       -e "s,%%STACKSIZE%%,$STACKSIZE,g" \
                       -e "s,%%EXTRACUSTOMOPTION1%%,$EXTRACUSTOMOPTION1,g" \
                       -e "s,%%EXTRACUSTOMOPTION2%%,$EXTRACUSTOMOPTION2,g" \
                       -e "s,%%EXTRACUSTOMOPTION3%%,$EXTRACUSTOMOPTION3,g" \
                       -e "s,%%BOARD_OR_CPU%%,$BOARD_OR_CPU,g" >$APPNAME/$APPNAME-$BOARD_OR_CPU.lpi
  echo $APPNAME/$APPNAME-$BOARD_OR_CPU.lpi created
  if [ -n "$ARCHSVD" ]; then
    cat templates/template.jdebug | sed -e "s,%%APPNAME%%,$APPNAME,g" \
                                      -e "s,%%ARCHSVD%%,$ARCHSVD,g" \
                                      -e "s,%%DEVICESVD%%,$DEVICESVD,g" \
                                      -e "s,%%DEVICE%%,$DEVICE,g" >$APPNAME/$APPNAME-$BOARD_OR_CPU.jdebug
    echo $APPNAME/$APPNAME-$BOARD_OR_CPU.jdebug created
  fi
  #if [ -f templates/$DEVICESVD ]; then
  #  cp templates/$DEVICESVD $APPNAME/
  #  echo $APPNAME/$DEVICESVD created
  #else
  #  echo "Warning, no SVD file copied"
  #fi

  if [ ! -f $APPNAME/$APPNAME.lpr ]; then
    cat templates/template.lpr | sed "s,%%APPNAME%%,$APPNAME,g" >$APPNAME/$APPNAME.lpr
    echo $APPNAME/$APPNAME.lpr created
  fi
done
