#!/bin/bash
interval=1
if [ -z $1 ]; then
    echo "usage: $0 [network interface]"
echo
echo "e.g. $0  eth0"
echo
exit
fi
IF=$1
while true
do
    tx1=`cat /sys/class/net/$1/statistics/tx_packets`
    rx1=`cat /sys/class/net/$1/statistics/rx_packets`
    sleep $interval
    tx2=`cat /sys/class/net/$1/statistics/tx_packets`
    rx2=`cat /sys/class/net/$1/statistics/rx_packets`
    ttx=`expr $tx2 - $tx1`
    rrx=`expr $rx2 - $rx1`
    echo "ttx: $ttx rrx: $rrx"
done