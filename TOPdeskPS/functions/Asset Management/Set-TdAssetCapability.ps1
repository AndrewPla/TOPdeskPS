function Set-TdAssetCapability {
    <#
    .SYNOPSIS
        Returns list of capabilities.
    .DESCRIPTION
        Assets can be linked together with capabilities. This command returns all of them.
    .PARAMETER CapabilityId
        The Id of the capability that you want to update.
    .PARAMETER Name
        The new name that you want to give the asset.
    .PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
    .EXAMPLE
        PS C:\> Get-TdAssetCapability | where name -like 'test' | Set-TdAssetCapability -name 'newtest'
        Updates the name of capability 'test' to 'newtest'
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdAssetCapability',
        SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [System.String]
        $CapabilityId,

        [Parameter(Mandatory)]
        [System.String]
        $Name
    )
    process {
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/capabilities/$CapabilityId"
        [pscustomobject]$body = @{
            name = $Name
        }
        $params = @{
            uri = $uri
            body = $body | ConvertTo-Json
            method = 'POST'
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'setting asset capability.')) {
            return
        }
        Invoke-TdMethod @params
    }
}
