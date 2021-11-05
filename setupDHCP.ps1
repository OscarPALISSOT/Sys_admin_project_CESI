<# mise en place du DHCP #>

<# installation role #>
Install-WindowsFeature -Name DHCP -IncludeManagementTools

<# ajout du groupe secu DHCP #>
Add-DhcpServerSecurityGroup

Restart-Service dhcpserver

<# ajout dans le domaine #>
Add-DhcpServerInDC -DnsName Master.abstergo.local -IPAddress 192.168.106.3

<# création de la pool lan #>
Add-DhcpServerV4Scope -Name "Lan" -StartRange 192.168.106.100 -EndRange 192.168.106.250 -SubnetMask 255.255.255.0

<# gateway et dns #>
Set-DhcpServerV4OptionValue -DnsServer 192.168.106.3 -Router 192.168.106.2
Set-DhcpServerv4Scope -ScopeId 192.168.106.3 -LeaseDuration 8.00:00:00
Set-DhcpServerv4OptionDefinition -OptionId 15 -DefaultValue abstergo.local


Restart-service dhcpserver
