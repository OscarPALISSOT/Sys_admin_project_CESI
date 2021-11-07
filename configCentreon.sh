#!/bin/bash

# test si root ou sudo
if [[ $EUID -eq 0 ]]; then
    echo "Lancement de l'installation du serveur de Supervision"
else
    echo "Merci de lancer en root ou sudo."
    exit 1
fi

# ajout compte
docker exec -i centreon-db mysql -psecret mysql <<EOF
CREATE USER 'centreon'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON *.* TO 'centreon'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# subnetwork
docker network connect bridge centreon-db

#Lien symbolique pour config centreon
docker exec -i centreon mkdir /usr/lib/centreon/
docker exec -i centreon ln -s /usr/lib/nagios/plugins/ /usr/lib/centreon/
