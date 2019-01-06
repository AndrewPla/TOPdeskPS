function Get-TdOperatorFilter {
    <#
    .SYNOPSIS
        Get list of Operator filters
    .DESCRIPTION
        Get list of Operator filters or return the Operator filters for a provided user
    .PARAMETER Operator
        ID of the Operator. See Get-TdOperator
        .PARAMETER Name
            Filter based on the name. Wildcards accepted.
    .EXAMPLE
        PS C:\> Get-TdOperatorFilter
        Gets list of Operator filters
    .EXAMPLE
        PS C:\> Get-TdOperator 'Johnny.cash' | Get-TdOperatorFilter
        Returns operator filters for the operator 'johnny.cash'
    .EXAMPLE
        PS C:\> Get-TdOperatorFilter 'Test*'
        Returns all operator filterns with a name starting with test
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorFilter')]
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
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters | Out-String)" -Tag 'debug', 'start', 'param'

        switch ($PSCmdlet.ParameterSetName) {
            'OperatorId' {
                $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/filters/operator"
            }
            '__AllParameterSets' {
                $uri = "$(Get-TdUrl)/tas/api/operators/filters/operator"
            }
        }
        $res = Invoke-TdMethod -Uri $uri
        $res | Where-object name -like $name
    }
}
