#!/bin/bash

#to implement a script that kills a process that uses more than specified valueof memory
#and to kill the process on  system start


while [ 1 ];
do
echo
echo checking for run-away process ...

CPU_USAGE=$(uptime | cut -d"," -f4 | cut -d":" -f2 | cut -d" " -f2 | sed -e "s/\.//g")
CPU_USAGE_THRESHOLD=800
PROCESS=$(ps aux r)
TOPPROCESS=$(ps -eo pid --eo pcpu -eo command | sort -k 2 -r | grep -v PID | head -n1)

if [ $CPU_USAGE -gt $CPU_USAGE_THRESHOLD] ; then
kill -9 $(ps -eo pid | sort -k 1 -r | grep -v PID | head -n 1) #original
kill -9 $(ps -eo pcpu | sort -k 1 -r | grep -v %CPU | head -n 1)
kill -9 $TOPPROCESS
echo system overloading!
echo Top-most process killed $TOPPROCESS
echo CPU USAGE is at $CPU_LOAD
else
fi
exit 0
sleep 1;
done
