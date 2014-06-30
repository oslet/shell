#!/bin/bash
gap=10
logfile=$1
len=`wc -l $logfile|awk '{print $1}'`
echo Current len is $len
while :
do
if [ -N $logfile ]; then
echo "`date` - entries in $logfile"
newline="`wc -l $logfile | awk '{print $1}'`"
newlines=`expr $newline - $len`
tail -$newlines $logfile
len=$newlines
fi
sleep $gap
done
