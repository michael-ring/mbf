#!/bin/sh
alias sudo=""
#FIXEDVERSION="-r 34337"
#FIXEDLAZVERSION="-r 53000"
if [ -z "$1" ]; then
  COMPILE="fpc-build "
else
  COMPILE="$* "
fi

cd fpc-build
echo "$COMPILE" | grep "fpc-build " >/dev/null
if [ "$?" == "0" ]; then
  echo "Building fpc-arm from trunk"
  echo ""
  svn update $FIXEDVERSION

  CROSSOPT="-O1 -gw2 -dDEBUG"

  SUBARCH=armv6m
#  make clean buildbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- || exit 1
#  make installbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- INSTALL_UNITDIR=/usr/local/lib/fpc/3.1.1/units/arm-embedded/$SUBARCH/rtl || exit 1
#  mv /usr/local/lib/fpc/3.1.1/ppcrossarm /usr/local/lib/fpc/3.1.1/ppcrossarm-$SUBARCH

  SUBARCH=armv7m
#  make clean buildbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- || exit 1
#  make installbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- INSTALL_UNITDIR=/usr/local/lib/fpc/3.1.1/units/arm-embedded/$SUBARCH/rtl || exit 1
#  mv /usr/local/lib/fpc/3.1.1/ppcrossarm /usr/local/lib/fpc/3.1.1/ppcrossarm-$SUBARCH

  SUBARCH=armv7em
  make clean buildbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- || exit 1
#  make installbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=$SUBARCH CROSSOPT="$CROSSOPT" BINUTILSPREFIX=arm-none-eabi- INSTALL_UNITDIR=/usr/local/lib/fpc/3.1.1/units/arm-embedded/$SUBARCH/rtl || exit 1
#  cp /usr/local/lib/fpc/3.1.1/ppcrossarm /usr/local/lib/fpc/3.1.1/ppcrossarm-$SUBARCH
#  ln -sf /usr/local/lib/fpc/3.1.1/ppcrossarm /usr/local/bin/ppcarm
fi
