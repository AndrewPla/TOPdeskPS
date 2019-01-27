function Set-TdIncidentTimeSpent {
    <#
.SYNOPSIS
    Register time spent on an incident
.DESCRIPTION
    Update the timespent on an incident. Can also add a note/reason and you can register time for another operator.

.PARAMETER Number
    The number of the incident that you want to update the timespent on.

.PARAMETER TimeSpent
    Time spent in minutes. Can be negative as long as the total registered time on the incident does not go below 0. Can not be 0.

.PARAMETER Notes
    Notes for the entry of registered time spent
.PARAMETER ReasonId
    The reason for the time spent by id.
.PARAMETER OperatorId
    Operator by id. If not set, currently logged in operator will be used.
.PARAMETER OperatorGroupId
    Operator group by id. Must match with the specified operator. If no operator specified, operator group will also be set as the operator.

.PARAMETER EntryDate
    Date for when the time spent should be registered. If not set, will be set to the current time.
"2015-11-15T14:00:00.000+0200"
The given time offset will be used. Without a given offset Zulu/UTC time will be assumed. E.g. 2015-10-28T10:30:00.000 is equivalent to 2015-10-28T10:30:00.000+0000
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> Set-TdIncidentTimeSpent 'i1911-123' -TimeSpent 30 -Notes 'Installed Printer'
    registers 30 minutes on i1911-123
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdIncidentTimeSpent',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(
            ValueFromPipelinebypropertyname = $true,
            position = 0)]
        [Alias('IncidentNumber')]
        [string]
        $Number,

        [Parameter(position = 1, Mandatory)]
        [int]
        $TimeSpent,

        [string]
        $EntryDate,

        [Parameter(position = 2)]
        [ValidateLength(0, 250)]
        [string]
        $Notes,

        [string]
        $ReasonId,


        [string]
        $OperatorId,

        [string]
        $OperatorGroupId
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/incidents/number/$Number/timespent"
        $body = [PSCustomObject]@{}
        $params = @{ Membertype = 'Noteproperty'; InputObject = $body}

        Switch ($PSBoundParameters.Keys) {
            timeSpent {
                $params['Name'] = 'timeSpent'
                $params['Value'] = $timeSpent
                Add-Member @Params
            }
            notes {
                $params['Name'] = 'notes'
                $params['Value'] = $notes
                Add-Member @Params
            }
            entryDate {
                $params['Name'] = 'entryDate'
                $params['Value'] = $entryDate
                Add-Member @Params
            }
            reasonId {
                $reasonId = @{id = $reasonId}
                $params['Name'] = 'reason'
                $params['Value'] = $reason
                Add-Member @Params
            }
            operatorId {
                $operator = @{id = $operatorid}
                $params['Name'] = 'operator'
                $params['Value'] = $operator
                Add-Member @Params
            }
            operatorGroupId {
                $operatorGroup = @{id = $operatorGroupId}
                $params['Name'] = 'operatorGroup'
                $params['Value'] = $operatorGroup
                Add-Member @Params
            }

        }

        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending body to $uri --- $($body | out-string)")) {
            return
        }
        $methodParams = @{
            Uri = $uri
            Body = ($body | ConvertTo-Json)
            Method = 'POST'
        }
        $res = Invoke-TdMethod @methodParams
        $res
    }
}

