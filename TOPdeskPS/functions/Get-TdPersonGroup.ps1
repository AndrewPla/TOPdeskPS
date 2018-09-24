function Get-TdPersonGroup {
    <#
    .SYNOPSIS
        Gets person groups
    .DESCRIPTION
        Gets person groups
     .PARAMETER Name
        Name of the person group that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdPersonGroup
        Gets person groups

    #>
    [CmdletBinding()]
    param (
        [system.string]$Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/persongroups'
    Write-PSFMessage -Level InternalComment -Message "persongroups url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | where-object name -like $Name
}