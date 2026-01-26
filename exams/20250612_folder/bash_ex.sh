#!/bin/bash
# The so-called ELF (Executable and Linkable Format) file is the standard binary format to store executable
# programs, shared libraries, and object files on Linux and other Unix-like systems. The BASH command:
# readelf -s name.elf
# reads an ELF file name.elf, and generates the following output on standard output:
# Symbol table '.sym_tab' contains 1397 entries:
# Symbol table '.sym_tab' contains 1397 entries:
# Num: Value Size Type Bind Vis Ndx Name
# 0:   12345 2 NOTYPE LOCAL DEFAULT 1 .data
# 1:   34567 4 NOTYPE LOCAL DEFAULT 1 .code
# 2:   40000 512 NOTYPE LOCAL DEFAULT 1 .bss
# ... Write a BASH script that receives four parameters on the command line: a path to an ELF file, a path to an
# # output file, and two integers S and L. The script must read the ELF file with the command readelf (see above)
# and manipulate the resulting output to save into the output file all symbols that have an address (i.e., the record
# Value) greater than S and its end address (sum of columns Value + Size) less than S + L:
#   ● Value >= S;
#   ● Value + Size <= S + L.
# The output file format must have lines sorted by Address and formatted in this way:
# Name, Address/Value, Size;
# If no symbols are present in the ELF file within the range [S, S+L], the script must display an error message on
# the standard error without creating the output file.

if [ $# -ne 4 ]; then
  echo "Wrong number of args"
  exit 1
fi

path_elf="$1"
path_o="$2"
let s="$3"
let l="$4"

if [ ! -f $path_elf ]; then
  echo "No elf found"
  exit 1
fi

tmp=$(mktemp)
readelf -s "$path_elf" | tr -s " " | tail -n +4 | while read line; do
  let value=$(echo "$line" | tr -s " " | cut -d " " -f 2)
  let size=$(echo "$line" | tr -s " " | cut -d " " -f 3)

  if [ $value -ge $s ] && [ $((size + value)) -le $((s + l)) ]; then
    echo "$line" | tr -s " " | cut -d " " -f 8, 2, 3 >>"$tmp"
  fi
done

if [ $(wc -l <"$tmp") -le 0 ]; then
  echo "Zero lines hold the condition"
  exit 1
fi

cat "$tmp" | sort -k 2 -n >"$path_o"
rm "$tmp"
