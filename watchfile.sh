#!/bin/bash
gap=10
logfile=$1

len=`wc -l $logfile | awk '{print $1}'`
echo "Current len is $len lines"
while :
do
    if [ -N $1 ]; then
        echo "`date` - enteries in $logfile"
        newline=`wc -l $logfile|awk '{print $1}'`
        newlines=`expr $newline - $len`
        tail -$newlines $logfile
        len=$newlines
        fi
    sleep $gap
    done
