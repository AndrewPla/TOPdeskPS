function Remove-TdAssetAssignment {
    <#
	.SYNOPSIS
		Remove an assignment from an asset.
	.DESCRIPTION
        This API removes an assigned branch, location, person or person group from an asset.
        To unassign something, you need to provide the linkId, which you can retrieve with Get-TdAssetAssignment.
    .PARAMETER LinkId
        The Id of the relation. You can get this by using Get-TdAssetLink
    .PARAMETER AssetId
        Id of the asset to update
	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
    .EXAMPLE
        PS C:\> Remove-TdAssetAssignment -AssetId $assetId -LinkId $linkId
            Removes the asset assignemt link $linkId for $assetId

#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Remove-TdAssetAssignment',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('relationId')]
        [system.string]
        $LinkId,

        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $AssetId
    )
    begin {}
    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assets/$AssetId/assignments/$LinkId"
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $AssetId -Action "Removing asset assignment $LinkId.")) {
            return
        }
        Invoke-TdMethod -Method 'Delete' -Uri $uri
    }
    end {}
}