function Get-TdDuration {
    <#
    .SYNOPSIS
        Gets durations
    .DESCRIPTION
        Gets list of durations
    .PARAMETER Name
        Name of the duration that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-Tdduration
        Gets list of all durations

    #>
    [CmdletBinding(Helpuri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdDuration')]
    param (
        [system.string]$Name
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/durations'
    Write-PSFMessage -Level InternalComment -Message "duration url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-object Name -like $Name
}