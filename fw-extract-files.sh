#!/bin/sh
FW=~/chuwi_v99/oemfirmware/system
BASE=../../../vendor/chuwi_v99/rk30sdk/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  cp $FW/$FILE $BASE/$FILE
done

./setup-makefiles.sh