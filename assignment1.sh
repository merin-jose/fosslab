#!/bin/bash
#converting pdf file to text file

$(pdftotext -layout result_MDL.pdf result_MDL.txt)

#to  select out cs results from ktu resuktl
grep MDL16CS result_MDL.txt > temp.txt


#to selct out only cs4b students
join -1 6 -2 1 c4b.txt temp.txt > temp1.txt

#creating a file grades.txt
rm grades.txt
touch grades.txt

#cutting out  only the grades
for i in {2..9}
do 
 paste grades.txt <(cut -d'(' -f$i temp1.txt | cut -d')' -f1) > temp2.txt
 mv temp2.txt grades.txt
done

#replacing grades by grade points
sed -i -e 's/O/10/g' -e 's/A+/9/g' -e 's/A/8/g' -e 's/B+/7/g' -e 's/B/6/g' -e 's/C/5/g' -e 's/P/4/g' -e 's/F/0/g' grades.txt



s=0
#for i in $(< grades.txt)
#do
#grep 1 grades.txt > credits.txt

    #for  j in {2..9}
    #do
     #case $j in
        # 2) let " sum += (cut -d' ' -f$j credits.txt | cut -d' ' -f1) * 4 ";;
         #3) let " sum += (cut -d' ' -f$j credits.txt | cut -d' ' -f1) * 4 ";;
        # 4) let " sum += (cut -d' ' -f$j credits.txt | cut -d' ' -f1) * 3 ";;
        # 5) let " sum += (cut -d' ' -f$j credits.txt | cut -d' ' -f1) * 3 ";;
        # 6) let " sum += (cut -d' ' -f$j credits.txt | cut -d' ' -f1) * 3 ";;
         #7) let " sum += (cut -d' ' -f$j credits.txt | cut -d' ' -f1) * 3 ";;
         #8) let " sum += (cut -d' ' -f$j credits.txt | cut -d' ' -f1) * 1 ";;   
         #9) let " sum += (cut -d' ' -f$j credits.txt | cut -d' ' -f1) * 1 ";; 
      #esac
    #done
#echo let "sum/24"

#a=$(cut -d' ' -f2 grades.txt | cut -d' ' -f1)
#echo $a
