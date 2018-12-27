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
        [Parameter(position = 0)]
        [string]
        $Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/deescalation-reasons'
    $res = Invoke-TdMethod $uri
    $res | Where-Object name -like $Name
}
