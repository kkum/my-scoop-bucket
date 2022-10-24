$kpPath = Split-Path $(scoop which keepass.exe) -Parent -Resolve
$gcPath = Join-Path $kpPath -ChildPath "Plugins/git-credential-keepasscommand.exe"
Write-Host "Updating git Credential Helper for user $gcPath"

git config --global --unset credential.helper
git config --global credential.helper $gcPath