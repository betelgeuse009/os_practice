#!/bin/bash
# Given a file named "file.txt" containing some words (i.e., sequences of alphabetic characters separated by
# spaces, even on multiple lines) with content similar to the following:
# one two three
# four five six
# seven
# Implement a bash script that prints the word with longer length.
# Given the previous example, the script must print in output the word "three" or the word "seven", because both
# have 5 characters

fn="file.txt"
max=$((-1))
longest_words=""
for word in $(cat "$fn"); do
  wsize=$(echo -n "$word" | wc -c)
  if [ "$wsize" -gt "$max" ]; then
    max=$((wsize))
    longest_words="$word"
  elif [ "$wsize" -eq "$max" ]; then
    longest_words="$longest_words $word"
  fi
done
echo "$longest_words"
