#!/bin/bash

#text processing using awk

echo "hello world.
welcome to linux
hi world" > demo.txt
 
cat demo.txt

#to print out words starting with h
echo  "line starting with h"
awk ' /h/' demo.txt > temp.txt
cat temp.txt
rm temp.txt


#to print first field of the file
echo " first field of the txt file"
awk '{print $1}' demo.txt

