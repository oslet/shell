#!/bin/bash
tempfile=`mktemp`
echo "Temporay file is ${tempfile}."
logfile=/tmp/libraries.txt
[ -f $logfile ] && rm -f $logfile

trap cleanup 1 2 3 6 9

function cleanup
{
    echo "Caught signal - tidying up..."
    rm -f ${tempfile}
    echo "Done, Exiting."
}

find $1 -type f -print | while read filename
do
    ldd ${filename} > ${tempfile}
    if [ "$?" -eq "0" ]; then
        let total=$total+1
        echo "File $filename uses libraries:" >> $logfile
        cat $tempfile >> $logfile
        echo >> $logfile
        fi
    done
echo "Found `grep -c "^File " $logfile` files in $1 linked to libraries."
echo "Results in ${logfile}."
