#!/bin/bash
#
# The command `df` shows the disk space available on a filesystem.
#
# Example:
#   df /data/backup
#
# Sample output:
#   Filesystem     1K-blocks     Used   Available  Use%  Mounted on
#   /dev/sda7      41114992   5881472   33174616   16%   /data
#
# Notes:
# - Fields are separated by spaces
# - No other separator characters are used
# - Spaces do not appear inside any field
# - The 2nd, 3rd, and 4th fields represent:
#     * total space
#     * used space
#     * available space
#   of the filesystem containing /data/backup
#
# ------------------------------------------------------------
# Exam: Operating Systems – Italian Course
# Date: 2018/01/30
#
# Exercise:
#
# Write a script that:
# - Receives a source file path and a destination path as parameters
# - Checks that the parameters are passed correctly to the script
# - Copies the source file to the destination path in background
# - Periodically (every 1 second) analyzes the disk space occupied
#   on the destination filesystem
# - Displays on screen the percentage progress of the copy operation
#
# Hint:
# - The command `sleep n` can be used to pause execution for n seconds

if [ $# -lt 2 ]; then
  echo "ERROR run as $0 /path/to/source /path/to/destination "
  exit 1
elif [ $# -gt 2 ]; then
  echo "ERROR run as $0 /path/to/source /path/to/destination "
  exit 1
fi

if [ ! -f $1 ]; then
  echo "ERROR source is not a file"
  exit 1
fi
if [ ! -d $2 ]; then
  echo "ERROR destination is not a file"
  exit 1
fi

source=$1
dest=$2

sizeSource=$(ls -l $source | cut -d " " -f 5)
let sizeSource=sizeSource/1024 # in KB
 # tr -s for squeeze the possible extra spaces from df since its column aligned
startUsed=$(
  df $dest | tail -n 1 | \
    tr -s " " | \
    cut -d " " -f 3
)
cp $source $dest &

transferred=0
percentage=0

while [ "$transferred" -lt "$sizeSource" ]; do
  currentUsed=$(
  df $dest | tail -n 1 | \
    tr -s " " | \
  cut -d " " -f 3)
  let transferred="currentUsed-startUsed"
  let percentage="transferred*100/sizeSource"
  echo "Transferred percentage is $percentage"
  sleep 1
done

