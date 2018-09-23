function Get-TdArchiveReason {
    <#
    .SYNOPSIS
        Gets archive reasons
    .DESCRIPTION
        Gets archive reasons
    .EXAMPLE
        PS C:\> Get-TdArchiveReason
        Gets list of all archive reasons

    #>
    [CmdletBinding()]
    param (
        
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/archiving-reasons'
    Write-PSFMessage -Level InternalComment -Message "ArchiveReason url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res
}