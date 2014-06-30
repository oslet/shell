#!/bin/bash
# check for likely causes of failure.

if [ -r $1 ]; then
    cat $1
    else
    echo "Error: $1 is not a readable file."
fi
