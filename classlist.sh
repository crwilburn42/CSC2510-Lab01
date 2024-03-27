#!/bin/bash

# check number of arguments 
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file> <username>"
    exit 1
fi

file="$1"
username="$2"

# check if file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

line_number=$(grep -n "^$username$" "$file" | cut -d: -f1)

if [ -n "$line_number" ]; then
    echo "The username '$username' exists in the file on line $line_number."
else
    # username not found
    while true; do
        read -p "Do you want to add '$username' to '$file'? (Y/N): " response

        case $response in
            [Yy]|[Yy][Ee][Ss])
                read -p "Do you want to alphabetize '$file' after adding '$username'? (Y/N): " alphabetize_response

                case $alphabetize_response in
                    [Yy]|[Yy][Ee][Ss])
                        # add username and alphabatize
                        echo "$username" >> "$file"
                        sort -o "$file" "$file"
                        echo "The username '$username' was added and the file alphabetized."
                        break
                        ;;
                    [Nn]|[Nn][Oo])
                        # add username only
                        echo "$username" >> "$file"
                        echo "Username '$username' added."
                        break
                        ;;
                    *)
                        echo "Invalid response: Please enter Y/y/Yes/yes or N/n/No/no."
                        ;;
                esac
                ;;

            [Nn]|[Nn][Oo])
                echo "Exiting the script. Username '$username' was not added."
                exit 0
                ;;
            *)
                echo "Invalid response: Please enter Y/y/Yes/yes or N/n/No/no."
                ;;
        esac
    done
fi
