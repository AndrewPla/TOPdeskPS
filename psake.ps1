# This was stolen from https://github.com/RamblingCookieMonster/PSSlack/blob/master/psake.ps1
# RamblingCookieMonster is awesome
Properties {
    Set-BuildEnvironment -Force
    # Find the build folder based on build system
    $ProjectRoot = $ENV:BHProjectPath
    if (-not $ProjectRoot) {
        $ProjectRoot = $PSScriptRoot
    }

    $Timestamp = Get-date -uformat "%Y%m%d-%H%M%S"
    $PSVersion = $PSVersionTable.PSVersion.Major
    $TestFile = "TestResults_PS$PSVersion`_$TimeStamp.xml"
    $lines = '----------------------------------------------------------------------'

    $Verbose = @{}
    if ($ENV:BHCommitMessage -match "!verbose") {
        $Verbose = @{Verbose = $True}
    }
}

Task Default -Depends Test

Task Init {
    $lines
    Set-Location $ProjectRoot
    "Build System Details:"
    Get-Item ENV:BH*
    "`n"
}

Task Test -Depends Init {
    $lines
    "`n`tSTATUS: Testing with PowerShell $PSVersion"

    # Gather test results. Store them in a variable and file
    #$TestResults = Invoke-Pester -Path $ProjectRoot\Tests -PassThru -OutputFormat NUnitXml -OutputFile "$ProjectRoot\$TestFile"


    # Failed tests?
    # Need to tell psake or it will proceed to the deployment. Danger!

    try {
        & "$ProjectRoot\TOPdeskPS\tests\pester.ps1" -Show 'fails'
    }
    catch {
        Write-Error "Failed tests, build failed"
    }

    # In Appveyor?  Upload our tests! #Abstract this into a function?
    # We don't use appveyor on this project, but let's leave this here for the next person who copies this.
    If ($ENV:BHBuildSystem -eq 'AppVeyor') {
        (New-Object 'System.Net.WebClient').UploadFile(
            "https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)",
            "$ProjectRoot\$TestFile" )
    }

    Remove-Item "$ProjectRoot\$TestFile" -Force -ErrorAction SilentlyContinue

    # if ($TestResults.FailedCount -gt 0) {
    # Write-Error "Failed '$($TestResults.FailedCount)' tests, build failed"
    #}
    "`n"
}


Task Build -Depends Test {
    $lines

    # Load the module, read the exported functions, update the psd1 FunctionsToExport
    Set-ModuleFunctions @Verbose

    # Bump the module version if we didn't manually bump it
    Try {
        $GalleryVersion = Get-NextNugetPackageVersion -Name $env:BHProjectName -ErrorAction Stop
        $GithubVersion = Get-MetaData -Path $env:BHPSModuleManifest -PropertyName ModuleVersion -ErrorAction Stop
        if ($GalleryVersion -ge $GithubVersion) {
            Update-Metadata -Path $env:BHPSModuleManifest -PropertyName ModuleVersion -Value $GalleryVersion -ErrorAction stop
        }
    }
    Catch {
        "Failed to update version for '$env:BHProjectName': $_.`nContinuing with existing version"
    }


    # Generate Markdown Docs
    $docspath = "$ProjectRoot\docs\commands"
    $excludedCommands = @("")
    Import-Module $env:bhpsmodulemanifest -force
        $commands = Get-Command -Module $env:BHProjectName -CommandType Function, Cmdlet | Select-Object -ExpandProperty Name | Where-Object {
        $_ -notin $excludedCommands
    } | Sort-Object

    Write-PSFMessage -Level Verbose -Message "  Creating markdown help files"
    Remove-Item "$($docsPath)\$($env:BHProjectName)" -Recurse -ErrorAction Ignore
    $null = New-Item "$($docsPath)\$($env:BHProjectName)" -ItemType Directory
    $null = New-MarkdownHelp -Command $commands -OutputFolder "$($docsPath)\$($env:BHProjectName)"

    Write-PSFMessage -Level Verbose -Message "  Creating index file"
    Set-Content -Path "$($docsPath)\$($env:BHProjectName).md" -Value @"
# $env:BHProjectName Command Reference

"@ -Encoding Ascii

    foreach ($command in $commands) {
        Add-Content -Path "$($docsPath)\$($env:BHProjectName).md" -Value " - [$command]($($env:BHProjectName)/$command.html)"
    }
}

Task Deploy -Depends Build {
    $lines

    $Params = @{
        Path = $ProjectRoot
        Force = $true
        Recurse = $false # We keep psdeploy artifacts, avoid deploying those : )
    }
    Invoke-PSDeploy @Verbose @Params
}
