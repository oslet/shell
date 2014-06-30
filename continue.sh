#!/bin/bash
i=1
while [ "$i" -lt "5" ]; do
echo "i is $i"
read -p "Please r to repeat, any other key to continue: " x
let i=$i+1
if [ "$x" == "r" ]; then
    echo "Skipping the end of the loop."
    fi
    done
echo "This is the end of the script."
