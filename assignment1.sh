#!/bin/bash
#converting pdf file to text file

$(pdftotext -layout result_MDL.pdf result_MDL.txt)

#to  select out cs results from ktu resuktl
grep MDL16CS result_MDL.txt > temp.txt

join -1 6 -2 1 c4b.txt temp.txt > temp1.txt
rm grades.txt
touch grades.txt
for i in {2..9}
do 
 paste grades.txt <(cut -d'(' -f$i temp1.txt | cut -d')' -f1) > temp2.txt
 mv temp2.txt grades.txt
done


