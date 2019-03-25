function Get-TdLoggedInOperator {
    <#
    .DESCRIPTION
        Get Logged in Operator
    .EXAMPLE
        Get-TdLoggedInOperator
        returns the logged in Operator.
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Get-TdLoggedInOperator')]
    $url = "$(Get-TdUrl)/tas/api/operators/current"
    Invoke-TdMethod -Uri $url
}
