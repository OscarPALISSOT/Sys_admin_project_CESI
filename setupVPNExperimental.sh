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

#Génération des certificats
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa init-pki -y
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa build-ca
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa gen-dh
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn openvpn --genkey --secret /etc/openvpn/pki/ta.key
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa build-server-full "$OVPN_CN" nopass
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa gen-crl
#Lancement du server
docker run -v /etc/openvpn-conf:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN docker-openvpn