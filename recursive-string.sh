#!/bin/bash
log=/tmp/factorial-log.txt
> $log

factorial()
{
    echo "`date`: Called with $1" >> $log
    sleep 1
    if [ "$1" -gt "1" ]; then
        previous=`expr $1 - 1`
        parent=`factorial $previous`
        result=`expr $1 \* $parent`
        echo "`date`: Passed $1 - the factorial of $previous is ${parent}. " "$1 * $parent is ${result}." >> $log
        echo "`date`: Sleeping for 2 seconds." >> $log
        sleep 2
        echo $result
        else
        echo "`date`: Passed $1 - returning 1." >> $log
        echo "`date`: Sleeping for 5seconds." >> $log
        sleep 5
        echo 1
        fi
}
read -p "Enter a number: " x
echo "Started at `date`"
factorial $x
echo "Here is my working:"
cat $log
rm -f $log
echo "Finished at `date`"
