<# Script de la configuration réseau du master server #>

<# Changement de nom de la machine #>
Rename-Computer -NewName Master -Force

<# changement de l'ip  #>
New-NetIPAddress -IPAddress "192.168.106.1" -PrefixLength "24" -InterfaceIndex (Get-NetAdapter).ifIndex -DefaultGateway "192.168.106.254"

<# changement du dns #>
Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).ifIndex -ServerAddresses ("127.0.0.1")

<# changement de nom de la carte réseau #>
Rename-NetAdapter -Name Ethernet0 -NewName LAN

Restart-Computer