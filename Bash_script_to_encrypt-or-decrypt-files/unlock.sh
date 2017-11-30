#!/bin/bash
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
#read -p " Enter File to decrypt : " file
#echo $file > dummy
#file2=`cut -d'.' -f1,2 dummy`
#echo "$file2"
#rm dummy
#-------------------
file2=`echo "${file%.*}"`
extn=`echo "${file2#*.}"`
tar="tar.gz"
#
#------- Decrypt file/directory
function unlock() {
#echo "$file2"
#----- Decrypting by removing .gpg extension
echo;echo " ------------------------------------ "
#echo "    $bold $red Decrypting Given File  $rst  "
#echo " ------------------------------------ "
echo;echo " $bold $ylw Given File : $red $file $rst ";echo
echo " $bold $pur Enter Password in GUI : $rst";echo
gpg -d $file > $file2 
if [ $? -ne 0 ];then
echo ;echo " $bold $red Entered Wrong Password. Bye.$rst";echo
else
#--------
echo
echo "$bold $ylw Congrats Your $red $file $rst $bold $ylw has decrypted to $blue $file2 $rst";echo
fi
}
#-------booter
function booter() {
echo;echo "---------------------------------------------------"
echo "$bold $pur  $    Written By ANJI BABU KAPAKAYALA    $ $rst"
echo "---------------------------------------------------";echo
}
#-------------Main Program
which gpg &> /dev/null
if [ $? -ne 0 ];then
echo "---------------------------------------------------"
echo "$bold $ylw Install $red getpinentry-gtk$rst $bold $ylw package to use this script.$rst"
echo "$bold $red Thanks. Bye.$rst";booter;exit
else
if [[ "$extn" == "$tar" ]];then
unlock
tar xzf $file2
rm $file2
echo "$bold $pur $file2 has removed.$rst";booter
#echo " TAR BALL"
else
unlock;booter
#echo " Not Tar ball"
fi
fi
#------------------------------------#
#   Written By AANJI BABU KAPAKAYALA #
#------------------------------------#
