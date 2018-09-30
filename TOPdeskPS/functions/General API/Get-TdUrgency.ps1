function Get-TdUrgency {
    <#
    .SYNOPSIS
        Gets list of all urgencies
    .DESCRIPTION
        Gets list of all urgencies
    .PARAMETER Name
        Name of the urgency that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdUrgency
        Gets list of all urgencies

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdUrgency')]
    param (
        $Name = '*'
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/urgencies'
    Write-PSFMessage -Level InternalComment -Message "urgencies url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}