#!/bin/bash

echo "this is a test of test file" > demo1.txt
sed -i 's/test/trial/g' demo1.txt
cat demo1.txt
rm demo1.txt

echo "the brown fox jumps over the lazy dog" > demo2.txt
sed -e 's/fox/elephant/g' -e  's/dog/cat/g' demo2.txt
cat  demo2.txt
rm demo2.txt

