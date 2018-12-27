function Get-TdEscalationReason {
    <#
    .SYNOPSIS
        Gets all EscalationReasons
    .DESCRIPTION
            Gets all EscalationReasons
    .PARAMETER Name
        Name of the escalation reason that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdEscalationReason
        Gets list of all EscalationReasons

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdEscalationReason')]
    param (
        [Parameter(position = 0)]
        [string]
        $Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/escalation-reasons'

    $res = Invoke-TdMethod $uri
    $res | Where-Object name -like $Name
}
