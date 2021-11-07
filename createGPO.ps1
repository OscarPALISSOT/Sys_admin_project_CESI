New-GPO -Name "abstergoGPO" -Comment "GPO par défaut"
New-GPLink -Name "abstergoGPO" -Target "ou=compta,dc=abstergo,dc=local"