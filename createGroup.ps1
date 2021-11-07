New-ADGroup "communication" -Path "OU=communication,DC=abstergo,dc=local" -GroupScope Global
Add-AdGroupMember -Identity communication -Members Com1, Com2

New-ADGroup "compta" -Path "OU=compta,DC=abstergo,dc=local" -GroupScope Global
Add-AdGroupMember -Identity compta -Members Compta1, Compta2

New-ADGroup "direction" -Path "OU=direction,DC=abstergo,dc=local" -GroupScope Global
Add-AdGroupMember -Identity direction -Members Pdg1

New-ADGroup "marketing" -Path "OU=marketing,DC=abstergo,dc=local" -GroupScope Global
Add-AdGroupMember -Identity marketing -Members Marketing1, Marketing2

New-ADGroup "recherche" -Path "OU=recherche,DC=abstergo,dc=local" -GroupScope Global
Add-AdGroupMember -Identity recherche -Members 'R&D1', 'R&D2'

New-ADGroup "abstergo"  -GroupScope Global
Add-AdGroupMember -Identity abstergo -Members Com1, Com2, Compta1, Compta2, Pdg1, Marketing1, Marketing2, 'R&D1', 'R&D2'