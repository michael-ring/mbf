#!/bin/sh
#IGNOREDEVICES="stm32f107vc nucleof103rb nucleol432kc pic32mx150f128b nucleof072rb nucleof303k8"
IGNOREDEVICES="templates stm32f107vc nucleol432kc nucleof072rb nucleof303k8"
curdir=$(pwd)
find . -name "*lpi" | while read lpi ; do
    echo $IGNOREDEVICES | grep $(basename $lpi | sed -e "s,^.*-,," -e "s,.lpi,,g")
    if [ "$?" != 0 ]; then  
      cd $curdir/$(dirname $lpi)
      lazbuild $(basename $lpi)
      if [ "$?" != "0" ]; then
        exit
      fi
    fi
done
