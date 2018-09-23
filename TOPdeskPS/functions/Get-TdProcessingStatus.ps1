function Get-TdProcessingStatus {
    <#
    .SYNOPSIS
        Gets processing statuses
    .DESCRIPTION
        Gets processing statuses
    .EXAMPLE
        PS C:\> Get-TdProcessingStatus
        Gets list of all processing statuses

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/processing_status'
    Write-PSFMessage -Level InternalComment -Message "processing statuses url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}