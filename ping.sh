#!/bin/bash

uphosts=/var/log/uphosts.`date +%m%d%Y`
downhosts=/var/log/downhosts.`date +%m%d%Y`
prefix=192.168.1
for octet in `seq 1 254`
do
    echo -en  "Pinging ${prefix}.${octet}..."
    ping -c1 -w1 {$prefix}.${octet} > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
        echo " OK"
        echo "${prefix}.${octet}" >> ${uphosts}
        else
        echo " Failed"
        echo "${prefix}.{octet}" >> ${downhosts}
        fi
    done
