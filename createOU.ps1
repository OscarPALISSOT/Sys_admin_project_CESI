New-ADOrganizationalUnit -Name "direction"
New-ADUser -Name "Pdg 1" -GivenName "Pdg" -Surname "1" -SamAccountName "Pdg1" -UserPrincipalName "Pdg1@abstergo.fr" -Path "OU=direction,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true

New-ADOrganizationalUnit -Name "compta"
New-ADUser -Name "Compta 1" -GivenName "Compta" -Surname "1" -SamAccountName "Compta1" -UserPrincipalName "Compta1@abstergo.fr" -Path "OU=compta,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true
New-ADUser -Name "Compta 2" -GivenName "Compta" -Surname "2" -SamAccountName "Compta2" -UserPrincipalName "Compta2@abstergo.fr" -Path "OU=compta,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true

New-ADOrganizationalUnit -Name "marketing"
New-ADUser -Name "Maketing 1" -GivenName "Maketing" -Surname "1" -SamAccountName "Maketing1" -UserPrincipalName "Maketing1@abstergo.fr" -Path "OU=marketing,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true
New-ADUser -Name "Maketing 2" -GivenName "Maketing" -Surname "2" -SamAccountName "Maketing2" -UserPrincipalName "Maketing2@abstergo.fr" -Path "OU=marketing,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true

New-ADOrganizationalUnit -Name "com"
New-ADUser -Name "Com 1" -GivenName "Com" -Surname "1" -SamAccountName "Com1" -UserPrincipalName "Com1@abstergo.fr" -Path "OU=com,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true
New-ADUser -Name "Com 2" -GivenName "Com" -Surname "2" -SamAccountName "Com2" -UserPrincipalName "Com2@abstergo.fr" -Path "OU=com,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true

New-ADOrganizationalUnit -Name "recherche"
New-ADUser -Name "R&D 1" -GivenName "R&D" -Surname "1" -SamAccountName "R&D1" -UserPrincipalName "R&D1@abstergo.fr" -Path "OU=recherche,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true
New-ADUser -Name "R&D 2" -GivenName "R&D" -Surname "2" -SamAccountName "R&D2" -UserPrincipalName "R&D2@abstergo.fr" -Path "OU=recherche,DC=abstergo,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -force) -Enabled $true -ChangePasswordAtLogon $true