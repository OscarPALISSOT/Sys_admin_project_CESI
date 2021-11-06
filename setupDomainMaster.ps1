<# creation du domain #>

<# ajout de DNS et (AD-Domain-Services) #>
Install-WindowsFeature DNS
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

<# creation domain #>

$DomainNameDNS = "abstergo.local"
$DomainNameNetbios = "ABSTERGO"

$ForestConfiguration = @{
'-DatabasePath'= 'C:\Windows\NTDS';
'-DomainMode' = 'Default';
'-DomainName' = $DomainNameDNS;
'-DomainNetbiosName' = $DomainNameNetbios;
'-ForestMode' = 'Default';
'-InstallDns' = $true;
'-LogPath' = 'C:\Windows\NTDS';
'-NoRebootOnCompletion' = $false;
'-SysvolPath' = 'C:\Windows\SYSVOL';
'-Force' = $true;
'-CreateDnsDelegation' = $false }

Import-Module ADDSDeployment
Install-ADDSForest @ForestConfiguration
