[CmdletBinding()]
param()

function Set-TdConfigServer {
    <#
.SYNOPSIS
    Short description
.DESCRIPTION
    Set-TdConfigServer Function
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    None
.OUTPUTS
    None
.NOTES
    Created on:   	6/14/2018 6:30 PM
    Edited on:      6/14/2018
    Created by:   	AndrewPla
    Organization: 	 
    Filename:     	Set-TdConfigServer.ps1

#>
    [CmdletBinding(
        ConfirmImpact = 'Low',
        #HelpUri = 'https://topdeskps.readthedocs.io/en/latest/Module/Set-TdConfigServer',
        SupportsShouldProcess = $true
    )]
    param
    (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [Alias('Uri')]
        [Uri]
        $Server,

        [String]
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
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Config file path: $ConfigFile"
        if (-not (Test-Path -Path $ConfigFile)) {
            Write-Verbose "[$($MyInvocation.MyCommand.Name)] Creating new Config file"
            $xml = [XML] '<Config></Config>'
        }
        else {
            Write-Verbose "[$($MyInvocation.MyCommand.Name)] Using existing Config file"
            $xml = New-Object -TypeName XML
            $xml.Load($ConfigFile)
        }

        $xmlConfig = $xml.DocumentElement
        if ($xmlConfig.LocalName -ne 'Config') {
            $errorItem = [System.Management.Automation.ErrorRecord]::new(
                ([System.ArgumentException]"Invalid Document"),
                'InvalidObject.InvalidDocument',
                [System.Management.Automation.ErrorCategory]::InvalidData,
                $_
            )
            $errorItem.ErrorDetails = "Unexpected document element [$($xmlConfig.LocalName)] in configuration file. You may need to delete the config file and recreate it using this function."
            $PSCmdlet.ThrowTerminatingError($errorItem)
        }

                $fixedServer = $Server.AbsoluteUri.Trim('/')

        if ($xmlConfig.Server) {
            $xmlConfig.Server = $fixedServer
        }
        else {
            $xmlServer = $xml.CreateElement('Server')
            $xmlServer.InnerText = $fixedServer
            [void] $xmlConfig.AppendChild($xmlServer)
        }

        try {
            $xml.Save($ConfigFile)
        }
        catch {
            throw $_
        }

    }
    end {
        Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
    }
}

