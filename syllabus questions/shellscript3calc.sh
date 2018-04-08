clear
sum=0
i="y"
echo "enter first no:"
read a
echo "enter second no:"
read b
while [ $i = "y" ]
do
    echo "1.addition"
    echo "2.subtraction"
    echo "3.multiplication"
    echo "4.division"
    echo "5.modulus"
    echo "enter choice"
    read ch
    case $ch in
               1) sum=`expr $a + $b`
                echo "sum:"$sum;;
               2) diff=`expr $a - $b`
                echo "difference:"$diff;;
               3) mult=`expr $a \* $b`
                echo "multiplication:"$mult;;
               4) div=`expr $a / $b`
                echo "quotient:"$div;;
               5) mod=`expr $a % $b`
                 echo "remainder:"$mod;;
               *) echo "invalid case";;
    esac
    echo "do you want to continue(y/n)"
    read i
    if [ $i != "y" ]
    then
        exit
    fi
done
