[CmdletBinding()]
param()

function Get-TdConfigServer {
    <#
.SYNOPSIS
    Retrieves the TOPdesk server from the config file.
.DESCRIPTION
    Get-TdConfigServer Function
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    Created on:   	6/25/2018 12:55 PM
    Edited on:      6/25/2018
    Created by:   	AndrewPla
    Organization: 	 
    Filename:     	Get-TdConfigServer.ps1

#>
    [CmdletBinding(
        ConfirmImpact = 'Low',
        #HelpUri = 'https://topdeskps.readthedocs.io/en/latest/Module/Get-TdConfigServer',
        SupportsShouldProcess = $true
    )]
    [OutputType([system.string])]
    param
    (
        [string]
        $ConfigFile
    )
    begin {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
    }
    process {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
        
        if (-not $PSCmdlet.ShouldProcess("Item")) {
            return
        }

        if (-not ($ConfigFile)) {
            $ConfigFile = Join-Path -Path $psModuleRoot -ChildPath 'config.xml'
        }
        if (-not (Test-Path -Path $ConfigFile)) {
            $errorItem = [System.Management.Automation.ErrorRecord]::new(
                ([System.IO.FileNotFoundException]"Could not find $ConfigFile"),
                'ConfigFile.NotFound',
                [System.Management.Automation.ErrorCategory]::ObjectNotFound,
                $ConfigFile
            )
            $errorItem.ErrorDetails = "Config file [$ConfigFile] does not exist. Use Set-TdConfigServer first to define the configuration file."
            $PSCmdlet.ThrowTerminatingError($errorItem)
        }

        $xml = New-Object -TypeName XML
        $xml.Load($ConfigFile)

        $xmlConfig = $xml.DocumentElement
        if ($xmlConfig.LocalName -ne 'Config') {
            $errorItem = [System.Management.Automation.ErrorRecord]::new(
                ([System.IO.FileFormatException]"XML had not the expected format"),
                'ConfigFile.UnexpectedElement',
                [System.Management.Automation.ErrorCategory]::ParserError,
                $ConfigFile
            )
            $errorItem.ErrorDetails = "Unexpected document element [$($xmlConfig.LocalName)] in configuration file [$ConfigFile]. You may need to delete the config file and recreate it using Set-TdConfigServer."
            $PSCmdlet.ThrowTerminatingError($errorItem)
        }

        if ($xmlConfig.Server) {
            Write-Output $xmlConfig.Server
        }
        else {
            $errorItem = [System.Management.Automation.ErrorRecord]::new(
                ([System.UriFormatException]"Could not find URI"),
                'ConfigFile.EmptyElement',
                [System.Management.Automation.ErrorCategory]::OpenError,
                $ConfigFile
            )
            $errorItem.ErrorDetails = "No Server element is defined in the config file.  Use Set-TdConfigServer to define one."
            $PSCmdlet.ThrowTerminatingError($errorItem)
        }

    }
    end {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}

