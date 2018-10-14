[cmdletbinding()]
<#
.DESCRIPTION
    Contains various build tasks. This script is intended to be consumed through VS code tasks. See the .vscode folder of this project for more.
.PARAMETER BuildMarkdownDocs
    This generates a markdwon help page for each command and then puts them all into a folder. This is intended to be used with a github pages setup that will publish the files to a github site.
.PARAMETER Pester
    This will run all pester tests from the pester file.
#>
param (

    $SourceFolder = $PSScriptRoot,

    [Switch]$BuildMarkdownDocs,

    [Switch]$Pester

)
begin {
    Push-Location $PSScriptRoot -StackName BuildScript
    Pop-Location -StackName BuildScript
    $moduleName = "TOPdeskPS"
    $docsPath = ".\docs\commands"

}

process {
    switch ($PSBoundParameters.keys) {

        BuildMarkdownDocs {
            $excludedCommands = @("")
            Write-PSFMessage -Level Verbose -Message "Processing $moduleName"
            Write-PSFMessage -Level Verbose -Message "  Creating list of commands to process"
            $commands = Get-Command -Module $moduleName -CommandType Function, Cmdlet | Select-Object -ExpandProperty Name | Where-Object {
                $_ -notin $excludedCommands
            } | Sort-Object
            Write-PSFMessage -Level Verbose -Message "  $($commands.Count) commands found"

            Write-PSFMessage -Level Verbose -Message "  Creating markdown help files"
            Remove-Item "$($docsPath)\$($moduleName)" -Recurse -ErrorAction Ignore
            $null = New-Item "$($docsPath)\$($moduleName)" -ItemType Directory
            $null = New-MarkdownHelp -Command $commands -OutputFolder "$($docsPath)\$($moduleName)"

            Write-PSFMessage -Level Verbose -Message "  Creating index file"
            Set-Content -Path "$($docsPath)\$($moduleName).md" -Value @"
# $moduleName Command Reference

"@ -Encoding Ascii

            foreach ($command in $commands) {
                Add-Content -Path "$($docsPath)\$($moduleName).md" -Value " - [$command]($($moduleName)/$command.html)"
            }
            Write-PSFMessage -Level Verbose -Message "Finished processing $moduleName"
        }
        Compile {Write-PSFMessage -Level Verbose 'Not written yet.'}
        Analyze {Write-PSFMessage -Level Verbose 'Not written yet.'}
        Pester {
            .\TOPdeskPS\tests\pester.ps1 -Show 'Header', 'fails'
        }
        Publish { Write-PSFMessage -Level Verbose 'Not written yet.'}

    }
}
end {
    # Invoke-Pester -Script $SourceFolder -CodeCoverage $DestinationModule
    #Invoke-ScriptAnalyzer -Path $DestinationModule

}



