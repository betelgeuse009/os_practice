#!/bin/bash
# Write a bash script that
# A string at a time, prepending the string number
# Takes a filename from command line
# Displays the file content
# A line at a time, prepending the line number
n=1
while read line; do
  echo "$n $line"
  let n=n+1
done <$1
#now string by string
echo ""
n=1
for str in $(cat $1); do
  echo "$n $str"
  let n=n+1
done
