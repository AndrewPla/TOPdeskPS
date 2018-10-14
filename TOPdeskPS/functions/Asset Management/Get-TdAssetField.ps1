function Get-TdAssetField {
    <#
    .SYNOPSIS
        Lists asset fields
    .DESCRIPTION
        Returns all asset fields contained inside TOPdesk.
    .EXAMPLE
        PS C:\> Get-TdAssetField
        Returns all asset fields
        #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetField')]
    param(
    )
    $uri = (Get-TdUrl) + "/tas/api/assetmgmt/fields"
    Invoke-TdMethod -Uri $uri | Select-Object -ExpandProperty DataSet
}
