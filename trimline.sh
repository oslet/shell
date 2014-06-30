#!/bin/bash

function trimline()
{
    maxlen=$((linelen - 3)) # allow space for " \ " at end of line
    if [ "${#1}" -le "${maxlen}" ]; then
        echo "$1"
        else
        echo "${1:0:${maxlen}} \\"
        trimline "${1:${maxlen}}"
        fi
    }
linelen=${1:-80} #default to 80 columns
while read myline
do
    trimline "$myline"
    done
