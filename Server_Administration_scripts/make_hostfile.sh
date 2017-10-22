#!/bin/bash
read -p "Enter queue: " queue
pbsnodes -av|grep -B10 "resources_available.node_binding = $queue"|grep -B2 "state = free" |grep "Mom = " >> FreeNodes
Nfree=`grep "hpc" FreeNodes|wc -l`
echo -e "\e[31;44m $Nfree Nodes are FREE \e[0m"
echo ""
#echo $Nfree
if [ "$Nfree" -eq 0 ];
then
echo -e "\e[31;44m No free Nodes are Available in $queue \e[0m" ;echo;echo -e "\e[31;44m ANJI BABU KAPAKAYALA \e[0m";exit;
fi
sed -i 's/     Mom =//g' FreeNodes
nodefile="FreeNodes"
#If given queue is small, medium, mini it should take first two nodes and repeate for 20 times and store in other file called hostlist
read -p "Enter No. of Nodes to use : " k
j=0
while read node;do
for i in {1..20}; do
echo "$node" >> hostlist
done
j=`expr $j + 1`
if [ "$j" -eq $k ];
then
echo ""
echo " Free nodes info has stored in hostfile "
echo ""
echo -e "\e[31;44m  ANJI BABU KAPAKAYALA   \e[0m"
 mv FreeNodes Free_Nodes_$queue  ; exit;
fi
done < $nodefile
echo "$node"
#=====================================#
#   Wirtten by ANJI BABU KAPAKAYALA   #
#=====================================#
