#!/bin/bash
while read -p "What file do you want to test ? " filename
do
    if [ ! -e "$filename" ]; then
        echo "a file does not exists."
        continue
        fi
        ls -ld $filename
        if [ -r "$filename" ]; then
            echo "This file is readable"
fi
        if [ -w "$filename" ]; then
            echo "This file is writeable"
fi
        if [ -x "$filename" ]; then
            echo "This file is executeable"
fi
        if [ -O "$filename" ]; then
            echo "You own $filename"
else
            echo "You don't own $filename"
fi
        if [ -G "$filename" ]; then
            echo "You group own $filename"
else
            echo "You group does not own $filename"
fi
        done
