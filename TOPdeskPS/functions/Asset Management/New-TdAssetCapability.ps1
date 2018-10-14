function New-TdAssetCapability {
    <#
    .SYNOPSIS
        Create a new Asset Capability
    .DESCRIPTION
        Create a new Asset Capability
    .PARAMETER Name
        Name of the capability that you would like to create.
    .PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
    .EXAMPLE
        PS C:\> New-TdAssetCapability -Name 'testCapability'
        Creates a new capability named 'testCapability'
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdAssetCapability',
        SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [system.string]
        $Name
    )
    process {
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/capabilities"
        $body = [PSCustomObject]@{
            name = $name
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Creating asset capability.')) {
            return
        }
        Invoke-TdMethod -Uri $uri -Body ($body | ConvertTo-Json) -Method POST
    }
}
