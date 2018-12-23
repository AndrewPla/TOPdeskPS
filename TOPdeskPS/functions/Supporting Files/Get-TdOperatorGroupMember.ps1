function Get-TdOperatorGroupMember {
    <#
.SYNOPSIS
    get the operators of an operator group
.DESCRIPTION
    returns the members of an operator group
.PARAMETER OperatorGroup
    Id of the operator group that you want members for
.EXAMPLE
    PS C:\> Get-TdOperatorGroup TechSupport | Get-TdOperatorGroupMember
    Return members of the TechSupport operator group
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdOperatorGroupMember')]

    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [string]
        $OperatorGroup
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorgroups/id/$operatorGroup/operators"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
}

