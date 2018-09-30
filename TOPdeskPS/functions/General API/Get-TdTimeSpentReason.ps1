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
        [system.string]$Name = '*'
    )

    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/timespent-reasons'
    Write-PSFMessage -Level InternalComment -Message "timespent-reasons url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | where-object name -like $name
}