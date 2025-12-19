#!/bin/bash

file="tmp"

while read x y; do
  echo "$y $x"
done <$1 >$file

mv -f $file $1

exit 0
