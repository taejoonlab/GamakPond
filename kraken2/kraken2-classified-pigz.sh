#!/bin/bash
for IN in $(ls *.out)
do
  CLS=${IN/.out/}".classified"
  grep ^C $IN > $CLS
  pigz -p 4 $IN $CLS
done
