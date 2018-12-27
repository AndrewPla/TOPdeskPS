function Get-TdPriority {
    <#
    .SYNOPSIS
        Gets priorities
    .DESCRIPTION
        Gets priorities
     .PARAMETER Name
        Name of the priority that you want returned. Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdPriority
        Gets list of all priorities

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdPriority')]
    param (
        [string]$Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/priorities'
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}
