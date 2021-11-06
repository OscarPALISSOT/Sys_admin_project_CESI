<# mise en place du DHCP #>

<# installation role #>
Install-WindowsFeature -Name DHCP -IncludeManagementTools

<# ajout du groupe secu DHCP #>
Add-DhcpServerSecurityGroup

Restart-Service dhcpserver

<# création de la pool lan #>
Add-DhcpServerV4Scope -Name "Lan" -StartRange 192.168.106.100 -EndRange 192.168.106.250 -SubnetMask 255.255.255.0 -State Active

<# gateway et dns #>
Set-DhcpServerV4OptionValue -DnsServer 192.168.106.3 -Router 192.168.106.99
Set-DhcpServerv4Scope -ScopeId 192.168.106.3 -LeaseDuration 8.00:00:00

Restart-service dhcpserver

<# ajout dans le domaine #>
Add-DhcpServerInDC -DnsName Master.abstergo.local -IPAddress 192.168.106.3

Restart-service dhcpserver

Set-ItemProperty –Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 –Name ConfigurationState –Value 2

Restart-service dhcpserver