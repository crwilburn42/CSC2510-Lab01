#!/bin/bash

# convert the minute to a base 10 number
minute=$(( 10#$(date +%M) ))

# arithmetic expansion
if (( minute%2 == 0 )); then
    echo "The time is even."
else
    echo "The time is odd."
fi

# double square brackets
# with -eq operator for numeric comparison
if [[ $minute%2 -eq 0 ]]; then
    echo "The time is even."
else
    echo "The time is odd."
fi

# test command with arithmetic substitution
if test $((minute%2)) -eq 0 ; then
	echo "The time is even."
else
	echo "The time is odd."
fi