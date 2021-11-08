class User {
    [string]$GivenName
    [string]$SurName
    [string]$AccountPassword
    [string]$Name
    [string]$SamAccountName
    [string]$UserPrincipalName
    [string]$OU
}

function CreateUser {
    $NewUser = [User]::new()
    $NewUser.GivenName = Read-Host "Entrez le prénom "
    $NewUser.SurName = Read-Host "Entrez le nom "
    $NewUser.AccountPassword = Read-Host "Entrez le mot de passe "
    $NewUser.Name = $NewUser.GivenName + " " + $NewUser.SurName
    $NewUser.SamAccountName = $NewUser.GivenName + $NewUser.SurName
    $NewUser.UserPrincipalName = $NewUser.SamAccountName + "@abstergo.local"
    Get-ADOrganizationalUnit -Filter * | Format-Table Name
    $NewUser.OU = Read-Host "Entrez une OU "
    New-ADUser `
     -Name $NewUser.Name `
     -GivenName $NewUser.GivenName `
     -Surname $NewUser.SurName `
     -SamAccountName $NewUser.SamAccountName `
     -UserPrincipalName $NewUser.UserPrincipalName `
     -Path $NewUser.OU + ",DC=abstergo,DC=local" `
     -AccountPassword (ConvertTo-SecureString $NewUser.AccountPassword -AsPlainText -force) `
     -Enabled $true `
     -ChangePasswordAtLogon $true
}


Write-Output "Que voulez vous faire ?"
Write-Output "1 : Creer un utilisateur"
Write-Output "2 : Creer une unite d'organisation"
Write-Output "3 : Creer un groupe"
Write-Output "4 : ajouter un utilisateur dans un groupe"
Write-Output "5 : Supprimer un utilisateur"
Write-Output "6 : Supprimer une unité d'organisation"
Write-Output "7 : Supprimer un groupe"
Write-Output "8 : Supprimer un utilisateur dans un groupe"

$choice = Read-Host "Votre choix "

switch ( $choice )
{
    1 {   CreateUser  }
    2 {   Write-Output "test2" }
    3 {  Write-Output "test"}
    4 { Write-Output "test"  }
    5 {   Write-Output "test"  }
    6 {  Write-Output "test" }
    7 {  Write-Output "test" }
    8 { Write-Output "test" }
}



