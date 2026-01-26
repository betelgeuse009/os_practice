#!/bin/bash
# Write a BASH script that receives the name of a directory and a prefix as parameters. It should concatenate all
# the text files (with the extension '.txt') present in the directory that have the prefix passed from the command line
# in their filename (before the first underscore '_') into a single file, whose name is the prefix followed by
# '_merged.txt'.
# example: prefix = hello
# matches with files:
# ● hello_hello.txt
# ● hello_bye_bye.txt
# does NOT match with files:
# ● bye_hello.txt
# ● _hello.txt
# ● hellobye_bye.txt

if [ $# -ne 2 ]; then
  echo "Wrong number of args <./script> <prefix>"
  exit 1
fi
directory="$1"
prefix="$2"

if [ ! -d $directory ]; then
  echo "directory does not exist"
  exit 1
fi

files=$(find "$directory" -maxdepth 1 -type f -name "${prefix}_*.txt")

for file in $files; do
  cat "$file" >>"{$prefix}_merged.txt"
done
