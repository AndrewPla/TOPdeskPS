function Get-TdUrgency {
    <#
    .SYNOPSIS
        Gets list of all urgencies
    .DESCRIPTION
        Gets list of all urgencies
    .EXAMPLE
        PS C:\> Get-TdUrgency
        Gets list of all urgencies

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/urgencies'
    Write-PSFMessage -Level InternalComment -Message "urgencies url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}