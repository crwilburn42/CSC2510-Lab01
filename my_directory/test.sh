#!/bin/bash

# Combine the contents of all .txt files in a directory into a single file
cat *.txt > combined.txt

# Sort the lines of the combined file in alphabetical order
sort -o sorted.txt combined.txt
