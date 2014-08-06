#!/bin/bash

people=people.txt
temp=`mktemp`

shuf $people > $temp
prizes=( Gold Silver Bronze )

position=0
head -3 $temp | while read name
do
    echo "The ${prizes[$postition]} prize goes to $name"
    position=`expr $position + 1`
    done
echo

echo "There are three runners-up prizes. In alphabetical order, the winners are:"
head -6 $temp | tail -3 | sort
echo
echo "the booby prize goes to `tail -1 $temp`. Bak luck `tail -1 $temp`!"
echo
echo "Congratulations to everybody who participated."
rm -f $temp
