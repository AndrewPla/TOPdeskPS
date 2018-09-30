function Get-TdEntryType {
    <#
    .SYNOPSIS
        Gets entry types
    .DESCRIPTION
        Gets entry types
    .PARAMETER Name
        Name of the entry type that you want returned. Wildcards are supported. Default value is '*'
    
    .EXAMPLE
        PS C:\> Get-Tdentrytype
        Gets list of all entry types

    #>
    [CmdletBinding()]
    param (
        [system.string]$Name
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/entry_types'
    Write-PSFMessage -Level InternalComment -Message "entry_types url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}