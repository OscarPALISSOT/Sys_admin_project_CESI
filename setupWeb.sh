#!/bin/bash

# test si root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Création du dossier répertoire de nos Docker

mkdir -p ~/.docker
chmod 777 ~/.docker

# Copie du Site Web
git -C ~/.docker clone https://github.com/KNFreed/PW-Docker-Web.git

# Lancement du Docker
docker-compose -f ~/.docker/PW-Docker-Web/docker-compose.yml up -d