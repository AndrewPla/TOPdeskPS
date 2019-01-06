function Get-TdBranchFilter {
    <#
    .SYNOPSIS
        Returns branch filters
    .DESCRIPTION
        Returns branch filters for a provided operator, or returns a list of all branch filters.
    .PARAMETER Name
        Filter on the name. Wildcards supported.
    .PARAMETER Operator
        Id of the operator that you want branch filters for

    .EXAMPLE
        PS C:\> Get-TdBranchFilter
        Gets list of branch filters
    .EXAMPLE
    PS C:\> Get-TdOperator -name 'Andrew Pla' | Get-TdOperatorBranchFilter
    Returns branch filters for the provided operator
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdBranchFilter')]
    param (
        $Name = '*',

        [Parameter(Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName = 'Operator')]
        [Alias('id')]
        $Operator
    )
    process {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
        if ($Operator) {
            $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/filters/branch"
        }
        else {
            $uri = "$(Get-TdUrl)/tas/api/operators/filters/branch"
        }


        $res = Invoke-TdMethod -Uri $uri
        $res | Where-Object name -like $Name
    }
}
