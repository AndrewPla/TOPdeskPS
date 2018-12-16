function Get-TdOperatorCategoryFilter {
    <#
.SYNOPSIS
    Returns category filters linked to an operator
.DESCRIPTION
    returns the category filters linked to an operator
    .PARAMETER Operator
        Id of the operator that you want category filters for
    .PARAMETER Name
        Filter for names. Wildcards accepted
.EXAMPLE
    PS C:\> Get-TdOperator -name 'Andrew Pla' | Get-TdOperatorcategoryFilter
    Returns category filters for the provided operator
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorCategoryFilter')]

    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        $Operator,

        [string]
        $Name = '*'
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/filters/category"
        $res = Invoke-TdMethod -Uri $uri
        $res | where name -like $name
    }

}

