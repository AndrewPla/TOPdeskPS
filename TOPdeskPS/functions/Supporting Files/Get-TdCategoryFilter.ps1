function Get-TdCategoryFilter {
    <#
    .SYNOPSIS
        Get list of category filters
    .DESCRIPTION
        Get list of category filters or return the category filters for a provided user
    .EXAMPLE
        PS C:\> Get-TdCategoryFilter
        Gets list of category filters
    .EXAMPLE
        PS C:\> Get-TdOperator
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdCategoryFilter')]
    param (
        [Parameter(
            ParameterSetName = 'OperatorId',
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $OperatorId
    )
    process {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'

        switch ($PSCmdlet.ParameterSetName) {
            'OperatorId' {
                $uri = (Get-TdUrl) + "/tas/api/operators/id/$OperatorId/filters/category"
            }
            '__AllParameterSets' {
                $uri = (Get-TdUrl) + '/tas/api/operators/filters/category'
            }
        }
        Invoke-TdMethod -uri $uri
    }
}
