function Set-TdAssetCapability {
    <#
    .SYNOPSIS
        Returns list of capabilities.
    .DESCRIPTION
        Assets can be linked together with capabilities. This command returns all of them.
    .PARAMETER CapabilityId
        The Id of the capability that you want to update.
    .PARAMETER Name
        The new name that you want to give the asset.
    .EXAMPLE
        PS C:\> Get-TdAssetCapability | where name -like 'test' | Set-TdAssetCapability -name 'newtest'
        Updates the name of capability 'test' to 'newtest'
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdAssetCapability')]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [System.String]
        $CapabilityId,

        [Parameter(Mandatory)]
        [System.String]
        $Name
    )
    process {
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/capabilities/$CapabilityId"
        [pscustomobject]$body = @{
            name = $Name
        }
        $params = @{
            uri = $uri
            body = $body | ConvertTo-Json
            method = 'POST'
        }
        Invoke-TdMethod @params
    }
}
