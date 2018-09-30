Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing TOPdeskPS master"
Install-Module TOPdeskPS -ErrorAction Stop -Force

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing platyPS from gallery"
Install-Module platyPS -ErrorAction Stop -Force

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing PSFramework from gallery"
Install-Module PSFramework -ErrorAction Stop -Force