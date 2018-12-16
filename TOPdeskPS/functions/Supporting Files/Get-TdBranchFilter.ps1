function Get-TdBranchFilter {
    <#
    .SYNOPSIS
        Get list of branch filters
    .DESCRIPTION
        Get list of branch filters
    .PARAMETER Name
        Filter on the name. Wildcards supported.
    .EXAMPLE
        PS C:\> Get-TdBranchFilter
        Gets list of branch filters
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdBranchFilter')]
    param (
        $Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/operators/filters/branch'
    $res = Invoke-TdMethod -Uri $uri
    $res | where name -like $Name
}
