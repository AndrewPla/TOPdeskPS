function Get-TdEntryType {
    <#
    .SYNOPSIS
        Gets entry types
    .DESCRIPTION
        Gets entry types
    .PARAMETER Name
        Name of the entry type that you want returned. Wildcards are supported.

    .EXAMPLE
        PS C:\> Get-Tdentrytype
        Gets list of all entry types

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdEntryType')]
    [OutputType([TOPdeskPS.BasicObj])]
    param (
        [string]$Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/entry_types'
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name | Select-PSFObject -Typename 'TOPdeskPS.BasicObj' -KeepInputObject
}
