#!/bin/bash

version=${1:-"2.4,3"}
download=download.vendor.com
url=http://${download}/product/v${version}

echo "Retrieving release notes..."
wget -nd ${url}/relnotes.txt

echo "Got release notes:"
echo "*** START OF RELEASE NOTES"
cat relnotes.txt
echo "*** END OF RELEASE NOTES"

grep "^echo " relnotes.txt | tr -s "/" | while read ignoreecho params
do
    value=`echo $params | cut -d">" -f1`
    proc=`echo $params | cut -d">" -f2 | cut -d"/" -f3-`
    sysctl=`echo $proc | tr '[A-Z]' [a-z] | tr '/' '.'`
    echo "Setting $sysctl to $values..."
    echo $sysctl=$value | tee -a /etc/sysctl.conf
    done
echo "Loading new kernel values."
sysctl -p > /dev/null 2>&1
