function Get-TdAssetFile {
    <#
    .SYNOPSIS
        Lists files from an asset
    .DESCRIPTION
        Lists files from an asset
     .PARAMETER AssetId
        Id of the asset that you want files for
    .EXAMPLE
        PS C:\> Get-TdAssetFile -AssetId $AssetId
        Returns files from asset $AssetId
        #>
    [cmdletbinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetFile')]
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $AssetId
    )
    $uri = (Get-TdUrl) + "/tas/api/assetmgmt/uploads/?assetId=$AssetId"
    Invoke-TdMethod -Uri $uri | Select-Object -ExpandProperty DataSet
}
