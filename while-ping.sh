#!/bin/bash
prefix=192.168.1
octet=1
while [ "$octet" -lt "1" ]; do
    echo -en "Pinging ${prefix}.${octet}..."
    ping -c1 -w1 ${prefix}.${octet} > /dev/null 2>&1
    if [ "$?" -eq 0 ]; then
        echo "OK"
        else
        echo "Failed"
        fi
    let octet=$octet+1
    done
