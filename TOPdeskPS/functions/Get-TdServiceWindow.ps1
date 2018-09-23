function Get-TdServiceWindow {
    <#
    .SYNOPSIS
        Gets all ServiceWindows
    .DESCRIPTION
            Gets all ServiceWindows
    .EXAMPLE
        PS C:\> Get-TdServiceWindow
        Gets list of all ServiceWindows

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/serviceWindow/lookup'
    Write-PSFMessage -Level InternalComment -Message "servicewindow lookup url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}