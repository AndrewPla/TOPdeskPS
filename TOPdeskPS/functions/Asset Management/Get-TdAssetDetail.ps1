function Get-TdAssetDetail {
    <#
    .SYNOPSIS
        Returns additional information about assets
    .DESCRIPTION
        Get more information about Assets retrieved with Get-TdAsset
    .PARAMETER AssetId
        Id of the asset that you want more details about
    .EXAMPLE
        PS > Get-TdAsset | Get-TdAssetDetail
        Returns details for assets returned with Get-TdAsset
    .Example
        PS > Get-TdAsset TestAsset123 | Get-TdAssetDetail
        Returns details for TestAsset123
    .NOTES
        See https://developers.topdesk.com/explorer/?page=assets#/Assets/getAssets for more information.
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetDetail')]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [system.string]
        $AssetId
    )
    process {
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assets/$AssetId"
        Invoke-TdMethod -Uri $uri
    }
}
