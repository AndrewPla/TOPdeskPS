function Get-TdImpact {
    <#
    .SYNOPSIS
        Gets list of impacts
    .DESCRIPTION
        Gets list of impacts
    .PARAMETER Name
        Name of the impact that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdImpact
        Gets list of impacts

    #>
    [CmdletBinding( HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdImpact')]
    param (

    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/incidents/impacts'
    Write-PSFMessage -Level InternalComment -Message "Impacts url: $uri"
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}