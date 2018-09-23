function Get-TdTimeSpentReason {
    <#
    .SYNOPSIS
        Gets all time spent reasons
    .DESCRIPTION
            Gets all time spent reasons
    .EXAMPLE
        PS C:\> Get-TdTimeSpent
        Gets all time spent reasons

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/timespent-reasons'
    Write-PSFMessage -Level InternalComment -Message "timespent-reasons url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}