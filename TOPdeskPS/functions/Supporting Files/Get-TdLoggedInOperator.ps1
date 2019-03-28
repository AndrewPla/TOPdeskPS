function Get-TdLoggedInOperator {
    <#
    .DESCRIPTION
        Get Logged in Operator

        Get-TdLoggedInOperator
        returns the logged in Operator.
    .EXAMPLE
    Get-TdLoggedInOperator
    Returns the current operator
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Get-TdLoggedInOperator')]
    param()

    $url = "$(Get-TdUrl)/tas/api/operators/current"
    Invoke-TdMethod -Uri $url
}
