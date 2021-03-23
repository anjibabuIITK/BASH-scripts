# Bash script to install Docker in ubuntu/mint
#
#   Authour: Anji Babu Kapakayala
# 	     C/O Prof. Nisanth Nair
#	Dept. Of Chemistry, IIT Kanpur.
#
# Ref: https://docs.docker.com/engine/install/ubuntu/
#!/bin/bash
#
# Step 1: Update the apt package index 
sudo apt-get update

# Step 2: Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Step 3: Add Docker's official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify that now you have the key with fingerprit 
#9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
# by searching for the last 8 characters of the fingerprint.
#sudo apt-key fingerprint 0EBFCD88

# Step 4: 

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Step 5: Update the apt package index
sudo apt-get update

# Step 6: Install Docker engine 
sudo apt-get install docker-ce docker-ce-cli containerd.io



# Tutorial point version
sudo apt-key adv \
--keyserver hkp://ha.pool.sks-keyservers.net:80 \
--recv-keys 58118E89F3A912897C070ADBF76221572C52609D
#
echo  "deb  https://apt.dockerproject.org/repo  ubuntu-trusty  main" | sudo  tee 
/etc/apt/sources.list.d/docker.list
