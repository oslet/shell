#!/bin/bash
for deb in /var/cache/apt/archives/*
do
    pkgname=`basename $deb`
    if [[ $pkgname =~ .*\.deb ]]; then
        echo "$pkgname is a .deb package"
    else
        echo "File \"$pkgname\" is not a .deb package."
    fi
    done
