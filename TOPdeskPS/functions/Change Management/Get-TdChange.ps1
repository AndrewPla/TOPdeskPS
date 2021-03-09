function Get-TdChange {
    <#
.SYNOPSIS
    Returns changes

.DESCRIPTION
    Returns changes.

.PARAMETER Id
    The internal ID(s) of the change(s) to return.

.PARAMETER ClosedDate
    If specified, only changes that were closed on or after the given date are returned.

.PARAMETER OperatorGroupId
    If specified, only changes assigned to the given operator group(s) will be returned.

.PARAMETER OperatorId
    If specified, only changes assigned to the given operator(s) will be returned.

.PARAMETER ChangeType
    If specified, only changes of the supplied type(s) will be returned.

.PARAMETER Phase
    If specified, only changes in the supplied phase(s) will be returned.

.PARAMETER Status
    If specified, only changes in the supplied status(es) will be returned.

.PARAMETER Open
    If specified, only changes that are open will be returned. Specify -Open:$false to return only closed changes.

.PARAMETER Archived
    If specified, only changes that are archived will be returned. Specify -Archived:$false to return only active changes.

.EXAMPLE
    PS C:\> Get-TdChange
    Returns all changes
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChange')]

    param
    (
        [Parameter(Position=0)]
        [string[]]
        $Id,

        [datetime]
        $ClosedDate,

        [string[]]
        $OperatorGroupId,

        [string[]]
        $OperatorId,

        [string[]]
        [ValidateSet('simple', 'extensive')]
        $ChangeType,

        [string[]]
        [ValidateSet('prfc', 'rfc', 'simple', 'progress', 'evaluation', 'closed', 'rejected', 'canceled')]
        $Phase,

        [string[]]
        $Status,

        [switch]
        $Open,

        [switch]
        $Archived
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $methodParams = @{
            Uri = "$(Get-TdUrl)/tas/api/operatorChanges?"
        }

        if ($PSBoundParameters.Keys -contains 'ClosedDate') {
            $methodParams['Uri'] = "$($methodParams.uri)&closedDate.start=$(get-date $ClosedDate -UFormat '+%Y-%m-%dT%H:%M:%SZ')"
        }

        if ($PSBoundParameters.Keys -contains 'OperatorGroupId') {
            foreach ($g in $OperatorGroupId) {
                $methodParams['Uri'] = "$($methodParams.uri)&simple.assignee.groupid=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'OperatorId') {
            foreach ($g in $OperatorId) {
                $methodParams['Uri'] = "$($methodParams.uri)&simple.assignee.id=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'ChangeType') {
            foreach ($g in $ChangeType) {
                $methodParams['Uri'] = "$($methodParams.uri)&changeType=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'Phase') {
            foreach ($g in $Phase) {
                $methodParams['Uri'] = "$($methodParams.uri)&phase=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'Status') {
            foreach ($g in $Status) {
                $methodParams['Uri'] = "$($methodParams.uri)&status=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'Id') {
            foreach ($g in $Id) {
                $methodParams['Uri'] = "$($methodParams.uri)&id=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'Open') {
                $methodParams['Uri'] = "$($methodParams.uri)&open=$($Open.ToString().ToLower())"
        }

        if ($PSBoundParameters.Keys -contains 'Archived') {
                $methodParams['Uri'] = "$($methodParams.uri)&archived=$($Archived.ToString().ToLower())"
        }

        (Invoke-TdMethod @methodParams).results
    }
}
