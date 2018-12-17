function Get-TdOperatorBranchFilter {
    <#
.SYNOPSIS
    Returns branch filters linked to an operator
.DESCRIPTION
    returns the branch filters linked to an operator
    .PARAMETER Operator
        Id of the operator that you want branch filters for
        .PARAMETER Name
        Filter by name. wildcards accepted.
.EXAMPLE
    PS C:\> Get-TdOperator -name 'Andrew Pla' | Get-TdOperatorBranchFilter
    Returns branch filters for the provided operator
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorBranchFilter')]

    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        $Operator,

        $Name = '*'
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/filters/branch"
        $res = Invoke-TdMethod -Uri $uri
        $res | where-object name -like $Name
    }

}

