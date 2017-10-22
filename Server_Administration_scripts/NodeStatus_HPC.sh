# Bash script to print remote server nodes status for given queue.
#
# Authour : ANJI BABU KAPAKAYALA
#             IIT KANPUR, INDIA.
#
#!/bin/bash
now=$(date +"%e %b %y, %a %r")
read -p "Enter queue: " queue
#pbsnodes -av|grep -B10 "resources_available.node_binding = $queue"|grep "state = free" > temp
pbsnodes -av|grep -B10 "resources_available.node_binding = $queue"|grep -B2 "state =" >> temp1
sed -i 's/state =/     status =/g' temp1
sed -i 's/          status =/Status =/g' temp1
sed -i '/^     ntype/d' temp1
nodes=`grep "Mom =" temp1|wc -l`
free=`grep "free" temp1|wc -l`
busy=`grep "job-busy" temp1|wc -l`
offnodes=`grep "offline" temp1|wc -l`
sed -i 's/     Mom =//g' temp1

echo -e "\e[31;44m**** Nodes Status of HPC2013 ****\e[0m"
echo "================================="
#echo -e "\e[31;44m Queue : $queue    \e[0m"
echo  "Queue : $queue"
echo ""
#echo -e "\e[31;44m Total Nodes: $nodes  Procs/node: 20 \e[0m"
echo  "Total Nodes: $nodes  Procs/node: 20 "
echo "================================="
#===================================================#
#j=0
#for i in `cat temp1|grep -v '\-\-'|cut -d "=" -f 2`;
#do
#        j=`expr $j + 1`
#        k=`expr $j % 2`
#        if [ $k = 1 ];
#        then
#                echo -n "$i  ";
#        else
#                echo $i;
#        fi
#==================================================#
#echo -e "\e[31;44m Total No of nodes : $nodes  \e[0m"
#echo ""
echo -e "\e[31;44m No of Busy nodes       : $busy      \e[0m"
echo -e "\e[31;44m No of free nodes       : $free       \e[0m"
echo -e "\e[31;44m No of nodes in Offline : $offnodes       \e[0m"
echo ""
echo "$now"
echo ""
#echo "$LOGNAME"
#echo -e "\e[31;44m***** $LOGNAME *****\e[0m"
echo -e "\e[31;44m***** written by ANJI BABU *****\e[0m"
echo "================================="
#=======================================================#
#         Written By Anji Babu Kapakayala               #
#=======================================================#
#cat temp1
rm temp1

