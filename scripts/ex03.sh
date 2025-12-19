# #!/bin/bash
# #Write a bash script that
#  Takes a filename from command line
#  Reads a sequence of integer number from the file
#  Each number represents a histogram bin value
#  Displays a horizontal histogram using ’*’
#  Example
# ● 1 *
# ● 3 ***
# ● 5 *****
# ● 4 ****
# ● 2 **
for num_str in $(cat $1); do
  let n=$num_str
  i=0
  echo -n "$n "
  while [ $i -lt $n ]; do
    echo -n "*"
    let i=i+1
  done
  echo ""
done
