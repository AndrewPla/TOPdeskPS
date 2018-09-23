function Get-TdPriority {
    <#
    .SYNOPSIS
        Gets priorities
    .DESCRIPTION
        Gets priorities
    .EXAMPLE
        PS C:\> Get-TdPriority
        Gets list of all priorities

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/priorities'
    Write-PSFMessage -Level InternalComment -Message "priorities url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}