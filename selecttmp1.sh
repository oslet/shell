#!/bin/bash
select item in one two three four
do
if [ ! -z "$item" ]; then
echo "this is test something"
else
    echo "$REPLY is not valid."
fi
done
