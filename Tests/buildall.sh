#!/bin/sh
curdir=$(pwd)
if [ -z "$1" ]; then
  exclusivetest=.
else
  exclusivetest=$1
fi
find . -name "*lpi" | grep $exclusivetest | while read lpi ; do
    echo $IGNOREDEVICES | grep $(basename $lpi | sed -e "s,^.*-,," -e "s,.lpi,,g")
    if [ "$?" != 0 ]; then  
      cd $curdir/$(dirname $lpi)
      lazbuild --build-all $(basename $lpi)
      if [ "$?" != "0" ]; then
        exit
      fi
    fi
done
