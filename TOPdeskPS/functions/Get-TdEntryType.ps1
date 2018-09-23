function Get-TdEntryType {
    <#
    .SYNOPSIS
        Gets entry types
    .DESCRIPTION
        Gets entry types
    .EXAMPLE
        PS C:\> Get-Tdentrytype
        Gets list of all entry types

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/entry_types'
    Write-PSFMessage -Level InternalComment -Message "entry_types url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}