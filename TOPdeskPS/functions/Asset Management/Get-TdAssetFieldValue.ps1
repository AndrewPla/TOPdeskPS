function Get-TdAssetFieldValue {
    <#
    .SYNOPSIS
        Returns Asset field values
    .DESCRIPTION
        Lists asset fields
    .PARAMETER FieldId
        Id of the field that you want the value for. See Get-TdAssetField
    .EXAMPLE
        PS C:\> Get-TdAssetField | Get-TdAssetFieldValue
        Returns asset fieldvalues for all Asset fields.
        #>
    [cmdletbinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetFieldValue')]
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
