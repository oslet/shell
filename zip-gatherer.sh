#!/bin/bash
fifo=/tmp/zips.fifo

function searchfs
{
    temp=`mktemp`
    find ${1} -mount -type f -iname "*zip" -exec file {} \; | grep "Zip archive data" | cut -d: -f1 > $temp
    cat $temp > $fifo
    rm -f $temp
    echo "Finished searching ${1}."
}

for filesystem in `mount -t crypt,ext3,ext4,fuseblk | cut -d" " -f3`
do
    echo "Spawning a child to search $filesystem"
    searchfs $filesystem &
    done
# Wait for children to complete
wait
# send an EOF to the master to close the fifo
printf "%c" 04 > $fifo
