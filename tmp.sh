#!/bin/bash
interval=1
if [ -z $1 ]; then
    echo usage: $0 [network interface]
    echo
    echo e.g. $0 eth0
    echo
    exit
fi
IF=$1
while true
do
    rx1=`cat /sys/class/net/$1/statistics/rx_packets`
    tx1=`cat /sys/class/net/$1/statistics/tx_packets`
    sleep $interval
    rx2=`cat /sys/class/net/$1/statistics/rx_packets`
    tx2=`cat /sys/class/net/$1/statistics/tx_packets`
    rxbps=`expr $rx2 - $rx1`
    txbps=`expr $tx2 - $tx1`
    echo "rxbps: $rxbps txbps: $txbps"
done