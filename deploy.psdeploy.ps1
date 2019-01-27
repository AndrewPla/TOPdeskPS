# This was stoeln from RamblingCookieMonster
# Generic module deployment.
#
# ASSUMPTIONS:
#
# * folder structure either like:
#
#   - RepoFolder
#     - This PSDeploy file
#     - ModuleName
#       - ModuleName.psd1
#
#   OR the less preferable:
#   - RepoFolder
#     - RepoFolder.psd1
#
# * Nuget key in $ENV:NugetApiKey
#
# * Set-BuildEnvironment from BuildHelpers module has populated ENV:BHModulePath and related variables

# Publish to gallery with a few restrictions
if (
    $env:BHPSModulePath -and
    $env:BHBuildSystem -ne 'Unknown' -and
    $env:BHBranchName -eq "master" -and
    $env:BHCommitMessage -match '!deploy'
) {
    Deploy Module {
        By PSGalleryModule {
            FromSource $ENV:BHPSModulePath
            To PSGallery
            WithOptions @{
                ApiKey = $testingapikey
            }
        }
    }
}
else {
    "Skipping deployment: To deploy, ensure that...`n" +
    "`t* ENV:BHModulePath is set (Current [$([bool]$env:BHPSModulePath)]: $ENV:BHPSModulePath)`n" +
    "`t* You are in a known build system (Current [$($env:BHBuildSystem -ne 'Unknown')]: $ENV:BHBuildSystem)`n" +
    "`t* You are committing to the master branch (Current [$($env:BHBranchName -eq "master")]: $ENV:BHBranchName) `n" +
    "`t* Your commit message includes !deploy (Current [$($env:BHCommitMessage -match '!deploy')]: $ENV:BHCommitMessage)" |
        Write-Host
}
