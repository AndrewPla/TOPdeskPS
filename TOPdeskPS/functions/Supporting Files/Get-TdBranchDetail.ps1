function Get-TdBranchDetail {
    <#
.SYNOPSIS
    Gets details of a branch
.DESCRIPTION
    Gets details of a branch by branchId
.PARAMETER Branch
    ID of the branch. See Get-TdBranch
.EXAMPLE
    PS C:\> Get-TdBranchDetails -BranchId (Get-TdBranch -name 'examplebranch').id
    Returns details about 'examplebranch'
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdBranchDetail')]

    param
    (
        [Parameter(
            mandatory = $true,
            ParameterSetName = 'BranchId',
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $Branch
    )
    process {
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/branches/id/$Branch"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
}

