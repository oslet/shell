#!/bin/bash

required=${1:-2131042}
preferred=${2:-/var}
available=`df -k /var/ | awk '{print $4}' | tail -1`
if [ "$available" -gt "$required" ]; then
    echo "good news. There is sufficient space in ${preferred}:"
    df -h $preferred
    echo
    echo "Looking in other filesystem..."
    fs=`mktemp`
    df -k -x nfs | sort -k4 -n | awk '{print $4,$6}' | grep -v "Available" | while read available filesystem
    do
        if [ "$available" -gt "$required" ]; then
            echo "Good news: $filesystem has $available Kb" | tee $fs
            fi
        done
    if [ ! -s $fs ]; then
        echo "No filesystem were found with sufficient free space."
        exit 1
        fi
    rm -f $fs
    fi
