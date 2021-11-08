#!/bin/bash

# Test si root ou sudo
if [[ $EUID -eq 0 ]]; then
    echo "Lancement de l'installation du serveur Web"
else
    echo "Merci de lancer en root ou sudo."
    exit 1
fi

# Création du dossier répertoire de nos Docker
mkdir -p ~/.docker
chmod 777 ~/.docker

# Copie du Site Web
git -C ~/.docker clone https://github.com/KNFreed/PW-Docker-Web.git

# Lancement du Docker
docker-compose -f ~/.docker/PW-Docker-Web/docker-compose.yml up -d