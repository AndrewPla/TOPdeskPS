function Get-TdTimeSpentReason {
    <#
    .SYNOPSIS
        Gets all time spent reasons
    .DESCRIPTION
            Gets all time spent reasons
    .PARAMETER Name
        Name of the time spent reason that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdTimeSpent
        Gets all time spent reasons

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdTimeSpentReason')]
    param (
        [string]$Name = '*'
    )

    $uri = (Get-TdUrl) + '/tas/api/timespent-reasons'
    $res = Invoke-TdMethod $uri
    $res | where-object name -like $name
}
