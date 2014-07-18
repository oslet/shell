#!/bin/bash
mirror=http://mirror.ox.ac.uk/sites/mirror.centos.org/5.5/isos/x86_64
image=CentOS-5.5-x86_64-binwget

wget ${mirror}/md5sum.txt > md5.out 2>&1
for image in ${image}{1,2,3,4,5,6,7,8}of8.iso
do
    nohup wget ${mirror}/${image} > ${image}.out 2>&1 &
    grep ${image} md5sum.txt >> files-to-check.txt
    done

echo "Waiting for files to download..."

jobs
wait
echo "Verifying MD5 sums..."
md5sum -c files-to-check.txt
if [ "$?" -eq "0" ]; then
    echo "All files downloaded successfully."
    else
    echo "Some files failed."
    exit 1
    fi
