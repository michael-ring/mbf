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

cat devicelist | while read BOARD_OR_CPU SUBARCH; do
  echo $BOARD_OR_CPU $SUBARCH
  echo $SUBARCH | grep arm >/dev/null && ARCH=arm
  echo $SUBARCH | grep arm >/dev/null && BINUTILS=arm-none-eabi-
  echo $SUBARCH | grep mips >/dev/null && ARCH=mipsel
  echo $SUBARCH | grep mips >/dev/null && BINUTILS=mips-sde-elf-
  cat ../Samples/templates/template.lpi | sed -e "s,%%APPNAME%%,$APPNAME,g" \
                       -e "s,%%ARCH%%,$ARCH,g" \
                       -e "s,%%SUBARCH%%,$SUBARCH,g" \
                       -e "s,%%BINUTILS_PATH%%,$BINUTILS,g" \
                       -e "s,%%BOARD_OR_CPU%%,$BOARD_OR_CPU,g" >$APPNAME/$APPNAME-$BOARD_OR_CPU.lpi
done
