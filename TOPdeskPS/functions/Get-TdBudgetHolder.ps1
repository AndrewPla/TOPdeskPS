function Get-TdBudgetHolder {
    <#
    .SYNOPSIS
        Gets Budgetholders
    .DESCRIPTION
        Gets Budgetholders
    .EXAMPLE
        PS C:\> Get-TdBudgetHolders
        Gets list of all budgetholders

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/budgetholders'
    Write-PSFMessage -Level InternalComment -Message "Budgetholders url: $uri"
    $Params = @{
        'uri' = $uri
                }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}