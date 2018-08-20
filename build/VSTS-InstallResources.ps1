Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing TOPdeskPS master"
Invoke-WebRequest "https://raw.githubusercontent.com/AndrewPla/TOPdeskPS/master/install.ps1" -UseBasicParsing | Invoke-Expression

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing platyPS from gallery"
Install-Module platyPS -ErrorAction Stop -Force