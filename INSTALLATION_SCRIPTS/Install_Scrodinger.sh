# Install Schodinger suite only in IIT Kanpur.
#!/bin/bash
wget "ftp://ftp.cc.iitk.ac.in/pub/unix/APPLS/Softs/Schrodinger-2019"
tar -xvf Schrodinger_Suites_2019-4_Linux-x86_64.tar
cd Schrodinger_Suites_2019-4_Linux-x86_64
./INSTALL
