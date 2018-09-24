function Get-TdPersonGroup {
    <#
    .SYNOPSIS
        Gets person groups
    .DESCRIPTION
        Gets person groups
    .EXAMPLE
        PS C:\> Get-TdPersonGroup
        Gets person groups

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/persongroups'
    Write-PSFMessage -Level InternalComment -Message "persongroups url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res
}