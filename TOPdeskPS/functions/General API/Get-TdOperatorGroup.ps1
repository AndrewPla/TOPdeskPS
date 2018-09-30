function Get-TdOperatorGroup {
    <#
    .SYNOPSIS
        Get Operator groups
    .DESCRIPTION
        Get Operator groups
    .PARAMETER Name
        Name of the operator group that you want returned. Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdOperatorGroup
        Get all Operator groups

    #>
    [CmdletBinding()]
    param (
        [Alias('GroupName')]
        [system.string]$Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/operatorgroups'
    Write-PSFMessage -Level InternalComment -Message "operatorgroups url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res  | Where-Object groupname -like $Name
}