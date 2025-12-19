#!/bin/bash

if [ $# -lt 2 ]; then
  echo -n "Values: "
  read n1 n2
else
  n1=$1
  n2=$2
fi

n=0
r=0
while [ $r -lt $n1 ]; do
  c=0
  while [ $c -lt $n2 ]; do
    echo -n "$n"
    let n=n+1
    let c=c+1
  done

  let r=r+1
  echo
done
exit 0
