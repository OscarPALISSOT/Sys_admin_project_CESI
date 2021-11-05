<# creation du domain #>

<# ajout de (AD-Domain-Services), le DNS (DNS) et les outils d'administration graphique (RSAT-AD-Tools) #>

$FeatureList = @("RSAT-AD-Tools","AD-Domain-Services","DNS")

Foreach($Feature in $FeatureList){

   if(((Get-WindowsFeature-Name $Feature).InstallState)-eq"Available"){

     Write-Output"Feature $Feature will be installed now !"

     Try{

        Add-WindowsFeature-Name $Feature-IncludeManagementTools -IncludeAllSubFeature

        Write-Output"$Feature : Installation is a success !"

     }Catch{

        Write-Output"$Feature : Error during installation !"
     }
   } # if(((Get-WindowsFeature -Name $Feature).InstallState) -eq "Available")
} # Foreach($Feature in $FeatureList)

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
