#!/bin/bash
read -p "n:" n
b=1
a=0
for i in `seq 1 $n`
do
    let "b=$b+$a"
    let "a=$b-$a"
done
echo $b
