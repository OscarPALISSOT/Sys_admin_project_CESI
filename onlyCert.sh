#!/bin/bash

docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa init-pki
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa build-ca
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa gen-dh
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn openvpn --genkey --secret /etc/openvpn/pki/ta.key
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa build-server-full "$OVPN_CN" nopass
docker run -v /etc/openvpn-conf:/etc/openvpn --rm -i docker-openvpn easyrsa gen-crl