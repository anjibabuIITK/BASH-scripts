#!/bin/bash
#this script finds the whether COLVAR and RESTART exists or not ?
for i in `seq 3.00 0.25 8.00` ; do
file="COLVAR"
folder="RESTART"
echo "!------------------------------!"
echo "umb_$i : "
cd umb_$i
# [ -f "$file" ] && echo "$file exists" || echo "$file does not exists"
if [ -f "$file" ]
then
   echo "$file found"
   wc -l COLVAR 
echo ""
# [ -d "$folder" ]  && echo "$folder exists" && cd RESTART/ && wc -l COLVAR && cd ../../ || echo "$folder not found" && cd ../
     if [ -d "$folder" ]
     then
        echo "$folder found"
        cd RESTART/
        wc -l COLVAR
        cd ../../
     else
        echo "$folder not found"
        cd ../
     fi
else
   echo "$file not found"
   cd ../
fi
#cd ../../
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
echo "umb_$i  completed"
echo ""
done
#
for i in `seq 8.50 0.50 38.00` ; do
file="COLVAR"
folder="RESTART"
echo "!------------------------------!"
echo "umb_$i : "
cd umb_$i
if [ -f "$file" ]
then
   echo "$file found"
   wc -l COLVAR 
echo ""
# [ -d "$folder" ]  && echo "$folder exists" && cd RESTART/ && wc -l COLVAR && cd ../../ || echo "$folder not found" && cd ../
     if [ -d "$folder" ]
     then
        echo "$folder found"
        cd RESTART/
        wc -l COLVAR
        cd ../../
     else
        echo "$folder not found"
        cd ../
     fi
else
   echo "$file not found"
   cd ../
fi
echo "umb_$i  completed"
echo ""
done

