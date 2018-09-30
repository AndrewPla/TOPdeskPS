function Get-TdArchiveReason {
    <#
    .SYNOPSIS
        Gets archive reasons
    .DESCRIPTION
        Gets archive reasons
    .PARAMETER Name
        Name of the archive reason that you want returned. Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdArchiveReason
        Gets list of all archive reasons
    .EXAMPLE PS C:\> Get-TDArchiveReason -Name 'No longer employed'
        Gets the archive reason with the name 'no longer employed'

    #>
    [CmdletBinding()]
    param (
        [system.string]
        $Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/archiving-reasons'
    Write-PSFMessage -Level InternalComment -Message "ArchiveReason url: $uri"
    $Params = @{
        'uri' = $uri
    }
    Write-PSFMessage -Level InternalComment -Message "URI: $uri"

    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}