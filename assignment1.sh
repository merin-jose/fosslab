#!/bin/bash
#converting pdf file to text file

$(pdftotext -layout result_MDL.pdf result_MDL.txt)

#to  select out cs results from ktu resuktl
grep MDL16CS result_MDL.txt > temp1.txt
#tr -d '\014' <result_MDL.txt> temp.txt
#mv temp.txt result_MDL.txt
#paste <(grep MDL16CS result_MDL.txt) <(grep CS110\( result_MDL.txt) | tr -d ' ' > temp.txt

grep -A 361 "MDL16CS001" result_MDL.txt >> temp.txt
tr -d " \n\t\r\014" <temp.txt>t1.txt
cp t1.txt temp.txt
rm t1.txt
sed 's/MDL/\nMDL/g' temp.txt >> t1.txt
cp t1.txt temp.txt
rm t1.txt

#to selct out only cs4b students
#join -1 6 -2 1 c4b.txt temp1.txt > temp2.txt
#rm temp1.txt

#creating a file grades.txt
rm grades.txt
touch grades.txt

#cutting out  only the grades
for i in {2..10}
do 
 paste grades.txt <(cut -d'(' -f$i temp.txt | cut -d')' -f1) > temp1.txt
 mv temp1.txt grades.txt
done

#replacing grades by grade points
#sed -i -e 's/O/10/g' -e 's/A+/9/g' -e 's/A/8.5/g' -e 's/B+/8/g' -e 's/B/7/g' -e 's/C/6/g' -e 's/P/5/g' -e 's/F/0/g' -e 's/FE/0/g/' -e 's/I/0/g/' grades.txt

#placing the allotted credits in order of subjects in an array
credits=(4 4 3 3 3 3 1 1 1)

#reading line by line from grades.txt
while read -r line
  do
  sum=0
  sgpa=0
  for i in {2..10}
   do
    case "$(echo $line | cut -d' ' -f$i )" in
         "O") sum=$(bc -l <<< "(10 * ${credits[i-2]})");;
 
          "A+") sum=$(bc -l <<< "(9 * ${credits[i-2]})");;

          "A") sum=$(bc -l <<< "(8.5 * ${credits[i-2]})");;

         "B+") sum=$(bc -l <<< "(8 * ${credits[i-2]})");;

          "B") sum=$(bc -l <<< "(7 * ${credits[i-2]})");;

          "C") sum=$(bc -l <<< "(6 * ${credits[i-2]})");;

          "P") sum=$(bc -l <<< "(5 * ${credits[i-2]})");;

          *) sum=$(bc -l <<< "(0 * ${credits[i-2]})");;

    esac
   sgpa=$(bc -l <<<  "($sgpa + $sum)")

done
sgpa=$(bc <<< "scale = 2; ($sgpa / 23)")
echo "$sgpa" >> s1sgpa.txt
done<grades.txt
cut -f 4 c4b.txt > t1.txt
paste <(cut -c 1-10 < temp.txt) s1sgpa.txt > t2.txt
#join <(sort t2.txt) <(sort t1.txt) > SGPA1.txt
join  t1.txt  t2.txt > SGPA1.txt

rm temp.txt t1.txt t2.txt s1sgpa.txt

