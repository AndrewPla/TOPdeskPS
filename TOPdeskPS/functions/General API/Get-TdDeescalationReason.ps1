function Get-TdDeescalationReason {
    <#
    .SYNOPSIS
        Gets deescalation reasons
    .DESCRIPTION
        Gets deescalation reasons
    .PARAMETER Name
        Name of the deescalation reason that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdDeescalationReason
        Gets list of all deescalation reasons

    #>
    [CmdletBinding( HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdDeescalationReason')]
    param (
        [system.string]
        $Name
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/deescalation-reasons'
    Write-PSFMessage -Level InternalComment -Message "deescalation reasons url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}