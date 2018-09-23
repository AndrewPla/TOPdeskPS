function Get-TdDeescalationReason {
    <#
    .SYNOPSIS
        Gets deescalation reasons
    .DESCRIPTION
        Gets deescalation reasons
    .EXAMPLE
        PS C:\> Get-TdDeescalationReason
        Gets list of all deescalation reasons

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/deescalation reasons'
    Write-PSFMessage -Level InternalComment -Message "deescalation reasons url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}