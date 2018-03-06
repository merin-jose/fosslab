#!/bin/bash
#converting pdf file to text file

$(pdftotext -layout result_MDL.pdf result_MDL.txt)
$(pdftotext -layout s2.pdf s2.txt)
#to  select out cs results from ktu resukts s1

grep -A 361 "MDL16CS001" result_MDL.txt >> temp.txt
tr -d " \n\t\r\014" <temp.txt>t1.txt
cp t1.txt temp.txt
rm t1.txt
sed 's/MDL/\nMDL/g' temp.txt >> t1.txt
cp t1.txt temp.txt
rm t1.txt

grep -A 361 "MDL16CS001" s2.txt >> temp3.txt
tr -d " \n\t\r\014" <temp3.txt>t2.txt
cp t2.txt temp3.txt
rm t2.txt
sed 's/MDL/\nMDL/g' temp3.txt >> t2.txt
cp t2.txt temp3.txt
rm t2.txt



#creating a file grades.txt grades2.txt
#rm grades.txt
touch grades.txt

#rm grades2.txt
touch grades2.txt

#cutting out  only the grades
for i in {2..10}
do 
 paste grades.txt <(cut -d'(' -f$i temp.txt | cut -d')' -f1) > temp1.txt
 mv temp1.txt grades.txt
done

for i in {2..10}
do 
 paste grades2.txt <(cut -d'(' -f$i temp3.txt | cut -d')' -f1) > temp4.txt
 mv temp4.txt grades2.txt
done

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

join  t1.txt  t2.txt > SGPA1.txt

rm temp.txt t1.txt t2.txt s1sgpa.txt grades.txt

credits2=(4 4 3 1 1 4 3 3 1)
while read -r line
  do
  sum=0
  sgpa=0
  for i in {2..10}
   do
   case "$(echo $line | cut -d' ' -f$i )" in
          "O") sum=$(bc -l <<< "(10 * ${credits2[i-2]})");;
 
          "A+") sum=$(bc -l <<< "(9 * ${credits2[i-2]})");;

          "A") sum=$(bc -l <<< "(8.5 * ${credits2[i-2]})");;

           "B+") sum=$(bc -l <<< "(8 * ${credits2[i-2]})");;

           "B") sum=$(bc -l <<< "(7 * ${credits2[i-2]})");;

           "C") sum=$(bc -l <<< "(6 * ${credits2[i-2]})");;

            "P") sum=$(bc -l <<< "(5 * ${credits2[i-2]})");;

           *) sum=$(bc -l <<< "(0 * ${credits2[i-2]})");;

    esac
    sgpa=$(bc -l <<<  "($sgpa + $sum)")

done
sgpa=$(bc <<< "scale = 2; ($sgpa / 24)")
echo "$sgpa" >> s2sgpa.txt
done<grades2.txt
cut -f 4 c4b.txt > t3.txt
paste <(cut -c 1-10 < temp3.txt) s2sgpa.txt > t4.txt
join  t3.txt  t4.txt > SGPA2.txt

rm t4.txt t3.txt temp3.txt s2sgpa.txt grades2.txt

join  SGPA1.txt SGPA2.txt > SGPA.txt

while read -r line
do
 bc -l <<< "((($( echo $line | cut -d' ' -f2) * 23) + ($( echo $line | cut -d' ' -f3) * 24)) /47)" >> CGPA.txt
done<SGPA.txt 

paste <(cut  -d' ' -f1 SGPA.txt) CGPA.txt  > temp4.txt
mv temp4.txt CGPA.txt

