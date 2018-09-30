function Get-TdBudgetHolder {
    <#
    .SYNOPSIS
        Gets Budgetholders
    .DESCRIPTION
        Gets Budgetholders
    .PARAMETER Name
        Name of the budget holder that you want returned. Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdBudgetHolders
        Gets list of all budgetholders

    #>
    [CmdletBinding()]
    param (
        [system.string]
        $Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/budgetholders'
    Write-PSFMessage -Level InternalComment -Message "Budgetholders url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}