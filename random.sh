#!/bin/bash
min=1
max=39
let "scope=$max - $min"
if [ "$scope" -le "0" ]; then
	echo "Error - max is less than min"
fi

for i in `seq 1 10`
do
	let result="$RANDOM%$scope+$min"
echo "A random number between $min and $max is $result"

done
