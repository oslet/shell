#!/bin/bash

suits=( diamonds clubs hearts spades )
values=( one two three four five size seven eight nine ten jack queen king )

function randomcard
{
    echo "the `shuf --random-source=/etc/hosts -n1 -e ${values[@]}` of" "`shuf --random-source=/etc/hosts -n1 -e "${suits[@]}"`"
}

echo "You rejectecd `randomcard` and put it back in the deck."
echo "You rejected `randomcard` and put it back in the deck."
echo "You rejected `randomcard` and put it back in the deck."
YOURCARD=`randomcard`
echo "You picked $YOURCARD."
echo "I remeber $YOURCARD so it is no longer random."
echo "It will always be $YOURCARD."
