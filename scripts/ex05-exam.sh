#!/bin/bash
#
# Exam: Operating Systems – Italian Course
# Date: 2018/02/22
#
# Exercise:
#
# A script receives the following parameters:
# - fn : the name of a file
# - n1, n2, n3 : three integers
#
# The file `fn` contains one filesystem path per line.
#
# The script must:
# 1) Verify that the 4 parameters are correct:
#    - n1, n2, n3 must be positive integers
#    - n1 <= n2
#
# 2) For each line (row) in the file `fn`:
#    - Check that the string is a path to a regular file
#
# 3) Depending on the size of that file:
#    - If size < n1 bytes: delete the file
#    - If n1 <= size <= n2 bytes: ignore the file (do nothing)
#    - If size > n2 bytes: "compress" the file
#
# "Compress" means:
# - Create a new file with the same path plus an extra extension
#   (example: original.txt -> original.txt.compressed)
# - Fill the new file by copying only 1 string every n3 strings from
#   the original file.
#   Keep strings at positions: 0, 1*n3, 2*n3, 3*n3, ...
#
# Notes:
# - Strings are separated by spaces and/or newline characters.

if [ $# -ne 4 ]; then
  echo "Run as $0 <file> <int1> <int2> <int3>"
  exit 1
fi

if [ ! -f $1 ]; then
  echo "$1 is not a file"
  exit 1
fi

if [ $2 -lt 0 ] || [ $3 -lt 0 ] || [ $4 -lt 0 ]; then
  echo "You  passed negative integer"
  exit 1
fi

if [ $2 -gt $3 ]; then
  echo "n1 should be <=n2"
  exit 1
fi
fn=$1
n1=$2
n2=$3
n3=$4

while read file_in_line; do
  if [ ! -f "$file_in_line" ]; then
    echo "$file_in_line is not a file"
    continue
  fi

  file_size=$(wc -c <"$file_in_line")
  if [ "$file_size" -lt "$n1" ]; then
    echo "Removed $file_in_line"
    rm -f "$file_in_line"
    continue
  elif [ "$file_size" -ge "$n1" ] && [ "$file_size" -le "$n2" ]; then
    echo "Ignored"
    continue
  else
    touch "$file_in_line.compressed"
    i=1
    for word in $(cat "$file_in_line"); do
      ((i--))
      if [ $i -eq 0 ]; then
        echo "$word" >>"$file_in_line.compressed"
        i=$n3
      fi
    done
  fi

done <"$fn"
