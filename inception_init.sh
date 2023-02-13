#!/bin/bash

# INSTRUCTIONS: 
# run script with: 'sudo bash inception_init.sh'

# if this script fails, just try running it again! It usually works on the second try at the latest

# add user to sudo group
/sbin/usermod -aG sudo $USER
groupadd docker
/sbin/usermod -aG docker $USER

# flush user groups
su $USER

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


# Docker

# create docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# install docker services
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin


# Inception configuration

# get inception website URL
BLUE='\033[1;34m'
NC='\033[0m'
echo -e -n "\n${BLUE}Enter inception URL (leave empty for https://tkruger.42.fr):${NC} https://"
read GET_DOMAIN
if [ "${GET_DOMAIN}" = "" ]; then
    export INCEPTION_DOMAIN="tkruger.42.fr"
else
    export INCEPTION_DOMAIN="${GET_DOMAIN}"
fi

# add Domain to /etc/hosts for local DNS
cat << EOF >> /etc/hosts
# added to access inception URL
127.0.0.1 ${INCEPTION_DOMAIN}
EOF


# cleanup
apt-get autoremove
