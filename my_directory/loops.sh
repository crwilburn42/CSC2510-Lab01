#!/bin/bash

minutes=$(( 10#$(date +%M) ))
month=$(( 10#$(date +%m) ))
sum=$(($minutes + $month))

for ((x = 1; x <= $sum; x++)) # C style
do 
    echo "Iteration $x out of $sum.  $(($sum - $x)) iterations remaining."
done

