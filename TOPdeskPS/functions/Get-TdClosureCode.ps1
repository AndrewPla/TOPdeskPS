function Get-TdClosureCode {
    <#
    .SYNOPSIS
        Gets closure codes
    .DESCRIPTION
        Gets closurec codes
    .PARAMETER Name
        Name of the closure code that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdClosureCode
        Gets list of all closurecodes

    #>
    [CmdletBinding()]
    param (
        [system.string]
        $Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/closure_codes'
    Write-PSFMessage -Level InternalComment -Message "closurecodes url: $uri"
    $Params = @{
        'uri' = $uri
                }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}