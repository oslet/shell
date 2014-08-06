#!/bin/bash

logfile=/tmp/log.txt

function showfile
{
    if [ -f "${1}" ]; then
        ls -l "${1}"
        echo "--- the contents are:"
        cat "${1}"
        echo "--- end of file."
        else
        echo "The file doest not currently exist."
        fi
    }

echo "Testing $logfile for the first time."
showfile $logfile

echo "Appending to $logfile"
date >> $logfile

echo "Testing $logfile for the second time."
showfile $logfile

sleep 10

echo "Appending to $logfile again."
date >> $logfile

echo "Appending $logfile for the third and final time."
showfile $logfile
