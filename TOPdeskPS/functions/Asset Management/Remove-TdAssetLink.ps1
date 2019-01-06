function Remove-TdAssetLink {
    <#
	.SYNOPSIS
		Remove link between 2 assets.
	.DESCRIPTION
		Remove link between 2 assets.
    .PARAMETER LinkId
        The Id of the relation. You can get this by using Get-TdAssetLink
	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
    .EXAMPLE
        PS C:\> Get-TdAssetLink -AssetId $assetId | Remove-TdAssetLink
            Removes the asset links for $assetId

#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Remove-TdAssetLink',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('relationId')]
        [system.string]
        $LinkId
    )
    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assetLinks/$LinkId"
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $LinkId -Action 'Removing asset Link.')) {
            return
        }
        Invoke-TdMethod -Method 'Delete' -Uri $uri
    }
}
