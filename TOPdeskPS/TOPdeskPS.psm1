$script:ModuleRoot = $PSScriptRoot
$script:ModuleVersion = "0.0.11" #(Invoke-Expression (Get-Content "$ModuleRoot\TOPdeskPS.psd1" -Raw)).ModuleVersion

# Declare directory separating character for X-Plat compatibility
$script:dc = [System.IO.Path]::DirectorySeparatorChar

$script:__LoginToken = $null
function Import-ModuleFile {
    <#
		.SYNOPSIS
			Loads files into the module on module import.

		.DESCRIPTION
			This helper function is used during module initialization.
			It should always be dotsourced itself, in order to proper function.

			This provides a central location to react to files being imported, if later desired

		.PARAMETER Path
			The path to the file to load

		.EXAMPLE
			PS C:\> . Import-ModuleFile -File $function.FullName

			Imports the file stored in $function according to import policy
	#>
    [CmdletBinding()]
    Param (
        [string]
        $Path
    )

    if ($doDotSource) { . $Path }
    else { $ExecutionContext.InvokeCommand.InvokeScript($false, ([scriptblock]::Create([io.file]::ReadAllText($Path))), $null, $null) }
}

# Detect whether at some level dotsourcing was enforced
$script:doDotSource = Get-PSFConfigValue -FullName TOPdeskPS.Import.DoDotSource -Fallback $false
if ($TOPdeskPS_dotsourcemodule) { $script:doDotSource = $true }

# Execute Preimport actions
. Import-ModuleFile -Path "$ModuleRoot$($dc)internal$($dc)scripts$($dc)preimport.ps1"

# Import all internal functions
foreach ($function in (Get-ChildItem "$ModuleRoot$($dc)internal$($dc)functions" -Filter "*.ps1" -Recurse -ErrorAction Ignore)) {
    . Import-ModuleFile -Path $function.FullName
}

# Import all public functions
foreach ($function in (Get-ChildItem "$ModuleRoot$($dc)functions" -Filter "*.ps1" -Recurse -ErrorAction Ignore)) {
    . Import-ModuleFile -Path $function.FullName
}

# Execute Postimport actions
. Import-ModuleFile -Path "$ModuleRoot$($dc)internal$($dc)scripts$($dc)postimport.ps1"
