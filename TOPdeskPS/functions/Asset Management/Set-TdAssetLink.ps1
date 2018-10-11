function Set-TdAssetLink {
    <#
	.SYNOPSIS
		Links asset to target asset
	.DESCRIPTION
        This API creates a link between two assets. These links are often referred to as 'relationships’.
        When creating a link, you need to specify the two assets you want to link (AssetId, TargetAssetId), and the desired relationship between them.
        To get the available types of relationship between the two assets, use Get-TdAssetLinkPossibleRelation
    .PARAMETER AssetId
        The id of the asset to be the source of the link. For a child relation, this will be the parent, for a parent relation, this will be the child. For capabilities, this asset will provide the capability.
    .PARAMETER TargetAssetId
        The id of the asset to be the target of the link. For a child relation, this will be the child, for a parent relation, this will be the parent. For capabilities, this asset will use the capability.
    .PARAMETER CapabilityId
        The id of the capability that is offered through the link. Don’t specify it for parent-child relation
	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
	.EXAMPLE
        PS C:\> Set-TdAssetLink -AssetId $AssetId -TargetAssetId $TargetId
        Links $assetId to $targetId using
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Set-TdAsset',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true)]
        [Alias('id', 'SourceId')]
        [system.string]
        $AssetId,

        [Parameter(Mandatory = $true)]
        [Alias('targetId')]
        [system.string]
        $TargetAssetId,

        [ValidateSet('parent', 'child')]
        $Type,

        [system.string]
        $CapabilityId
    )

    begin {}
    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assetLinks"

        $body = [PSCustomObject]@{}
        switch ($PSBoundParameters.Keys) {
            AssetId {
                $body | Add-Member -MemberType NoteProperty -Name 'sourceId' -Value $AssetId
            }
            TargetAssetId {
                $body | Add-Member -MemberType NoteProperty -Name 'targetId' -Value $TargetAssetId
            }
            type {
                $body | Add-Member -MemberType NoteProperty -Name 'type' -Value $Type
            }
            CapabilityId {
                $body | Add-Member -MemberType NoteProperty -Name 'capabilityId' -Value $CapabilityId
            }
        }
        Write-PSFMessage "$($Body | ConvertTo-Json | Out-String)" -Level debug

        $params = @{
            'Uri'    = $uri
            'Body'   = $Body
            'Method' = 'Post'
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $AssetId -Action 'Updating asset link.')) {
            return
        }
        Invoke-TdMethod @params
    }
    end {}
}