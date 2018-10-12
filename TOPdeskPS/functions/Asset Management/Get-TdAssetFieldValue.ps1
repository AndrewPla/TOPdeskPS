function Get-TdAssetFieldValue {
    <#
    .SYNOPSIS
        Returns Asset field values
    .DESCRIPTION
        Lists asset fields
    .EXAMPLE
        PS C:\> Get-TdAssetField
        Returns asset fields
        #>
    [cmdletbinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [system.string]$FieldId
    )

    process {
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/fields/$FieldId"
        Invoke-TdMethod -Uri $uri
    }
}