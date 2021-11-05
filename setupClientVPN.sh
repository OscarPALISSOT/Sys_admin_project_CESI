#!/bin/bash

# test si root ou sudo
if [[ $EUID -eq 0 ]]; then
    echo "Lancement de la création des comptes VPN"
else
    echo "Merci de lancer en root ou sudo."
    exit 1
fi

read -p "Nombre d'utilisateurs à créer : " numberuser

for ((i = 1; i <= numberuser; i++))
do
  docker run -v /etc/openvpn-conf:/etc/openvpn --rm -it docker-openvpn easyrsa build-client-full "user$i" nopass
  docker run -v /etc/openvpn-conf:/etc/openvpn --rm docker-openvpn ovpn_getclient "user$i" > "user$i.ovpn"
done

