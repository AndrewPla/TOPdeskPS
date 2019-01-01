function Get-TdArchiveReason {
    <#
    .SYNOPSIS
        Gets archive reasons
    .DESCRIPTION
        Can get all archive reasons, or specify which one you want by a Name lookup.
    .PARAMETER Name
        Name of the branch that you want returned. Wildcards are supported.
    .EXAMPLE
        PS C:\> Get-TDArchiveReason -Name 'No longer employed'
        Gets the archive reason with the name 'no longer employed'
    .EXAMPLE
        PS> Get-TdArchiveReason -name 'Phased*'
        Returns all archive reasons that begin with "phased"
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdArchiveReason')]
    param (
        [parameter(position = 0)]
        [string]
        $Name = '*'
    )
    $uri = "$(Get-TdUrl)/tas/api/archiving-reasons"
    $res = Invoke-TdMethod -Uri $uri
    $res | Where-Object name -like $Name
}
