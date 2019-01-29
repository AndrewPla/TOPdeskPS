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

    # setup the apikey
    $key = $env:psgallery

}

Task Default -Depends Test

Task Init {
    $lines
    Set-Location $ProjectRoot
    "Build System Details:"
    Get-Item ENV:BH*
    "`n"
}

Task UpdateModule -Depends Init {
    # Grab all of the functions inside of our functions folder. This avoids any private functions that we don't want to export.
    $functionsToExport = Get-ChildItem "$env:BHProjectPath\topdeskps\functions" -Recurse -Filter '*.ps1' |
        Select -ExpandProperty Basename |
        Sort-Object

    Set-ModuleFunctions -FunctionsToExport $functionsToExport @Verbose



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

    # Set the value of $script:ModuleVersion in the .psm1. This is consumed by the license functionality of psframework.
    try {
        $currentVersion = Get-Metadata -path $env:BHPSModuleManifest
        $psm1Content = Get-Content "$projectroot\topdeskps\topdeskps.psm1"
        $oldVersion = $psm1Content -like '$script:ModuleVersion =*'
        $newVersion = '$script:ModuleVersion = "{0}"' -f $currentversion
        $newpsm1Content = $psm1content.replace($oldVersion, $newVersion)
        "Updating psm1 with moduleversion"
        Set-Content "$projectroot\topdeskps\topdeskps.psm1" -Value $newpsm1Content
    }
    catch {
        throw 'unable to update $script:moduleversion in topdeskps.psm1'
    }

}

Task Test -Depends UpdateModule {
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



Task BuildMarkdown -Depends Test {
    $lines


    # Generate Markdown Docs

    $lines
    "Generating Docs"
    $docspath = "$ProjectRoot\docs\commands"
    $excludedCommands = @("")
    Import-Module $env:bhpsmodulemanifest -force -Global
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

Task Deploy -Depends test {
    $lines

    Publish-Module -Path "$ProjectRoot\$($env:BHProjectName)" -NuGetApiKey $Key
}
