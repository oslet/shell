#!/bin/bash

rootdir=${1:-/opt/myapp}
owner=${2:-myapp}
group=${3:-myapp}

# Create bin and opot directories. Parents will be 755; if run as root, their ownership will be root:root.(any suid/sgid will be preserved)
install -v -m 755 -o $owner -g $group -d $rootdir/bin $rootdir/etc
if [ "$?" -ne "0" ]; then
    echo "Install: Failed to create directories."
    exit 1
    fi

# install the binary itself
install -b -v -m 750 -o $owner -g $group -s myapp $rootdir/bin
if [ "$?" -ne "0" ]; then
    echo "Install: Failed to install the binary"
    exit 2
    fi

# Install the configuration file, only read-writeable by the owner.
install -b -v -m 600 -o $owner -g $group myapp.conf $rootdir/etc
if [ "$?" -ne "0" ]; then
    echo "Install: Failed to install the config file"
    exit 3
    fi

echo "Install: Succeeded."
