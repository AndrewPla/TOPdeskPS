function Get-TdCallType {
    <#
    .SYNOPSIS
        Gets call types
    .DESCRIPTION
        Gets call types
    .PARAMETER Name
        Name of the call type that you want returned. Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdCallType
        Gets list of call types

    .EXAMPLE
        PS> Get-TdCalltype Alert
        Returns the alert call type

    #>
    [CmdletBinding(Helpuri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdCallType')]
    param (
        [Parameter(position = 0)]
        [string]
        $Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/call_types'
    $res = Invoke-TdMethod $uri
    $res | Where-Object name -like $Name | Select-PSFObject -Typename 'TOPdeskPS.BasicObj' -KeepInputObject
}
