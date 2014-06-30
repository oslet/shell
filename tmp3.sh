#!/bin/bash
interval=1
if [ -z $1 ]; then
    echo "usage: $0 [network interface]"
    echo
    echo "e.g. $0 eth0"
    echo
    exit
    fi
IF=$1
while true
do
    r1=`cat /sys/class/net/$1/statistics/rx_packets`
    t1=`cat /sys/class/net/$1/statistics/tx_packets`
    sleep $interval
    r2=`cat /sys/class/net/$1/statistics/rx_packets`
    t2=`cat /sys/class/net/$1/statistics/tx_packets`
    rbps=`expr $r2 - $r1`
    kbps=`expr $t2 - $t1`
    echo "RBPS $1:$rbps KBPS $1:$kbps"
done
