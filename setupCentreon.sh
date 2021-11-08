#!/bin/bash

# test si root ou sudo
if [[ $EUID -eq 0 ]]; then
    echo "Lancement de l'installation du serveur de Supervision"
else
    echo "Merci de lancer en root ou sudo."
    exit 1
fi

# Création du dossier répertoire de nos Docker
mkdir -p ~/.docker
chmod 777 ~/.docker



# Copie du service Centreon
git -C ~/.docker clone --recurse-submodules https://github.com/KNFreed/docker-centreon.git
wget https://raw.githubusercontent.com/OscarPALISSOT/projet-SI/main/VMware-vSphere-Perl-SDK-6.5.0-4566394.x86_64.tar.gz -P ~/.docker/docker-centreon/buildenv/files/other/vmware

# Execution du script de build
(cd ~/.docker/docker-centreon && ./build.sh)

# Execution du script de démarrage de Centreon
(cd ~/.docker/docker-centreon && ./run.sh)

# Installation de la bdd
docker-compose -f ~/.docker/docker-centreon/docker-compose.yml up -d

#Affichage de l'IP
echo http://$(hostname -I | awk '{print $1}'):8080