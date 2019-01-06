function Get-TdCountry {
    <#
.SYNOPSIS
    gets list of countries
.DESCRIPTION
    gets list of countries
.PARAMETER Name
        Filter based on the name. Wildcards accepted.
.EXAMPLE
    PS C:\> Get-TdCountry
    gets list of countries
.EXAMPLE
    PS > Get-TdCountry 'USA'
    Returns the USA country
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdCountry')]
    [OutputType([TOPdeskPS.BasicObj])]

    param
    (
        [Parameter(Position = 0)]
        [string]
        $Name = '*'
    )
    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/countries"
        $res = Invoke-TdMethod -Uri $uri
        $res | Where-Object name -like $name | Select-PSFObject -Typename 'TOPdeskPS.BasicObj' -KeepInputObject
    }
}

