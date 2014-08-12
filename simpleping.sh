#!/bin/bash
log=ping.log
prefix=192.168.1
i=1

while [ "$i" -lt "8" ]
do
    echo "Pinging ${prefix}.$i"
    ping ${prefix}.$i > /tmp/ping.$i 2>&1 &
    sleep 2
    kill -9 $!
    grep "^64 bytes from" /tmp/ping.$i
    if [ "$?" -eq "0" ]; then
        echo "${prefix}.$i is alive" | tee -a $log
        else
        echo "${prefix}.$i is dead" | tee -a $log
        fi
    rm -f /tmp/ping.$i
    i=`expr $i + 1`
    done
