function Get-TdAssetLinkPossibleRelation {
    <#
	.SYNOPSIS
		Returns possible relations between source and target asset.
	.DESCRIPTION
   This API returns the available relationship types (child, parent and available capability ids) for two assets (sourceId, targetId).
    If the specified two assets are already linked in every possible way, then the result will be empty.
    This endpoint is the most beneficial if you use it before creating a new link between two assets.
      .PARAMETER AssetId
        The ID of the source Asset
    .PARAMETER TargetAssetId
        The ID of the target Asset
    .EXAMPLE
        PS C:\> Get-TdAssetLinkPossibleRelations -AssetId $assetId -TargetAssetId $targetId
        Returns all possible relationships between the two assets.
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetlinkPossibleRelation')]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id', 'sourceId')]
        [system.string]
        $AssetId,

         [Parameter(Mandatory = $true)]
        [Alias('targetId')]
        [system.string]
        $TargetAssetId
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    }
    process {
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assetLinks/possibleRelations/?sourceId=$AssetId&targetId=$TargetAssetId"
        Invoke-TdMethod -Uri $uri
    }
}