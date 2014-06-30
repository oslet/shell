#!/bin/bash

function trimline()
{
    maxlen=$((linelen - 3))
    if [ "${#1}" -le "${maxlen}" ]; then
        echo "$1"
        else
        echo "${1:0:${maxlen}} \\"
        trimline "${1:${maxlen}}"
        fi
    }
linelen=${1:-80}
while read myline
do
    trimline "$myline"
    done
