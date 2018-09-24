function Get-TdOperatorGroup {
    <#
    .SYNOPSIS
        Get Operator groups
    .DESCRIPTION
        Get Operator groups
    .EXAMPLE
        PS C:\> Get-TdOperatorGroup
        Get Operator groups

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/operatorgroups'
    Write-PSFMessage -Level InternalComment -Message "priorities url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res
}