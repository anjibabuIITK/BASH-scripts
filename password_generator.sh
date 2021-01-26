#!/bin/bash 
  
# this can be anything of your choice 
echo "Welcome to simple password generator" 
  
# ask the user how much long should be 
echo "please enter the length of the password"  
  
# read the input given by user and store in variable 
read  PASS_LENGTH  
  
# loop will create 5 passwords according to 
# user as per length given by user                         
for p in $(seq 1 5);                                    
do  
    openssl rand -base64 48 | cut -c1-$PASS_LENGTH  
done 
