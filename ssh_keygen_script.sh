# Bash Script to create passwordless login for remote servers.
#
# AUTHOUR  :  ANJI BABU KAPAKAYALA
#              IIT KANPUR, INDIA.
#
# USAGE    : sh ssh_keygen_script.sh (Then follow instructions)
#
#!/bin/bash
echo "==================================================="
echo -e "\e[31;44m*****WELCOME TO ANJI BABU SCRIPTING SERVICE *****\e[0m"
echo "==================================================="
cd ~
#STEP1
#Create authentication ssh-keygen keys on remote server
read -p "Eneter remote server username: " user
read -p "Eneter remote server IP: " serverip
echo -e "\e[31;44m  If files are already exits, then dont over write. press n \e[0m"
ssh-keygen -t rsa
#STEP2 
#Create .ssh directory on remote  server
echo -e "\e[31;44m  Plese Enter your semote server Password \e[0m"
ssh $user@$serverip mkdir -p .ssh
#enter password here
#STEP3
#Upload generated public keys to remote server
echo -e "\e[31;44m  Plese Enter your semote server Password \e[0m"
cat .ssh/id_rsa.pub|ssh $user@$serverip 'cat >> ~/.ssh/authorized_keys'
#enter password here
echo ""
#STEP4
#Set permissions on remote servers
ssh $user@$serverip "chmod 700 .ssh ; chmod 640 ~/.ssh/authorized_keys"
#enter password here
#
#STEP5
#now you can login or copy files without password
#ssh -X $user@$serverip
echo -e "\e[31;44m  Congrats....!!!  \e[0m"
echo "Now you can login your server without password by using below command"
echo ""
echo -e "\e[31;44m ssh -X $user@$serverip \e[0m"
echo""
echo "===================================================="
echo -e "\e[31;44m***** THANKS FOR USING ANJI BABU SERVICES *****\e[0m"
echo "===================================================="
#========================================#
#       Written by anjibabu              #
#=============================================================================================#
#Reference : http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/  #
#=============================================================================================#
