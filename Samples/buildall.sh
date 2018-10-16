#!/bin/sh
IGNOREDEVICES="templates "
curdir=$(pwd)
rm -f results 2>/dev/null
find . -name "*lpi" | while read lpi ; do
    echo $IGNOREDEVICES | grep $(basename $lpi | sed -e "s,^.*-,," -e "s,.lpi,,g") >/dev/null
    if [ "$?" != 0 ]; then  
      echo "Building $lpi"
      cd $curdir/$(dirname $lpi)
#      lazbuild --build-all $(basename $lpi) | grep -v Hint | grep -v Info | grep -v Note | grep -v Warning | grep -v TCodeToolManager.HandleException | grep -v Compiling | grep -v "Linking" | grep -v "Assembling"
       lazbuild --build-all $(basename $lpi) >../compile
      if [ "$?" != "0" ]; then
        echo "$(basename $lpi) failed" >>../results
        cat ../compile  | grep -e "lines compiled" -e Fatal -e overflowed >>../results
        echo "" >>../results
      fi
      cat ../compile  | grep -e "lines compiled" -e Fatal
      rm ../compile
      echo ""
    fi
done
echo ""
cat results 2>/dev/null
rm -f results 2>/dev/null
