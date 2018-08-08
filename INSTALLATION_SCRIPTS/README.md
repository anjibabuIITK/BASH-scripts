# INSTALLATION OF PLUMED

         
         Authour :  **KAPAKAYALA ANJI BABU**
                       IIT KANPUR, INDIA.
        

	 Bash Script to Install Plumed package.
                       
   
         Usage   :  sh install_plumed.sh <zipfile|tarfile>    
       

# INSTALLATION OF GROMACS
## [Serial | mpi | plumed-patched ]  


                   
        **USAGE:**

        CASE 1: Installing GROMACS patching eith plumed

        sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -p plumed
 

 
        CASE 2: Installing GROMACS without mpi [serial version]

        sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz -m serial



        CASE 3: Installing GROMACS without patching plumed mpi version
        sh Install_gromacs.sh -f gromacs-5.1.2.tar.gz 

 
                    
