function Get-TdImpact {
    <#
    .SYNOPSIS
        Gets list of impacts
    .DESCRIPTION
        Gets list of impacts
    .EXAMPLE
        PS C:\> Get-TdImpact
        Gets list of impacts

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/impacts'
    Write-PSFMessage -Level InternalComment -Message "Impacts url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}