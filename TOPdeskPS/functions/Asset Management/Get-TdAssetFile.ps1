function Get-TdAssetFile {
    <#
    .SYNOPSIS
        Short description
    .DESCRIPTION
        Long description
    .EXAMPLE
        PS C:\> <example usage>
        Explanation of what the example does
    #>
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $AssetId
    )
    $uri = (get-tdurl) + "/tas/api/assetmgmt/uploads/?assetId=$AssetId"
    Invoke-TdMethod -Uri $uri | Select-Object -ExpandProperty DataSet
}