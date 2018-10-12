function Get-TdAssetCapabilityDetail {
    <#
    .SYNOPSIS
        Returns details about asset capabilities
    .DESCRIPTION
        Assets can be linked together with capabilities. This command returns all of them.
    .PARAMETER CapabilityId
        Id of the capability. Use Get-TdAssetCapability
    .EXAMPLE
        PS C:\> Get-TdAssetCapability | Get-TdAssetCapabilityDetail
        Returns additional detail about asset capabilities
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetCapabilityDetail')]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [system.string]
        $CapabilityId
    )
    process {
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/capabilities/$CapabilityId"
        Invoke-TdMethod -Uri $uri
    }
}
