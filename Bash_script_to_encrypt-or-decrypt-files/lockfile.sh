#!/bin/bash
# Bash script to encrypt given file
#
# Usage : sh lock.sh filename
#
# Output : filename.anji ( encrypted) 
file=$1
#------TEXT COLORS
red=`tput setaf 1`
ylw=`tput setaf 3`
blue=`tput setaf 4`
pur=`tput setaf 5`
bold=`tput bold`
rst=`tput sgr0`
#echo " $bold $red RED $ylw YELLOW $blue BLUE $pur PURPLE $rst"
#-------------------
which gpg &> /dev/null
if [ $? -ne 0 ];then
echo;echo "$bold $red -------------------------------------------------------- $rst"
echo " $bold $ylw Install $red pinentry-gtk$rst $bold $ylw package to use this script. $rst"
echo " $bold $ylw Thanks. Bye $rst"
echo;echo "$bold $red -------------------------------------------------------- $rst";exit
else
#-------------------
echo;echo "$bold $red ------------------------------------ $rst"
echo ;echo " $bold $ylw Given File    : $red $file $rst"
echo; echo " $bold $pur Give Password in GUI : $rst";echo
gpg -c $file
echo
echo "$bold $ylw $file has encrypted successfully...$rst"
rm -rf $file
mv $file.gpg $file.anji
echo "$bold $red $file has removed.$rst";echo;echo;echo
echo;echo "$bold $red ------------------------------------ $rst"
echo "$bold $pur     Written By ANJI BABU KAPAKAYALA      $rst"
echo "$bold $red ------------------------------------ $rst";echo
fi
#---------------------------------#
# Written By ANJI BABU KAPAKAYALA #
#---------------------------------#
