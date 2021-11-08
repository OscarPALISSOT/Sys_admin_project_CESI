class User {
    [string]$GivenName
    [string]$SurName
    [string]$Name
    [string]$SamAccountName
    [string]$UserPrincipalName
    [string]$OU
}

function CreateUser {
    $NewUser = [User]::new()
    $NewUser.GivenName = Read-Host "Entrez le prenom "
    $NewUser.SurName = Read-Host "Entrez le nom "
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
     -Path ("OU=" + $NewUser.OU + ",DC=abstergo,DC=local") `
     -AccountPassword(Read-Host -AsSecureString "Entrez le mot de passe") `
     -Enabled $true `
     -ChangePasswordAtLogon $true
}

function RemoveUser {
    $user = Read-Host "Entrez l'utlisateur a supprimer "
    Remove-ADUser -Identity $user
}

function CreateOU {
    $OuName = Read-Host "Entrez le nom de l'ou"
    New-ADOrganizationalUnit -Name $OuName -Path "DC=abstergo,DC=local" -ProtectedFromAccidentalDeletion $False
}

function RemoveOU {
    $OuName = Read-Host "Entrez le nom de l'ou"
    Remove-ADOrganizationalUnit -Identity ("OU=" + $OuName + ",DC=abstergo,DC=local") -Recursive
}

function Creategroup {
    $Groupname = Read-Host "Entrez le nom du groupe"
    Get-ADOrganizationalUnit -Filter 'Name -like "*"' | Format-Table Name
    $Ou = Read-Host "Dans quelle OU voulez vous creer le groupe ?"
    New-ADGroup $Groupname -Path ("OU=" + $Ou + ",DC=abstergo,dc=local") -GroupScope Global
}

function RemoveGroup {
    $Groupname = Read-Host "EntreZ le nom du groupe"
    Remove-ADGroup -Identity $Groupname
}

function AddToGroup {
    $Groupname = Read-Host "Entrez le nom du groupe "
    $User = Read-Host "Entrez l'utilisateur a ajouter"
    Add-AdGroupMember -Identity $Groupname -Members $User
}

function RemoveToGroup {
    $Groupname = Read-Host "Entrez le nom du groupe "
    $User = Read-Host "Entrez l'utilisateur a ajouter"
    Remove-ADGroupMember -Identity $Groupname -Members $User
}

Write-Output "Que voulez vous faire ?"
Write-Output "1 : Creer un utilisateur"
Write-Output "2 : Creer une unite d'organisation"
Write-Output "3 : Creer un groupe"
Write-Output "4 : ajouter un utilisateur dans un groupe"
Write-Output "5 : Supprimer un utilisateur"
Write-Output "6 : Supprimer une unite d'organisation"
Write-Output "7 : Supprimer un groupe"
Write-Output "8 : Supprimer un utilisateur dans un groupe"

$choice = Read-Host "Votre choix "

switch ( $choice )
{
    1 { CreateUser }
    2 { CreateOU }
    3 { Creategroup }
    4 { AddToGroup }
    5 { RemoveUser }
    6 { RemoveOU }
    7 { RemoveGroup }
    8 { RemoveToGroup }
}



