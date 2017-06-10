#!/bin/bash
filename="hostlist"
TNL= wc -l hostlist|awk '{ print $1}'    #TNL=Totla No of lines
sed -n 1,10p $filename >>  hostlist1
sed -n 11,20p $filename >> hostlist2
sed -n 21,30p $filename >> hostlist3
sed -n 31,40p $filename >> hostlist4
#==========================================#
#to print first 20 lines
#head -20 $filename >> file1
#sed -n 1,20p $filename >> file1
#sed -n 21,40p $filename >> file2
#awk 'FNR <= 20' $filename
#==========================================#
#reference :
#https://www.cyberciti.biz/faq/unix-linux-show-first-10-20-lines-of-file/
#==========================================#
#        ANJI BABU KAPAKAYALA              #
#==========================================#

