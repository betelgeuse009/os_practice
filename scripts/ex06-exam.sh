#!/bin/bash
#
# Exam: Operating Systems – Italian Course
# Date: 2013/01/28
#
# Exercise:
#
# Write a BASH script that:
# - Takes as input (from the command line) the name of a text file.
#
# The script must:
# 1) Create a copy of the file with the same name plus the extension ".xyx".
#    (Example: file.txt -> file.txt.xyx)
#
# 2) Modify the ORIGINAL file by:
#    a) Adding, at the beginning of each line:
#       - the number of words in that line, and
#       - the total number of lines in the file.
#       (So each line becomes something like: "<words_in_line> <total_lines> <original_line>")
#    b) Sorting the lines according to their number of words.
#
# Note:
# - You may use the `basename` command:
#   basename NAME [SUFFIX]
#   It prints NAME without leading directory components, and can remove a trailing SUFFIX (e.g., extension).
#
# Examples:
#   name=$(basename /home/user/current/file.txt)
#   echo $name        # -> file.txt
#   name=$(basename /home/user/current/file.txt ".txt")
#   echo $name        # -> file

echo -n "Enter the name of the file"
read path
fn=$(basename "$path")
tmp=$(mktemp)

cp $path "$path.xyx"
tot_line=$(wc -l <"$path")

while read line; do
  words_in_line=$(echo "$line" | wc -w)
  echo -n "$words_in_line $tot_line $line"
done <"$path" >"$tmp"
cat "$tmp" | sort -k 1 -n >"$path" #-k is to sort by first column

rm "$tmp"
