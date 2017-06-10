#!/bin/bash
#this script finds the whether COLVAR and RESTART exists or not ?
for i in `seq 3.00 0.25 8.00` ; do
#file="COLVAR"
file="PROB_$i"
#folder="RESTART"
echo "!------------------------------!"
#echo "umb_$i : "
#cd umb_$i
 [ -f "$file" ] && echo "$file exists" || echo "$file does not exists"
#if [ -f "$file" ]
#then
#echo "$file found"
#else
#echo "$file not found"
#fi
#wc -l COLVAR 
echo ""
# [ -d "$folder" ]  && echo "$folder exists" || echo "$folder not found"
#if [ -d "$folder" ]
#then
#echo "$folder found"
#else
#echo "$folder not found"
#fi
#cd RESTART/
#wc -l COLVAR
#cd ../../
#cd ../
#echo "umb_$i  completed"
#echo ""
done
#
for i in `seq 8.50 0.50 38.00` ; do
#file="COLVAR"
file="PROB_$i"
#folder="RESTART"
echo "!------------------------------!"
#echo "umb_$i : "
#cd umb_$i
 [ -f "$file" ] && echo "$file exists" || echo "$file does not exists"
#if [ -f "$file" ]
#then
#echo "$file found"
#else
#echo "$file not found"
#fi
#wc -l COLVAR 
#echo ""
# [ -d "$folder" ]  && echo "$folder exists" || echo "$folder not found"
#if [ -d "$folder" ]
#then
#echo "$folder found"
#else
#echo "$folder not found"
#fi
#cd RESTART
#wc -l COLVAR
#cd ../../
#cd ../
#echo "umb_$i  completed"
echo ""
done

