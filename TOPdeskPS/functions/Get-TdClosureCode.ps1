function Get-TdClosureCode {
    <#
    .SYNOPSIS
        Gets closure codes
    .DESCRIPTION
        Gets closurec codes
    .EXAMPLE
        PS C:\> Get-TdClosureCode
        Gets list of all closurecodes

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/closure_codes'
    Write-PSFMessage -Level InternalComment -Message "closurecodes url: $uri"
    $Params = @{
        'uri' = $uri
                }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}