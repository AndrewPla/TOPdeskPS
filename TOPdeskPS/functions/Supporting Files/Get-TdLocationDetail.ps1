function Get-TdLocationDetail {
    <#
.SYNOPSIS
    Gets location details
.DESCRIPTION
    Returns details of location by id
.PARAMETER Location
    Id of the location that you want returned. See Get-TdLocation
.EXAMPLE
    PS C:\> Get-TdLocation | Get-TdLocationDetail
    returns details for all locations
.EXAMPLE
    PS> Get-TdLocation 'Mars' | Get-TdLocationDetail
    Returns details for the mars location
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdLocationDetail')]

    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $Location
    )

    process {
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/locations/id/$Location"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
}

