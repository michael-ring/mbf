#!/bin/sh
IGNOREDEVICES="templates "
curdir=$(pwd)
find . -name "*lpi" | while read lpi ; do
    echo $IGNOREDEVICES | grep $(basename $lpi | sed -e "s,^.*-,," -e "s,.lpi,,g")
    if [ "$?" != 0 ]; then  
      cd $curdir/$(dirname $lpi)
      lazbuild --build-all $(basename $lpi)
      if [ "$?" != "0" ]; then
        exit
      fi
    fi
done
