#!/bin/bash

# Création du dossier répertoire de nos Docker
mkdir -p ~/.docker
chmod 777 ~/.docker

# Copie du Site Web
git -C ~/.docker clone https://github.com/KNFreed/PW-Docker-Web.git

# Lancement du Docker
docker-compose -f ~/.docker/PW-Docker-Web/docker-compose.yml up -d