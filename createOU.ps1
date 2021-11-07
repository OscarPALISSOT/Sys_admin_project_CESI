New-ADOrganizationalUnit -Name "direction"
New-ADUser -Name "Pdg 1" -GivenName "Pdg" -Surname "1" -SamAccountName "Pdg1" -UserPrincipalName "Pdg1@abstergo.fr" -Path "OU=direction,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true

New-ADOrganizationalUnit -Name "compta"
New-ADUser -Name "Compta 1" -GivenName "Compta" -Surname "1" -SamAccountName "Compta1" -UserPrincipalName "Compta1@abstergo.fr" -Path "OU=compta,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true
New-ADUser -Name "Compta 2" -GivenName "Compta" -Surname "2" -SamAccountName "Compta2" -UserPrincipalName "Compta2@abstergo.fr" -Path "OU=compta,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true

New-ADOrganizationalUnit -Name "marketing"
New-ADUser -Name "Marketing 1" -GivenName "Marketing" -Surname "1" -SamAccountName "Marketing1" -UserPrincipalName "Marketing1@abstergo.fr" -Path "OU=marketing,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true
New-ADUser -Name "Marketing 2" -GivenName "Marketing" -Surname "2" -SamAccountName "Marketing2" -UserPrincipalName "Marketing2@abstergo.fr" -Path "OU=marketing,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true

New-ADOrganizationalUnit -Name "communication"
New-ADUser -Name "Com 1" -GivenName "Com" -Surname "1" -SamAccountName "Com1" -UserPrincipalName "Com1@abstergo.local" -Path "OU=communication,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true
New-ADUser -Name "Com 2" -GivenName "Com" -Surname "2" -SamAccountName "Com2" -UserPrincipalName "Com2@abstergo.local" -Path "OU=communication,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true

New-ADOrganizationalUnit -Name "recherche"
New-ADUser -Name "R&D 1" -GivenName "R&D" -Surname "1" -SamAccountName "R&D1" -UserPrincipalName "R&D1@abstergo.local" -Path "OU=recherche,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true
New-ADUser -Name "R&D 2" -GivenName "R&D" -Surname "2" -SamAccountName "R&D2" -UserPrincipalName "R&D2@abstergo.local" -Path "OU=recherche,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true
