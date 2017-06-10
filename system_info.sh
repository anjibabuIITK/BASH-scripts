#!/bin/bash
#!/bin/bash
# Sample script written for Part 4 of the RHCE series
# This script will return the following set of system information:
#IP info
IP=`/sbin/ifconfig p1p1 |grep "inet addr" |cut -d: -f2|awk '{print $1}'`
echo ""
echo -e "\e[31;44m***** IP ADDRESS INFORMATION *****\e[0m"
echo "Your IP address : $IP"
echo ""
# -Hostname information:
echo -e "\e[31;44m***** HOSTNAME INFORMATION *****\e[0m"
hostnamectl
echo ""
# -File system disk space usage:
echo -e "\e[31;44m***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
df -h
echo ""
# -Free and used memory in the system:
echo -e "\e[31;44m ***** FREE AND USED MEMORY *****\e[0m"
free -h
echo ""
# -System uptime and load:
echo -e "\e[31;44m***** SYSTEM UPTIME AND LOAD *****\e[0m"
uptime
echo ""
# -Logged-in users:
echo -e "\e[31;44m***** CURRENTLY LOGGED-IN USERS *****\e[0m"
who
echo ""
# -Top 5 processes as far as memory usage is concerned
echo -e "\e[31;44m***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
ps -eo pid,%mem,%cpu,comm --sort=-%mem | head -n 6
echo ""
echo -e "\e[1;32mDone.\e[0m"
echo ""
echo ""
echo -e "\e[31;44m*********ANJI BABU***********\e[0m"
echo -e "\e[31;44m*****================********\e[0m"
#mutt -s "ANJI-PC: Hardware info" anjibabu480@gmail.com < file
#rm file
#================================================================#
#reference:http://www.tecmint.com/using-shell-script-to-automate-linux-system-maintenance-tasks/
#echo -e "\e[COLOR1;COLOR2m<YOUR TEXT HERE>\e[0m"
