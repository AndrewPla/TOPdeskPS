function Get-TdOperatorFilter {
    <#
    .SYNOPSIS
        Get list of Operator filters
    .DESCRIPTION
        Get list of Operator filters or return the Operator filters for a provided user
    .PARAMETER OperatorId
        ID of the Operator. See Get-TdOperator
        .PARAMETER Name
            Filter based on the name. Wildcards accepted.
    .EXAMPLE
        PS C:\> Get-TdOperatorFilter
        Gets list of Operator filters
    .EXAMPLE
        PS C:\> Get-TdOperator
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorFilter')]
    param (
        [Parameter(
            ParameterSetName = 'OperatorId',
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $OperatorId,

        [string]
        $Name = '*'
    )
    process {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'

        switch ($PSCmdlet.ParameterSetName) {
            'OperatorId' {
                $uri = "$(Get-TdUrl)/tas/api/operators/id/$OperatorId/filters/Operator"
            }
            '__AllParameterSets' {
                $uri = "$(Get-TdUrl)/tas/api/operators/filters/operator"
            }
        }
        $res = Invoke-TdMethod -Uri $uri
        $res | Where name -like $name
    }
}
