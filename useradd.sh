#!/bin/bash
for i in `seq 1 20`
do
pwd=$(cat/dev/urandom|head -1 |md5-sum|head -c 5)
useradd -MN zuser$i -p user$i$pwd
echo user$i$pwd >>userinfo.txt
done
