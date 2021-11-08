<# ajout de AD-Domain-Services #>

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Install-ADDSDomainController -InstallDns -Credential (Get-Credential "ABSTERGO\Administrateur") -DomainName "abstergo.local"