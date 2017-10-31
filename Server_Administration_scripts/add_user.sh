#!/bin/bash
# Bash Script to add a new user to Linux system as root
if [ $(id -u) -eq 0 ]; then
    read -p "Enter username : " username         # username
    read -s -p "Enter password : " password      # Password, -s tag will not echo password when typed in terminal
    egrep "^$username" /etc/passwd >/dev/null    # Checking Whether given username has exist or not.
    if [ $? -eq 0 ]; then                         
        echo "$username exists!"        
        exit 1
    else
        pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
        useradd -m -p $pass $username
        [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
    fi
else
 echo "========================================="
 echo;echo "Access denied .";echo "Only root may add a user to the system";echo
 echo "========================================="
    exit 2
fi
#================================================#
#         ANJI BABU KAPAKAYALA                   #
#================================================#
