function Get-TdClosureCode {
    <#
    .SYNOPSIS
        Gets closure codes
    .DESCRIPTION
        Gets closurec codes
    .PARAMETER Name
        Name of the closure code that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdClosureCode
        Gets list of all closurecodes

    .EXAMPLE
        PS> Get-TdClosureCode -Name 'hardware failure'
        Returns the hardware failure closure code
    #>
    [CmdletBinding( HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdClosureCode')]
    param (
        [Parameter(position = 0)]
        [string]
        $Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/closure_codes'
    $res = Invoke-TdMethod $uri
    $res | Where-Object name -like $Name
}
