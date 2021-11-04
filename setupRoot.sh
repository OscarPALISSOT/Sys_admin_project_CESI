#!/bin/bash

# test si root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# mise à jour
apt-get -y update 
apt-get -y upgrade

# Installation des logiciels
apt-get -y install sudo apt-transport-https ca-certificates curl gnupg lsb-release fail2ban git

# paramétrage sudo
/sbin/adduser user sudo

#Paramétrage Fail2Ban
wget https://raw.githubusercontent.com/OscarPALISSOT/projet-SI/main/jail.local -P /etc/fail2ban/


# Installation certificats Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
# Installation Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
# Installation Docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
