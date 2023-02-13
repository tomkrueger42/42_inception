#!/bin/bash

# INSTRUCTIONS: 
# su to root
# run script

# add user to sudo group
usermod -aG sudo $LOGNAME
groupadd docker
usermod -aG docker $LOGNAME

# update package index and packages
apt-get update
apt-get upgrade

# install packages
apt-get -y install \
    ssh \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    make \

# create docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# install docker services
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# add Domain to /etc/hosts for local DNS
cat << "EOF" >> /etc/hosts
# added to access tkruger.42.fr
127.0.0.1 tkruger.42.fr
EOF

# cleanup
apt-get autoremove
