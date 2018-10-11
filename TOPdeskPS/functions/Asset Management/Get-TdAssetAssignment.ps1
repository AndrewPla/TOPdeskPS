function Get-TdAssetAssignment {
    <#
    .SYNOPSIS
        Gets assignments for an asset
    .DESCRIPTION
        This API returns a list of assigned location, branches, persons and person groups of a specific asset.
    .PARAMETER AssetId
        Id of the asset to return asset links for.
    .EXAMPLE
        PS C:\> Get-TdAssetAssignment -AssetId $AssetId
        Returns assignments for $AssetId
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetAssignment')]
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('id')]
        [system.string]
        $AssetId
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assets/$AssetId/assignments"
    Invoke-TdMethod -Uri $uri
}
