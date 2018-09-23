function Get-TdCountry {
    <#
    .SYNOPSIS
        Gets Country
    .DESCRIPTION
        Gets Countries
    .EXAMPLE
        PS C:\> Get-TdCountry
        Gets list of all Countries

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/countries'
    Write-PSFMessage -Level InternalComment -Message "countries url: $uri"
    $Params = @{
        'uri' = $uri
                }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}