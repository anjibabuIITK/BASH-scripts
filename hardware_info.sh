#!/bin/bash
echo "======================="

IP=`/sbin/ifconfig p1p1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
#cho -e "Your IP address : $IP "
echo -e "\e[31;44m Your IP Address : $IP \e[0m"

echo ""
echo "======================="
echo ""
echo "   HardWare Information   "
echo ""
lscpu
echo ""
echo "======================="
echo -e "\e[31;44m  Written by ANJIBABU   \e[0m"
echo "======================="
