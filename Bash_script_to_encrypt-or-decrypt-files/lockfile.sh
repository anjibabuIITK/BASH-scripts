#!/bin/bash
# Bash Script to encrypt given File or Directory with .anji extension.
#
# Authour : KAPKAYALA ANJI BABU
#           IIT KANPUR, INDIA.
#
# Usage   : sh encrypt.sh {argument}
#
# Output  : If file      : filename.anji
#           If Directory : directory.tar.gz.anji
#
file=$1
#------TEXT COLORS
red=`tput setaf 1`
ylw=`tput setaf 3`
blue=`tput setaf 4`
pur=`tput setaf 5`
bold=`tput bold`
rst=`tput sgr0`
#echo " $bold $red RED $ylw YELLOW $blue BLUE $pur PURPLE $rst"
#---------Encrypting
function lock_file() {
echo ;echo " $bold $ylw Given File : $red $file $rst"
echo;echo " $bold $pur Give Password in GUI : $rst";echo
gpg -c $file
echo "$?"
echo
echo "$bold $ylw $file has encrypted successfully...$rst"
rm -rf $file
mv $file.gpg $file.anji
echo "$bold $red $file has removed.$rst";echo;echo;echo
}
#-------- If given argument is Directory
function lock_dir() {
tar czf $file.tar.gz $file
file2="$file.tar.gz"
echo ;echo " $bold $ylw Given Directory      : $red $file2 $rst"
echo ;echo " $bold $pur Give Password in GUI : $rst";echo
gpg -c $file2
#echo "$?"
echo
echo "$bold $ylw $file has encrypted successfully...$rst"
rm -rf $file2 $file
mv $file2.gpg $file2.anji
echo "$bold $red $file and $file2 are removed.$rst";echo;echo;echo
}
#-------booter
function booter() {
echo "---------------------------------------------------"
echo "$bold $pur  $    Written By ANJI BABU KAPAKAYALA    $ $rst"
echo "---------------------------------------------------";echo
}
#-------------Main Program
which gpg &> /dev/null
if [ $? -ne 0 ];then
echo "---------------------------------------------------"
echo "$bold $ylw Install $red getpin-gtk$rst $bold $ylw package to use this script.$rst"
echo "$bold $red Thanks. Bye.$rst";booter;exit
else
if [[ -d $file ]];then
   echo " $bold $red Given Argument is Directory. $rst"
   lock_dir;booter
else
   if [[ -f $file ]];then
   echo " $bold $red Given Argument is File. $rst"
   lock_file;booter
   else
   echo "$bold $red Invalid Argument Passed $rst";booter
   fi
fi
fi
#---------------------------------#
# Written By ANJI BABU KAPAKAYALA #
#---------------------------------#
