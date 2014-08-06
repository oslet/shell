#!/bin/bash

logfile=/tmp/iso.md5

> $logfile
find /home/oslet/iso -type f -iname "*.iso" -print | while read filename
do
    echo "Checking md5sum of $filename"
    md5sum "$filename" | tee -a $logfile
    done
