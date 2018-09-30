function Get-TdArchiveReason {
    <#
    .SYNOPSIS
        Gets archive reasons
    .DESCRIPTION
        Can get all archive reasons, or specify which one you want by a Name lookup.
    .EXAMPLE
        PS C:\> Get-TDArchiveReason -Name 'No longer employed'
        Gets the archive reason with the name 'no longer employed'
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdArchiveReason')]
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