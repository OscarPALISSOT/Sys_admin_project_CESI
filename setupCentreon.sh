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
#sed -i 's/VMware-vSphere-Perl-SDK-6.5.0-4566394.x86_64.tar.gz/VMware-vSphere-Perl-SDK-7.0.0-16453907.x86_64.tar.gz/g' ~/.docker/docker-centreon/CONFIG
# Execution du script de build
(cd ~/.docker/docker-centreon && ./build.sh)

# Execution du script de run
(cd ~/.docker/docker-centreon && ./run.sh)

#Lien symbolique pour config centreon
docker exec -i centreon mkdir /usr/lib/centreon/
docker exec -i centreon ln -s /usr/lib/nagios/plugins/ /usr/lib/centreon/

# Installation de la bdd
docker-compose -f ~/.docker/docker-centreon/docker-compose.yml up -d

# modif cnf
docker exec -i centreon-db sed -i 's/\[client-server]/[client-server]\n[mysqld]\nbind-address=0.0.0.0/' /etc/mysql/my.cnf
# ajout compte
docker exec -i centreon-db mysql -psecret mysql <<EOF
CREATE USER 'centreon'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON *.* TO 'centreon'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# subnetwork
docker network connect bridge centreon-db

