#!/bin/bash

# Test si root ou sudo
if [[ $EUID -eq 0 ]]; then
    echo "Lancement de configuration du serveur de Supervision"
else
    echo "Merci de lancer en root ou sudo."
    exit 1
fi

# Création du réseau inter-docker
docker network create centnet
docker network connect centnet centreon
docker network connect centnet centreon-db

# Autoriser centreon à se connecter à MariaDB
docker exec -i centreon-db sed -i 's/\[client-server]/[client-server]\nbind-address=0.0.0.0/' /etc/mysql/my.cnf

# Ajouter le compte de centreon sur MariaDB
docker exec -i centreon-db mysql -psecret mysql <<EOF
CREATE USER 'centreon'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON *.* TO 'centreon'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Lien symbolique pour config centreon
docker exec -i centreon mkdir /usr/lib/centreon/
docker exec -i centreon ln -s /usr/lib/nagios/plugins/ /usr/lib/centreon/