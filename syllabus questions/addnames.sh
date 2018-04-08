clear
if [[ "$1" = "" || "$2" = "" ]]
then
    echo "error,needed arguments are missing"
    exit
fi
if [ "$3" != "" ]
then
    echo "error,no of arguments are greater than required"
    exit
fi
ulist=$1
username=$2
if [ ! -f "$ulist" ]
then 
    echo "file not found"
    exit
fi
result=$(grep $username $ulist)
if [ "$result" != "" ]
then
    echo "username already exists"
   exit
else
   echo "username doesnt exists,adding name to end of file"
   echo "$username" >> $ulist
   exit
fi
