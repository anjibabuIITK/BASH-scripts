## Bash Script to generate required input files to run REMD sumulation using Gromacs
 
 AUTHOUR : KAPAKAYALA ANJI BABU
           IIT KANPUR, INDIA.

 INPUT   : test.gro , test.mdp , test.top 

 USAGE   : sh make_inputs.sh -i 300.0 -f 350.0 -d 2.0 -n 15000000 -g "test.gro" -m "test.mdp"

 FLAGS   :
    -i   : Initial Temperature
    -f   : Final Temperature
    -d   : Temp. defference
    -n   : No. of MD steps
    -m   :  mdp file
    -g   :   gro file

 OUTPUT  : Generates Default names remd_$i.gro, remd_$i.mdp , remd_$i.tpr and submit.sh 
 
 
 #---------------------------------------------------------------------------------------#
 #                              ANJI BABU KAPAKAYALA                                     #
 #---------------------------------------------------------------------------------------#
