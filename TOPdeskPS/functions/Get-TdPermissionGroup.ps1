function Get-TdPermissionGroup {
    <#
    .SYNOPSIS
        Get permission groups
    .DESCRIPTION
        Get permission groups
    .EXAMPLE
        PS C:\> Get-TdPermissionGroup
        Get permission groups

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/permissiongroups'
    Write-PSFMessage -Level InternalComment -Message "priorities url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res
}