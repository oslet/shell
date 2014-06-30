#!/bin/bash
#Test for likely causes of failure
#read -p "Please input a file:"

if [ ! -r "$1" ]; then
    echo "Error: $1 is not a readable file."
echo "Quitting."
exit 1
fi
cat "$1"