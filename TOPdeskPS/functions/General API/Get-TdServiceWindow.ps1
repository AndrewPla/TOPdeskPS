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
    .EXAMPLE
        PS> Get-TdServiceWindow Window1
        Returns the window1 service windows

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdServiceWindow')]
    param (
        [system.string]$Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/serviceWindow/lookup/'
    $res = Invoke-TdMethod $uri
    $res | Where-Object name -like $Name
}
