#!/bin/bash
host=${1:-declan}
do
    ping -c3 -w4 $host > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
        echo "`date`: $host is up"
        else
        echo "`date`: $host is down"
fi
sleep 30
done
echo "Stopped testing $hsot as it has been removed from /tmp/hosts-to-ping.txt"
