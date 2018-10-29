function Get-TdBudgetHolder {
    <#
.SYNOPSIS
    Returns budget holders
.DESCRIPTION
    Gets a list of budgetholders. Use the Name parameter to  filter.
.PARAMETER Name
    Filter based on Names. Wildcards accepted. Default Value = '*'
.EXAMPLE
    PS C:\> Get-TdBudgetHolder
    returns a list of budget holders
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdBudgetHolder')]

    param
    (
        $Name = '*'
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/budgetholders"
        $res = Invoke-TdMethod -Uri $uri | Where-Object Name -Like $Name
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}
