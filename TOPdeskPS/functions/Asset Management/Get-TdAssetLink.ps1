function Get-TdAssetLink {
    <#
	.SYNOPSIS
		Returns linked assets
	.DESCRIPTION
        This API returns a list of assets that are linked to a specificed asset provided as a parameter (sourceId).
        The list will include the following information about the linked assets: the name, id, type and properties of the icon of the asset; the type and id of the link; id and name of the used capability.
    .PARAMETER AssetId
        Id of the asset to return asset links for.
    .EXAMPLE
        PS C:\> Get-TdAssetLink -AssetId $assetId
        Returns all linked assets for the $assetId.
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetlink')]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id', 'SourceId')]
        [system.string]
        $AssetId
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    }
    process {
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assetLinks/?&sourceId=$AssetId"
        Invoke-TdMethod -Uri $uri
    }
}