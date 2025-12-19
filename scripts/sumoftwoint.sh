#!/bin/bash
# sum of 2 integers

echo -n "Enter the first integer "
read n1

echo -n "Enter the second integer "
read n2

let s=n1+n2
let p=n1*n2

echo "Sum: $s"
echo "Product $p"

exit 0
