#1/bin/bash

while :
do
    cat /proc/meminfo > /tmp/mem.`date +%Y%m%d.%H%M%S`
    sleep 1
    done
