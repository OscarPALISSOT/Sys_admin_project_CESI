<# Script de la configuration réseau du master server #>

<# Changement de nom de la machine #>
Rename-Computer -NewName Fallback -Force

<# changement de l'ip  #>
New-NetIPAddress -IPAddress "192.168.106.6" -PrefixLength "24" -InterfaceIndex (Get-NetAdapter).ifIndex -DefaultGateway "192.168.106.99"

<# changement du dns #>
Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).ifIndex -ServerAddresses ("192.168.106.3", "127.0.0.1", "8.8.8.8")

<# changement de nom de la carte réseau #>
Rename-NetAdapter -Name Ethernet0 -NewName LAN

Restart-Computer
