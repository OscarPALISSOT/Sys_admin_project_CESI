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

# Installation container db
docker run -itd --net=bridge -e MYSQL_ROOT_PASSWORD=secret  --name centreon-db  mariadb
# modif cnf
docker exec -i centreon-db sed -i 's/\[server-client]/[server-client]\nbind-address O.O.O.O/' /etc/mysql/my.cnf
# ajout compte
sleep 5
docker exec -i centreon-db mysql -psecret mysql <<EOF
CREATE USER 'admin'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Copie du service Centreon
git -C ~/.docker clone --recurse-submodules https://github.com/KNFreed/docker-centreon.git
wget https://raw.githubusercontent.com/OscarPALISSOT/projet-SI/main/VMware-vSphere-Perl-SDK-6.5.0-4566394.x86_64.tar.gz -P ~/.docker/docker-centreon/buildenv/files/other/vmware
#sed -i 's/VMware-vSphere-Perl-SDK-6.5.0-4566394.x86_64.tar.gz/VMware-vSphere-Perl-SDK-7.0.0-16453907.x86_64.tar.gz/g' ~/.docker/docker-centreon/CONFIG
# Execution du script de build
(cd ~/.docker/docker-centreon && ./build.sh)

# Execution du script de run
(cd ~/.docker/docker-centreon && ./run.sh)

# subnetwork