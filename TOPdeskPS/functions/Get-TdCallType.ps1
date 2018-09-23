function Get-TdCallType {
    <#
    .SYNOPSIS
        Gets call types
    .DESCRIPTION
        Gets call types
    .EXAMPLE
        PS C:\> Get-TdCallType
        Gets list of call types

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/call_types'
    Write-PSFMessage -Level InternalComment -Message "call types url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"
    $res = Invoke-TdMethod @Params
    $res
}