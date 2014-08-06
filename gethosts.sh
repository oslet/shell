#!/bin/bash

hosts=hosts
ethers=ethers
IPS=ips

set -o pipefail
for host in `cat $hosts`
do
    echo -en "${host}..."
    getent hosts $host | cut -d" " -f1 >> $IPS || echo "missing" >> $IPS
    grep -w "${host}" ether | cut -d" " -f2 >> $ethers || echo "missing" >> $ethers
    done
echo
paste $hosts $IPS $ethers
