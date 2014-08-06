#!/bin/bash

lastrun=/var/run/web.lastrun
webroot=/var/www
# be verbose if asked.
start_time=`date`

function reindex
{
    # Do whatever magic is required to add this new/updateed
    # file to the database.
    add_to_database "$@"
}

if [ ! -f "$lastrun" ]; then
    echo "Error: $lastrun not found. Will reindex everything."
    # index from the epoch...
    touch -d "1 Jan 1970" $lastrun
    if [ "$?" -ne "0" ]; then
        echo "Error: Cannot update $lastrun"
        exit 1
        fi
    fi

cd $webroot
find . -type f -newer $lastrun -print | while read filename
do
    reindex "$filename"
    done
echo "Run complete at `date`."
echo "Subsequent runs will pick up only files updated since this reindexing"
echo "which was started at $start_time"
touch -d "$start_time" $lastrun
if [ "$?" -ne "0" ]; then
    echo "Error: Cannot update $lastrun"
    exit 1
    fi
ls -ld $lastrun
