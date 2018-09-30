function Get-TdCountry {
    <#
    .SYNOPSIS
        Gets Country
    .DESCRIPTION
        Gets Countries
     .PARAMETER Name
        Name of the Country that you want returned. Wildcards are supported. Default value is '*'

    .EXAMPLE
        PS C:\> Get-TdCountry
        Gets list of all Countries

    #>
    [CmdletBinding( HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdCountry')]
    param (
        [system.string]
        $Name
    )
    Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
    $uri = (Get-TdUrl) + '/tas/api/countries'
    Write-PSFMessage -Level InternalComment -Message "countries url: $uri"
    $Params = @{
        'uri' = $uri
    }

    $res = Invoke-TdMethod @Params
    $res | Where-Object Name -like $Name
}