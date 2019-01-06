function Get-TdLocation {
    <#
.SYNOPSIS
    returns list of locations
.DESCRIPTION
    returns list of locations
    .PARAMETER Archived
    Whether to return archived locations or not.
    .PARAMETER Name
    only return locations matching the pattern. Wildcards accepts
.EXAMPLE
    PS C:\> Get-TdLocation
    returns list of locations
.EXAMPLE
    PS> Get-TdLocation location2
    Returns location2
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdLocation')]

    param
    (
        [Parameter(Position = 0)]
        [System.String]
        $Name = '*',

        [Parameter()]
        [switch]$Archived


    )


    process {
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/locations"
        if ($Archived) {$uri = "$uri/?archived=$($Archived.ToString().ToLower())"}
        $res = Invoke-TdMethod -Uri $uri
        $res | Where-Object name -like $name
    }

}

