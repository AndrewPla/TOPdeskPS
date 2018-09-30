function Get-TdBranch {
    <#
    .SYNOPSIS
        Gets Branches
    .DESCRIPTION
        Gets Branches
    .PARAMETER Archived
        Whether to retrieve archived incidents
    .PARAMETER Name
        Name of the branch that you want returned.Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdBranch
        Gets Branch

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdBranch')]
    param (
        [switch]
        $Archived,

        [System.String]
        $Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/branches'
    Write-PSFMessage -Level InternalComment -Message "Branch url: $uri"

    if ($Archived) {
        Write-PSFMessage -Level InternalComment -Message "Archive = $Archive"
        $uri = "$uri&archive=$Archive"
    }

    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object Name -like $Name
}
