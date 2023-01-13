#!/bin/bash

# switch user to root
# copy this script to /
# run this script

# add user to sudo group
usermod -aG sudo $LOGNAME
groupadd docker
usermod -aG docker $LOGNAME

# update package manager
apt-get update
apt-get install update

# install packages
apt-get -y install \
    ssh \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    make

# create docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# install docker services
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# cleanup
apt-get autoremove
