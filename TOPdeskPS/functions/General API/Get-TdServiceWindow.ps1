function Get-TdServiceWindow {
    <#
    .SYNOPSIS
        Gets all service windows
    .DESCRIPTION
            Gets all service windows
        .PARAMETER Name
        Name of the service window that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdServiceWindow
        Gets list of all service windows

    #>
    [CmdletBinding()]
    param (
        [system.string]$Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/serviceWindow/lookup/'
    Write-PSFMessage -Level InternalComment -Message "servicewindow lookup url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}