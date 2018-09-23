function Get-TdEscalationReason {
    <#
    .SYNOPSIS
        Gets all EscalationReasons
    .DESCRIPTION
            Gets all EscalationReasons
    .EXAMPLE
        PS C:\> Get-TdEscalationReason
        Gets list of all EscalationReasons

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/escalation-reasons'
    Write-PSFMessage -Level InternalComment -Message "escalation-reasons url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}