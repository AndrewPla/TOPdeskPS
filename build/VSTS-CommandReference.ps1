Write-Host "###############################################################"
Write-Host " - "
Write-Host "Importing Required modules"
Write-Host "  Importing TOPdeskPS"
Import-Module TOPdeskPS -Force
Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "

$commandReferenceBasePath = "$($env:SYSTEM_DEFAULTWORKINGDIRECTORY)\docs\commands"

#region TOPdeskPS
$moduleName = "TOPdeskPS"
$excludedCommands = @("New-PSFTeppCompletionResult")
Write-PSFMessage -Level Host -Message "Processing $moduleName"
Write-PSFMessage -Level Host -Message "  Creating list of commands to process"
$commands = Get-Command -Module $moduleName -CommandType Function, Cmdlet | Select-Object -ExpandProperty Name | Where-Object {
	$_ -notin $excludedCommands
} | Sort-Object
Write-PSFMessage -Level Host -Message "  $($commands.Count) commands found"

Write-PSFMessage -Level Host -Message "  Creating markdown help files"
Remove-Item "$($commandReferenceBasePath)\$($moduleName)" -Recurse -ErrorAction Ignore
$null = New-Item "$($commandReferenceBasePath)\$($moduleName)" -ItemType Directory
$null = New-MarkdownHelp -Command $commands -OutputFolder "$($commandReferenceBasePath)\$($moduleName)"

Write-PSFMessage -Level Host -Message "  Creating index file"
Set-Content -Path "$($commandReferenceBasePath)\$($moduleName).md" -Value @"
# $moduleName Command Reference

"@ -Encoding Ascii

foreach ($command in $commands) {
	Add-Content -Path "$($commandReferenceBasePath)\$($moduleName).md" -Value " - [$command]($($moduleName)/$command.html)"
}
Write-PSFMessage -Level Host -Message "Finished processing $moduleName"
#endregion TOPdeskPS

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "

$branch = $env:BUILD_SOURCEBRANCHNAME
Write-PSFMessage -Level Host -Message "Applying documentation to repository"

git config user.name "AndrewPla"
git config user.email "AndrewPla@Outlook.com"
git add .
git commit -m "VSTS Documentation Update ***NO_CI***"
$errorMessage = git push "https://$env:SYSTEM_ACCESSTOKEN@github.com/AndrewPla/TOPdeskPS.git" head:$branch 2>&1
if ($LASTEXITCODE -gt 0) {
	throw $errorMessage
}