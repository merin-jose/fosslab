clear
sum=0
echo "enter first no:"
read a;
echo "enter second no:"
read b;
i="y"
while [ $i = "y" ]
do
    echo "1.addition"
    read ch
    case $ch in
               1)sum =`expr $a + $b`
                echo "sum: $sum"
               *)echo "invalid case"
    esac
    echo "do you want to continue(y/n)"
    read i
    if($i!= "y")
    then 
        exit
    fi
done
