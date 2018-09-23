function Get-TdDuration {
    <#
    .SYNOPSIS
        Gets durations
    .DESCRIPTION
        Gets list of durations
    .EXAMPLE
        PS C:\> Get-Tdduration
        Gets list of all durations

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/durations'
    Write-PSFMessage -Level InternalComment -Message "duration url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}