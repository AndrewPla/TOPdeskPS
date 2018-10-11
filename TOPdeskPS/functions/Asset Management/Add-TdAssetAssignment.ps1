function Add-TdAssetAssignment {
    <#
	.SYNOPSIS
		Adds an assignment to an asset
	.DESCRIPTION
		Updates the given asset.It may be possible that one or more assets couldn’t be deleted because they have existing links from other components. In this case those assets’ ids will be listed in the ‘failed’ list of the response, but it doesn’t affect deletion of other assets.
    .PARAMETER AssetId
        ID of asset which is the subject of the assignment
    .PARAMETER Body
        This is the body of the request. Use this to create your own bodies if the parameters aren't providing you with what you need.
	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
	.EXAMPLE
		PS C:\> Set-TdAsset -AssetId $AssetId
        Removes all assets with id's inside $assetId.
    .NOTES see for more: https://developers.topdesk.com/explorer/?page=assets&version=1.5.1#/Assets/update
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Add-TdAssetAssignment',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $AssetId,

        [Parameter(Mandatory, ParameterSetName = 'Body')]
        [pscustomobject]$Body
    )

    begin {}
    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assets/$AssetId/assignments"

        Write-PSFMessage "$($Body | ConvertTo-Json | Out-String)" -Level debug
        $params = @{
            'Uri'    = $uri
            'Body'   = $Body | ConvertTo-Json
            'Method' = 'Put'
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'adding asset assignment.')) {
            return
        }
        Invoke-TdMethod @params
    }
    end {}
}