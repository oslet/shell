#!/bin/bash
b=1
a=0
read -p "n:" num

for i in `seq 1 $num`
do
    let "b=$a + $b"
let "a=$b - $a"
done
echo $b