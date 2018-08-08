# USAGE:
#  CASE 1: Installing GROMACS patching eith plumed
#      sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -p plumed 
# 
#  CASE 2: Installing GROMACS without mpi [serial version]
#      sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -m serial
#
#  CASE 3: Installing GROMACS without patching plumed mpi version
#     sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz 
#
#
#!/bin/bash
red=$(tput setaf 1)
grn=$(tput setaf 2)
ylw=$(tput setaf 3)
blu=$(tput setaf 4)
pur=$(tput setaf 5)
cyn=$(tput setaf 6)
reset=$(tput sgr0)
bold=$(tput bold)
#---------------------#
# DATE
now=$(date +"%D %r")

# Purpose - Display header message
function header(){
local h="$@"
echo "---------------------------------------------------------------"
echo "$bold $red       ${h}                  $reset"
echo "---------------------------------------------------------------"
}
#------------------------------------
function cmake_test() {
#cmake --version &>null
/home/anjibabu/Softwares/cmake-3.6.2/bin/cmake --version &>null
if [ $? -eq '0' ];then
echo "CMAKE  OK. !"
rm null
else
echo "CMAKE  NOT FOUND.!"
rm null
exit
fi
}
#-----------------------------------
function extract_file() {
file=$1
if [ -f $file ];then               #------------ if1 starts
echo "$file found "
	extension="${file##*.}"
		case $extension in
			zip)
			unzip $file &>null
                        folder=`basename $file .zip`;;
		        gz)
			tar -xvf $file &>null
			folder=`basename $file .tar.gz`;;
		        *)
		        echo "Unknown or NEW extension of file";;
			esac

echo "$file Extracted. !"
else
echo "$file was not found.!"
fi
 }
#---------------------
function patch_plumed() {
case "$1" in
 plumed)
plumed -h &>null
if [ $? -eq '0' ];then
echo "Plumed Found. !"
rm null
#============================#
#   PATCHING WITH PLUMED     #
#============================#
plumed-patch -p << EOF
4
EOF
if [ $? -eq '0' ];then
echo "Plumed patched";
else
echo "ERROR in Patching"
fi
else
echo "Plumed  NOT FOUND.!"
rm null
exit
fi;;
*)
#echo "Gromacs Installign without plumed "
esac
}
#-------------------------------
# Installation of Gromacs
#-------------------------------
function install_gromacs() {
path=`pwd`
#mpi=$2
echo " MPI= $1"
mkdir build
cd build
case "$1" in
   nompi|withoutmpi|serial)
#==================================================#
#   Compiling Gromacs with CMAKE [Serial Version]  #
#==================================================#
/home/anjibabu/Softwares/cmake-3.6.2/bin/cmake .. -DCMAKE_INSTALL_PREFIX=$path -DGMX_MPI=off -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DGMX_PREFER_STATIC_LIBS=ON -DGMX_FFT_LIBRARY=fftpack
echo "GROMACS Installing Without MPI "
;;
*)
# Compiling gromacs with mpi by default
/home/anjibabu/Softwares/cmake-3.6.2/bin/cmake .. -DCMAKE_INSTALL_PREFIX=$path -DGMX_MPI=on -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DGMX_PREFER_STATIC_LIBS=ON -DGMX_FFT_LIBRARY=fftpack
echo "GROMACS Installing with MPI "
;;
esac
exit
#=============================#
 if [ $? -eq '0' ];then                  #---------------- IF 1 starts
 echo " Gromacs Configured Successfully. !"
  make -j 10
        if [ $? -eq '0' ];then           #---------------- IF 2 Starts
 	echo " Gromacs Compiled Successfully. !"
        make install
        if [ $? -eq '0' ];then           #---------------- IF 3 Starts
        echo " Gromacs Installed Successfully.!"
         cat >> ~/.bashrc << EOF3
          #-----------------------------#
          #GROMACS ENVIRONMENT
           export PATH=\$PATH:$path/bin
          #-----------------------------#
EOF3
       else
       echo " Gromacs Installation Failed" #-------------- IF 3 Ends
       fi   
  else
  echo " Gromacs Compilation failed. ! "
  fi                                      #--------------- IF 2 Ends
else
echo " Gromacs Configuration failed. !"   #--------------- IF1 ends
fi
}
#----------------------------------------------------------
# CONSTRUCTING  HELP COMMAND
function help_usage() {
case "$1" in
 h|help|usage|*)
cat << EOF

 
	Authour : Kapakayala Anji Babu
	           IIT Kanpur, India.

	USAGE:
	
	CASE 1: Installing GROMACS patching eith plumed
      	sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -p plumed 
 
	CASE 2: Installing GROMACS without mpi [serial version]
	sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -m serial

	CASE 3: Installing GROMACS without patching plumed mpi version
	sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz 

EOF
;;
esac
}
#--------------------------------------------
#     Defining ARGUMENTS
while getopts f:p:m:h: option
do
case "${option}" in
f) tarfile=$OPTARG;;
p) patch=${OPTARG};;
m) mpi=${OPTARG};;
h) helpp=${OPTARG};;
esac
done
#-------------------------------MAIN PROGRAM
case "$helpp" in
   *) header " BASH SCRIPT TO INSTALL GROMACS WITH FEW OPTIONS "
help_usage $helpp;exit ;;esac
header "GROMACS INSTALLATION"
cmake_test 
extract_file $tarfile 
cd $folder
#-----------PATCH PLUMED
patch_plumed $patch
#------------------------
#path=`pwd`
install_gromacs $mpi
#-------------------------------------------#
# Written By ANJI BABU KAPAKAYALA           #
#-------------------------------------------#
