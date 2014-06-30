#!/bin/bash
while read -p "what file do you want to test ? " filename
do
    if [ ! -e $filename ]; then
        echo "$filename does not exists."
        continue
        fi
    ls -ld $filename
    if [ -L "$filename" ]; then
        echo "a file is symbolic link"
elif [ -f "$filename" ]; then
        echo "a file is regular file"
elif [ -b "$filename" ]; then
        echo "a file is block file"
elif [ -c "$filename" ]; then
        echo "a file is character file"
elif [ -d "$filename" ]; then
        echo "a file is directory"
elif [ -p "$filename" ]; then
        echo "a file is named pipe"
elif [ -S "$filename" ]; then
        echo "a file is socket"
else
        echo "I don't know this file,Is this linux"
fi
    done