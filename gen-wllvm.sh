#!/usr/bin/env bash

DBROOT=$RTOSExploration/bitcode-db/Raspberry-Pi
rm -rf $DBROOT && mkdir -p $DBROOT

for dir in $(find $PWD -exec test -f {}/Makefile \; -print -prune); do
  cd $dir
  #sed -i 's_Pi2: ARMGNU.*_Pi2: ARMGNU = ${RTOSExploration}/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi_' Makefile
  make clean
  #make Pi2 -j$(nproc) || echo Error in $dir
  DB=$DBROOT/$(basename $dir)
  genbc $DB -c "make Pi2 -j$(nproc)" || echo Error in $dir
done
