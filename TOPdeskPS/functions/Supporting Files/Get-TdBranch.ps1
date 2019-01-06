function Get-TdBranch {
    <#
    .SYNOPSIS
        Gets Branches
    .DESCRIPTION
        Gets Branches
    .PARAMETER Archived
        Whether to retrieve archived incidents. Doesn't return archived branches by default.
    .PARAMETER Name
        Name of the branch that you want returned.Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdBranch
        Gets Branches
    .EXAMPLE
        PS C:\> Get-TdBranch 'Main Office'
        Returns the 'Main Office' branch

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdBranch')]
    [OutputType([TOPdeskPS.Branch])]
    param (
        [Parameter(Position = 0)]
        [String]
        $Name = '*',

        [switch]
        $Archived


    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/branches'
    Write-PSFMessage -Level InternalComment -Message "Branch url: $uri"

    if ($Archived) {
        $uri = "$uri/?archived=$($Archived.ToString().tolower())"
    }

    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object Name -like $Name | Select-PSFObject -Typename 'TOPdeskPS.Branch' -KeepInputObject
}
