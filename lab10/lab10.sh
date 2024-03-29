#!/bin/bash

HI='\033[0;32m'
NORMAL='\033[0m'

# Problem 1
echo -e "${HI}1. Starts or ends with Jose$NORMAL"
grep -E --color=always '^Jose|Jose$' phonebook.dat

# Problem 2
echo -e "${HI}2. Contains a sequence of at least 27 alphabetical characters$NORMAL"
grep -E --color=always '[a-zA-Z]{27,}' phonebook.dat

# Problem 3
echo -e "${HI}3. Consists of more than 18 characters$NORMAL"
grep -E --color=always '.{19,}' phonebook.dat

# Problem 4
echo -e "${HI}4. Contains exactly 10 characters$NORMAL"
grep -E --color=always '^.{10}$' phonebook.dat

# Problem 5
echo -e "${HI}5. Contains a sequence between 6 and 8 alphabetical characters$NORMAL"
grep -E --color=always ' [a-zA-Z]{6,8} ' phonebook.dat

# Problem 6
echo -e "${HI}6. Contains a local phone number$NORMAL"
grep -E --color=always '^[0-9]{3}-[0-9]{4}$' phonebook.dat

# Problem 7
echo -e "${HI}7. Contains a valid URL on a line by itself$NORMAL"
grep -E --color=always '^(http|HTTP)://[a-zA-Z]+\.([a-zA-Z]+\.)?(com|edu)$' phonebook.dat
