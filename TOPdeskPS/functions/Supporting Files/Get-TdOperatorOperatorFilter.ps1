function Get-TdOperatorOperatorFilter {
    <#
.SYNOPSIS
    Returns Operator filters linked to an operator
.DESCRIPTION
    returns the Operator filters linked to an operator
    .PARAMETER Operator
        Id of the operator that you want Operator filters for
    .PARAMETER Name
        Filter by name. Wildcards accepted.
.EXAMPLE
    PS C:\> Get-TdOperator -name 'Andrew Pla' | Get-TdOperatorOperatorFilter
    Returns Operator filters for the provided operator
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorOperatorFilter')]

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

        $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/filters/operator"
        $res = Invoke-TdMethod -Uri $uri
        $res | Where-Object name -like $Name
    }

}

