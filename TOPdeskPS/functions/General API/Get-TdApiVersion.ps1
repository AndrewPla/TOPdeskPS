function Get-TdApiVersion {
    <#
    .SYNOPSIS
        Gets version of the TOPdesk API
    .DESCRIPTION
        Gets version of the TOPdesk API
    .EXAMPLE
        PS C:\> Get-TdApiVersion
        Gets version of the TOPdesk API

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdApiVersion')]
    param ()
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/version'
    Write-PSFMessage -Level InternalComment -Message "version url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res
}
