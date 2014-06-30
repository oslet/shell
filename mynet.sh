#!/bin/bash
for host in `grep "^127\.0\.0\." /etc/hosts | awk '{print $2}'`
do
    ping -c1 -w1 $host > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
        echo "$host is up"
        else
        echo "$hsot is down"
        fi
    done
