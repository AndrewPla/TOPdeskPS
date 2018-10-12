function Get-TdAssetField {
    <#
    .SYNOPSIS
        Lists asset fields
    .DESCRIPTION
        Lists asset fields
    .EXAMPLE
        PS C:\> Get-TdAssetField
        Returns asset fields
        #>
        [cmdletbinding()]
    param(
    )
    $uri = (Get-TdUrl) + "/tas/api/assetmgmt/fields"
    Invoke-TdMethod -Uri $uri | Select-Object -ExpandProperty DataSet
}