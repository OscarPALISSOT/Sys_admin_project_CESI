#!/bin/bash

# test si root ou sudo
if [[ $EUID -eq 0 ]]; then
    echo "Lancement de l'installation du serveur Web"
else
    echo "Merci de lancer en root ou sudo."
    exit 1
fi

# Création du dossier répertoire de nos Docker
mkdir -p ~/.docker
chmod 777 ~/.docker

# Copie du service Telecom
git -C ~/.docker clone https://github.com/wazo-platform/wazo-docker.git

#Copie des images locales du service telecom
mkdir -p ~/.docker/wazo_local
chmod 777 ~/.docker/wazo_local

git -C ~/.docker/wazo_local clone https://github.com/wazo-platform/wazo-asterisk-config.git
git -C ~/.docker/wazo_local clone https://github.com/wazo-platform/wazo-auth.git
git -C ~/.docker/wazo_local clone https://github.com/wazo-platform/wazo-auth-keys.git
git -C ~/.docker/wazo_local clone https://github.com/wazo-platform/xivo-manage-db.git

#Création de l'environnement
echo "LOCAL_GIT_REPOS=~/.docker/wazo_local" > ~/.docker/wazo-docker/.env

# Lancement du Docker
docker-compose -f ~/.docker/wazo-docker/docker-compose.yml up -d