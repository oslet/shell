#!/bin/bash
if [ "$1" = "$2" ]; then
    echo "$1 is same as $2"
else
    echo "$1 is not same as $2"
if [[ "$1" < "$2" ]]; then
    echo "$1 comes before $2"
else
    echo "$1 comes after $2"
fi
fi
