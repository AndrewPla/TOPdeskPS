function Get-TdIncidentTimeSpent {
    <#
.SYNOPSIS
    Retrieves time spent on an incident
.DESCRIPTION
    Retrieves time spent on an incident

.PARAMETER Number
    The number of the incident that you want to retrieve time spent for.

.EXAMPLE
    PS > Get-TdIncident | Get-TdIncidentTimeSpent
    Returns time spent for the provided incidents

.EXAMPLE
    PS > Get-TdIncidentTimeSpent i1811-123
    returns time spent for i1811-123
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdIncidentTimeSpent')]

    param
    (
        [Parameter(
            ValueFromPipelinebypropertyname = $true,
            position = 0)]
        [Alias('IncidentNumber')]
        [string[]]
        $Number
    )

    process {
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        foreach ($num in $number) {
            $uri = "$(Get-TdUrl)/tas/api/incidents/number/$($num.tolower())/timespent"
            $res = Invoke-TdMethod -Uri $uri
            $res
        }
    }

}

