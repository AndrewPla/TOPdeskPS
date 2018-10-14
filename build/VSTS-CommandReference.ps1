$commandReferenceBasePath = "$PSScriptRoot\..\docs\commands"
$commandReferenceBasePath
#region TOPdeskPS
$moduleName = "TOPdeskPS"
$excludedCommands = @("")
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
