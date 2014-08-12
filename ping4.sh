#!/bin/bash
log=ping.log
prefix=192.168.1

for i in `seq 1 254`
do
    ping -c1 -w1 ${prefix}.$i && echo "${prefix}.$i is alive" | tee -a $log || \
        echo "$prefix}.$i is dead" | tee -a $log &
    done
