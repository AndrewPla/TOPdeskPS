function Get-TdLocationDetail {
    <#
.SYNOPSIS
    Gets location details
.DESCRIPTION
    Returns details of location by id
.PARAMETER LocationId
    Id of the location that you want returned. See Get-TdLocation
.EXAMPLE
    PS C:\> Get-TdLocation | Get-TdLocationDetail
    returns details for all locations
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdLocationDetail')]

    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $LocationId
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/locations/id/$LocationId"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level verbose
    }
}

