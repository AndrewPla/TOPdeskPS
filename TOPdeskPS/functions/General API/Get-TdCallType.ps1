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

    #>
    [CmdletBinding()]
    param (
        [system.string]
        $Name
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/call_types'
    Write-PSFMessage -Level InternalComment -Message "call types url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}