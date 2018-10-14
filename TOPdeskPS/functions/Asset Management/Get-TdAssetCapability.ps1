function Get-TdAssetCapability {
    <#
    .SYNOPSIS
        Returns list of capabilities.
    .DESCRIPTION
        Assets can be linked together with capabilities. This command returns all of them.
    .EXAMPLE
        PS C:\> Get-TdAssetCapability
        Returns capabilities
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetCapability')]
    param ()
    $uri = (Get-TdUrl) + "/tas/api/assetmgmt/capabilities"
    Invoke-TdMethod -Uri $uri | Select-Object -ExpandProperty dataset
}
