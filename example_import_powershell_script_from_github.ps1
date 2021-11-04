
<# modèle méthode importation script #>

$ScriptFromGitHub = Invoke-WebRequest l_url_du_script
Invoke-Expression $($ScriptFromGitHub.Content)