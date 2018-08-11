# Bash Script to install gromacs and path with Plumed
#
#
#  Authour : ANJI BABU KAPAKAYALA
#		C/O Prof. Nisanth N. Nair
#		Dept. Of Chemistry
#		IIT Kanpur, India.
#
#  USAGE:
# 
#  CASE0: Need Help ?
#	  sh Install_gromacs.sh --help
#
#  CASE 1: Installing GROMACS patching eith plumed
#         sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -p plumed 
# 
#  CASE 2: Installing GROMACS without mpi [serial version]
#         sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -m serial
#
#  CASE 3: Installing GROMACS without patching plumed mpi version
#         sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz 
#
#------------------------------------------------------------------#
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
echo "$bold $red---------------------------------------------$rst"
echo "$bold $red       ${h}                  $reset"
echo "$bold $red---------------------------------------------$rst"
}
#------------------------------------
function cmake_test() {
#cmake --version &>null
/home/anjibabu/Softwares/cmake-3.6.2/bin/cmake --version &>null
if [ $? -eq '0' ];then
echo "$bold $grn CMAKE  OK. ! $rst"
rm null
else
echo "$bold $red CMAKE  NOT FOUND.! $rst"
rm null
exit
fi
}
#-----------------------------------
function extract_file() {
file=$1
if [ -f $file ];then               #------------ if1 starts
echo "$bold $grn $file found $rst"
	extension="${file##*.}"
		case $extension in
			zip)
			unzip $file &>null
                        folder=`basename $file .zip`;;
		        gz)
			tar -xvf $file &>null
			folder=`basename $file .tar.gz`;;
		        *)
		        echo "$bold $red Unknown or NEW extension of file $rst";;
			esac

echo "$bold $grn $file Extracted. !$rst"
else
echo "$bold $red $file was not found.!$rst";exit
fi
 }
#---------------------
function patch_plumed() {
case "$1" in
 plumed)
plumed -h &>null
if [ $? -eq '0' ];then
echo "$bold $grn Plumed Found. !$rst"
rm null
#============================#
#   PATCHING WITH PLUMED     #
#============================#
plumed-patch -p &>null << EOF
4
EOF
if [ $? -eq '0' ];then
echo "$bold $grn Plumed patched $rst";
else
echo "$bold $red ERROR in Patching $rst"
fi
else
echo "$bold $red Plumed  NOT FOUND.! $rst"
echo "$bold $red USE THIS COMMAND TO INSTALL PLUMED.! $rst"
echo "$bold $blu sh Install_gromacs.sh -f <tar/zip file> -i install_plumed $rst"
echo "$bold $ylw Bye !!!! $rst"
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
mkdir build
cd build
case "$1" in
   nompi|withoutmpi|serial)
#==================================================#
#   Compiling Gromacs with CMAKE [Serial Version]  #
#==================================================#
echo "$bold $grn GROMACS Installing Without MPI $rst"
/home/anjibabu/Softwares/cmake-3.6.2/bin/cmake .. -DCMAKE_INSTALL_PREFIX=$path -DGMX_MPI=off -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DGMX_PREFER_STATIC_LIBS=ON -DGMX_FFT_LIBRARY=fftpack &>null
;;
*)
# Compiling gromacs with mpi by default
echo "$bold $grn GROMACS Installing with MPI $rst"
/home/anjibabu/Softwares/cmake-3.6.2/bin/cmake .. -DCMAKE_INSTALL_PREFIX=$path -DGMX_MPI=on -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DGMX_PREFER_STATIC_LIBS=ON -DGMX_FFT_LIBRARY=fftpack &>null
;;
esac
#=============================#
 if [ $? -eq '0' ];then                  #---------------- IF 1 starts
 echo "$bold $grn Gromacs Configured Successfully. ! $rst"
 echo "$bold $grn Gromacs Compiling......[$red Please Wait $rst $grn ] ! $rst"
  make -j 10 &>null
        if [ $? -eq '0' ];then           #---------------- IF 2 Starts
 	echo "$bold $grn Gromacs Compiled Successfully. ! $rst"
        echo "$bold $grn Gromacs Installing......[$red Please Wait $rst $grn ] ! $rst"
        make install &>null
        if [ $? -eq '0' ];then           #---------------- IF 3 Starts
        echo "$bold $grn Gromacs Installed Successfully.! $rst"
         cat >> ~/.bashrc << EOF3
#-----------------------------#
#GROMACS ENVIRONMENT
export PATH=\$PATH:$path/bin
#-----------------------------#
EOF3
       else
       echo "$bold $red Gromacs Installation Failed $rst";exit #--------- IF 3 Ends
       fi   
  else
  echo "$bold $red Gromacs Compilation failed. ! $rst ";exit
  fi                                      #--------------- IF 2 Ends
else
echo "$bold $red Gromacs Configuration failed. !$rst" ;exit #----------- IF1 ends
fi
}
#----------------------------------------------------------
# CONSTRUCTING  HELP COMMAND
function help_usage() {
#case "$1" in
#h|help|usage)
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
#;;
#*) echo "UNKNOWN KWY WORD" ;exit;;
#esac
}
#---------------------INSTALL PLUMED
function install_plumed() {
case "$1" in
install_plumed|plumed_install)
path=`pwd`
#echo "$PATH"
echo "$bold $grn Configuring $folder...$rst [$red Please wait$rst$grn]$rst"
./configure --prefix=$path &>null
                 if [ $? -eq '0' ] ;then    #-------------------if2 starts
                        echo "$bold $grn Configuration Done. $rst"
                        source $path/sourceme.sh
                        echo " $bold $grn Source sourceme.sh Done !.$rst"
			echo "$bold $grn Compiling $folder...$rst [$red Please wait$rst$grn]$rst"
                        make -j 10 &>null
                                if [ $? -eq '0' ] ;then   #---------------if3 starts
                                        echo "$bold $grn Complilation Successful. ! $rst"
					echo "$bold $grn Installing $folder...$rst [$red Please wait$rst$grn]$rst"
                                        make install &>null
                                                if [ $? -eq '0' ] ;then  #------------If4 starts
                                                        echo "$bold $grn Installation Successful. ! $rst"
cat >> ~/.bashrc << EOF
#------------------------
#  PLUMED PATH
source $path/sourceme.sh
EOF
                                                else
                                                        echo "$bold $red Installation Failed. ! $rst";exit
                                                fi                     #---------------IF4 ends 

                                else
                                        echo "$bold $red Compilation Failed. ! $rst";exit
                                fi                                      #----------------IF3 ends
                else
                        echo "$bold $red Configuration Failed. !$rst";exit   #--------------If2 Ends
                fi
;;
*)echo "$bold $blue KNOWN KEY WORD..! $rst";exit;;esac
}
#-----------------------------------------------------------
case "$1" in
   --help|--usage) header " BASH SCRIPT TO INSTALL GROMACS WITH FEW OPTIONS "
help_usage;exit ;;
esac
#--------------------------------------------
#     Defining ARGUMENTS
while getopts f:p:m:i: option
do
case "${option}" in
f) tarfile=$OPTARG;;
p) patch=${OPTARG};;
m) mpi=${OPTARG};;
i) plumed_key=${OPTARG};;
esac
done
#-------------------------------MAIN PROGRAM
header "GROMACS INSTALLATION"
cmake_test 
extract_file $tarfile 
cd $folder
#-----------INSTALL PLUMED
install_plumed $plumed_key
#-----------PATCH PLUMED
patch_plumed $patch
#------------------------
#path=`pwd`
install_gromacs $mpi
rm null 
#-------------------------------------------#
echo "$bold $blu  Written By ANJI BABU KAPAKAYALA $rst"
#-------------------------------------------#
