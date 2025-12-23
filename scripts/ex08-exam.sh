#!/bin/bash
# Write a bash script able to compute the sum of lengths of the words appearing on the diagonal of a square
# matrix that contains just strings.
# The square matrix is stored in a text file, specified as a command line argument to the script. Check that such
# an argument is correctly passed to the script.
# Example
# word11 word12 word13 word14
# word21 word22 word23 word24
# word31 word32 word33 word34
# word41 word42 word43 word44
# Result: 24

fn=$1

if [ $# -ne 2 ]; then
  echo "ERROR wrong number of arguments run as $0 <file_name>"
  exit 1
fi

if [ ! -f "$fn" ]; then
  echo "ERROR run as $0 <file_name>"
  exit 1
fi

i=0
j=0
tot=0
while read line; do
  for word in $line; do
    if [ $i -eq $j ]; then
      wsize=$(echo -n "$word" | wc -c)
      tot=$((tot + wsize))
    fi
    j=$((j++))
  done
  j=$((0))
  i=$((i++))
done <"$fn"
