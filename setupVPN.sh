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

# Copie du service VPN
git -C ~/.docker clone https://github.com/kylemanna/docker-openvpn.git

#Build de l'image
docker build -t docker-openvpn ~/.docker/docker-openvpn

#Création de l'espace de stockage des données openvpn
mkdir -p /etc/openvpn-conf

#Configuration de l'openvpn
docker run -v /etc/openvpn-conf:/etc/openvpn --rm docker-openvpn ovpn_genconfig -u udp://$(hostname -I | awk '{print $1}'):1194
sleep 5
#Génération des certificats
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -it docker-openvpn ovpn_initpki
sleep 5
#Lancement du server
docker run -v /etc/openvpn-conf:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN docker-openvpn