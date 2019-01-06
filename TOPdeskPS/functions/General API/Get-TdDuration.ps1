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
        [string]$Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/durations'
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-object Name -like $Name
}
