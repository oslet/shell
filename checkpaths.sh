#!/bin/sh
dev1=${1:-sdac}
dev2=${2:-sdu}
dev3=${2:-sdcc}
dev4=${2:-sddg}

expected=10

cd /var/tmp
rm -f dd.pid

for dev in $dev1 $dev2 $dev3 $dev4
do
    dd if=/dev/$dev of=/dev/null bs=8192 count=10000 2>&1 | grep -w copied >> dd.$dev &
    echo $! >> dd.pid
    done

sleep $expected
children=2
while [ "$children" -gt "0" ]
do
    echo "`date`: I have $children children"
    sleep 5
    children=`ps hfp $(cat dd.pid) | wc -l`
    done

mailout=0
for seconds in `awk '{print $6}' dd.$dev1 dd.$dev2 dd.$dev3 dd.$dev4 | cut -d"." -f1`
do
    if [ "$seconds" -gt "$expected" ]; then
        mailout=1
        fi
    done

if [ "$mailout" -eq "1" ]; then
    for dev in $dev1 $dev2 $dev3 $dev4
    do
        msg=`cat dd.$dev`
        logger -t storagespeed "Path Comparison: $dev :$msg"
        done

    echo "It should take no more than $expected seconds to read 8Gb from a device." "It took:\n`grep . dd.$dev1 dd.$dev2 dd.$dev3 dd.$dev4`" | mailx -s "Slow I/O on `uname -n`" storage@example.com
    fi
