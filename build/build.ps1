param([string[]]$Task = 'Default', $apikey)

# Grab nuget bits, install modules, set build variables, start build.
#Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
$modules =  'Psake', 'PSDeploy', 'Pester', 'BuildHelpers', 'psframework', 'psscriptanalyzer', 'platyps'

foreach ($module in $modules){
  "Installing Module $module"
  "###############################################################"
    Install-Module $module -force
}
Import-Module Psake, BuildHelpers

Set-BuildEnvironment -Force

$psakeParams = @{
    buildfile = "$env:BHProjectPath\build\psake.ps1"
    tasklist = $task
    nologo = $true
    Verbose = $VerbosePreference
}

if ($apikey) { $psakeParams['parameters'] = @{psgallery = $apikey}
}

Invoke-psake @psakeParams
exit ( [int]( -not $psake.build_success ) )
