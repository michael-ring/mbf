#!/bin/sh
for file in * ; do
  if [ -d $file -a $file != "templates" ]; then
    ./genlpi.sh $file
  fi
done

