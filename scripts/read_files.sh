#!/bin/bash
# Read files word by word
for i in $(cat $1); do
	echo "WORD: $i"
done

# line by line
while read i; do
	echo "LINE: $i"
done < $1

# char by char

while read -n 1 i; do
	echo "CHAR $i"
done < $1
