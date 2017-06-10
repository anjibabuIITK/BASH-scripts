#!/bin/bash
begin=$(date +%s)
#find PROB_* -type d > filenames 
filename='filenames'
while read file; do
echo "$file is processing......"
mv $file PROB
cp PROB/whaminput .
mkdir PROB/FES
sed -i '/^#/g' whaminput
./wham_code_v5.x > OUT_$file
mv free_energy PROB/FES
mv free_energy_1D PROB/FES
mv PROB $file
echo ""
echo " $file is completed succeessfully  "
echo "====================================="
echo ""
done < $filename
echo ""
echo "$LOGNAME"
echo "$(date)"
echo ""
end=$(date +%s)
runtime=$(($end-$begin))
echo " Execution time : $runtime seconds"
echo""
echo -e "\e[31;44m   Written by ANJI BABU KAPAKAYALA    \e[0"
#==================================================
#same thing you can also do by below code
#!/bin/bash
#find PROB_* -type d > filenames 
#n=`find PROB* -type d |wc -l`
#for i in `seq 1 $n`;do
#read file < filenames
#echo "$file is processing......"
#mv $file PROB
#cp PROB/whaminput .
#mkdir PROB/FES
#sed -i '/^#/g' whaminput
#./wham_code_v5.x > OUT_$file
#mv free_energy PROB/FES
#mv free_energy_1D PROB/FES
#mv PROB $file
#echo ""
#echo " $file is completed succeessfully  "
#done
#=====================================================#
#              ANJI BABU KAPAKAYALA                   #
#=====================================================#
