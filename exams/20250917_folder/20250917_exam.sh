#!/bin/bash
# Create a bash script that receives a text file as its only argument. The script must:
# ● make a copy of the file with the same name but with the extension xyx
# ● modify the original file as follows:
#
# ○ add the number of words in the line and the total number of lines in the file at the beginning of
# each line
# ○ sort the lines in ascending order based on the number of words.

if [ $# -ne 1 ]; then
  echo "Error not proper arg number"
  exit 1
fi

fn=$1

tmp=$(mktemp)
if [ ! -f $fn ]; then
  echo "Error no file found!"
  exit 1
fi
cp $fn "$fn.xyx"
tot_line_n=$(wc -l <$fn)

while read line; do
  words_in_line=$(echo "$line" | wc -w)
  echo "$words_in_line $tot_line_n $line"
done <"$fn" >"$tmp"
cat "$tmp" | sort -k 1 -n >"$fn"
rm "$tmp"

