function Get-TdCategoryFilter {
    <#
    .SYNOPSIS
        Get list of category filters
    .DESCRIPTION
        Get list of category filters or return the category filters for a provided user
    .PARAMETER Operator
        ID of the Operator. See Get-TdOperator
        .PARAMETER Name
            Filter based on the name. Wildcards accepted.
    .EXAMPLE
        PS C:\> Get-TdCategoryFilter
        Gets list of category filters
    .EXAMPLE
        PS C:\> Get-TdOperator 'First.Last' | Get-TdCategoryFilter
        Returns category filters for 'First.Last'
    .EXAMPLE
        PS C:\> Get-TdCategoryFilter -name
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdCategoryFilter')]
    param (
        [Parameter(Position = 0)]
        [string]
        $Name = '*',

        [Parameter(
            ParameterSetName = 'OperatorId',
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $Operator


    )
    process {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'

        switch ($PSCmdlet.ParameterSetName) {
            'OperatorId' {
                $uri = "$(Get-TdUrl)/tas/api/operators/id/$OperatorId/filters/category"
            }
            '__AllParameterSets' {
                $uri = "$(Get-TdUrl)/tas/api/operators/filters/category"
            }
        }
        $res = Invoke-TdMethod -Uri $uri
        $res | Where-object name -like $name
    }
}
