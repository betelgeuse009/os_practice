#!/bin/bash

while read x y z; do
  let f=3*x*x+4*y+5*z
  echo -n "$f"
done <$1
exit 0
