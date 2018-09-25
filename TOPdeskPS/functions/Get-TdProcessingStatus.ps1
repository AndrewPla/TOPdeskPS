function Get-TdProcessingStatus {
    <#
    .SYNOPSIS
        Gets processing statuses
    .DESCRIPTION
        Gets processing statuses
    .PARAMETER Name
        Name of the processing status that you want returned. Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdProcessingStatus
        Gets list of all processing statuses

    #>
    [CmdletBinding()]
    param (
        [system.string]$Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/processing_status'
    Write-PSFMessage -Level InternalComment -Message "processing statuses url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}