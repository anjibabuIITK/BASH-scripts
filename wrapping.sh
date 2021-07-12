#!/bin/bash
for i in `seq 0.40 0.20 9.00`;do
cd GASS_$i
gmx_mpi trjcat -f *.xtc -o gass.xtc
#
sleep 3
gmx_mpi trjconv -f gass.xtc -s gass_0.tpr -pbc mol -ur compact -center -o gass_wrapped.xtc <<EOF
1
0
EOF
#
rm gass.xtc
#
echo "$i Completed. " >> ../LOGFILE
cd ..
done
