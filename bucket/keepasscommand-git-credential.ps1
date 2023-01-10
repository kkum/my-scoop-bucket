$kpPath = Split-Path $(scoop which keepass.exe) -Parent -Resolve
$gcPath = (join-Path $kpPath -ChildPath "Plugins/git-credential-keepasscommand.exe") -replace '\\','/' 
Write-Host "Updating git Credential Helper for user $gcPath"
    git config --unset credential.helper
    git config credential.helper "$gcPath"
