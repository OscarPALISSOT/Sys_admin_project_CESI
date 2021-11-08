<# installation service DNS #>

Install-WindowsFeature DNS -IncludeManagementTools

<# ajout des serveur du lan #>
Add-DnsServerResourceRecordA -Name ipbx -ZoneName abstergo.local -IPv4Address 192.168.106.5
Add-DnsServerResourceRecordA -Name fallback -ZoneName abstergo.local -IPv4Address 192.168.106.6

<# intranet #>
Add-DnsServerResourceRecordA -Name fallback -ZoneName abstergo.local -IPv4Address 192.168.105.11