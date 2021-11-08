
<# changement du dns #>
Set-DnsClientServerAddress -InterfaceIndex 9 -ServerAddresses ("192.168.106.3","192.168.106.6","8.8.8.8")

<# ajout au domaine #>
add-computer –domainname abstergo.local -Credential ABSTERGO\administrateur -restart –force

