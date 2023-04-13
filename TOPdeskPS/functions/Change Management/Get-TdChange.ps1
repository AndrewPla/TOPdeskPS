function Get-TdChange {
    <#
.SYNOPSIS
    Returns changes

.DESCRIPTION
    Returns changes.

.PARAMETER Id
    [DEPRECATED] The internal ID(s) of the change(s) to return. Deprecated, use query parameter instead.

.PARAMETER ClosedDate
    [DEPRECATED] If specified, only changes that were closed on or after the given date are returned. Deprecated, use query parameter instead.

.PARAMETER OperatorGroupId
    [DEPRECATED] If specified, only changes assigned to the given operator group(s) will be returned. Deprecated, use query parameter instead.

.PARAMETER OperatorId
    [DEPRECATED] If specified, only changes assigned to the given operator(s) will be returned. Deprecated, use query parameter instead.

.PARAMETER ChangeType
    [DEPRECATED] If specified, only changes of the supplied type(s) will be returned. Deprecated, use query parameter instead.

.PARAMETER Phase
    [DEPRECATED] If specified, only changes in the supplied phase(s) will be returned. Deprecated, use query parameter instead.

.PARAMETER Status
    [DEPRECATED] If specified, only changes in the supplied status(es) will be returned. Deprecated, use query parameter instead.

.PARAMETER Open
    [DEPRECATED] If specified, only changes that are open will be returned. Specify -Open:$false to return only closed changes. Deprecated, use query parameter instead.

.PARAMETER Archived
    [DEPRECATED] If specified, only changes that are archived will be returned. Specify -Archived:$false to return only active changes. Deprecated, use query parameter instead.

.PARAMETER FiqlQuery
    Specify FIQL Query. The following query parameters can be used:

    simple.assignee.groupName
    simple.assignee.group.name
    simple.assignee.groupId
    simple.assignee.group.id
    simple.assignee.name
    simple.assignee.id
    simple.plannedImplementationDate
    simple.closedDate
    number
    changeType
    phase
    status
    creationDate
    closedDate (applies for both types of changes, for simple the closed date and for extensive changes the final date is used)
    open
    archived
    briefDescription
    modificationDate
    simple.implementationDate
    archiveReason.id
    archiveReason.name
    branch.id
    branch.name
    incident.id
    incident.number
    location.id
    location.name
    milestone.id
    milestone.name
    submitDate
    supplier.id
    supplier.name
    creator.id
    creator.name
    modifier.id
    modifier.name
    version.id
    version.name
    withEvaluation
    template.id
    template.name
    type.id
    type.name
    requester.id
    requester.name
    requester.branch.id
    requester.branch.name
    requester.location.id
    requester.location.name
    requester.department.id
    requester.department.name
    requester.budgetHolder.id
    requester.budgetHolder.name
    object.id
    object.name
    object.type
    requestDate
    urgent
    coordinator.id
    coordinator.name
    externalNumber
    impact.id
    impact.name
    benefit.id
    benefit.name
    priority.id
    priority.name
    category.id
    category.name
    subcategory.id
    subcategory.name
    canceled.cancelDate
    phases.rfc.endDate
    phases.rfc.plannedEndDate
    phases.rfc.rejectedDate
    simple.plannedStartDate
    phases.progress.endDate
    phases.progress.plannedEndDate
    phases.progress.noGoDate
    phases.progress.authorizer.type
    phases.progress.authorizer.id
    phases.progress.authorizer.name
    phases.progress.authorizer.groupId
    phases.progress.authorizer.groupName
    phases.evaluation.endDate
    phases.evaluation.plannedEndDate
    phases.evaluation.noGoDate
    phases.evaluation.authorizer.type
    phases.evaluation.authorizer.id
    phases.evaluation.authorizer.name
    phases.evaluation.authorizer.groupId
    phases.evaluation.authorizer.groupName
    phases.prfc.authorizer.type
    phases.prfc.authorizer.groupId
    phases.prfc.authorizer.groupName
    phases.prfc.authorizer.id
    phases.prfc.authorizer.name
    phases.rfc.authorizer.id
    phases.rfc.authorizer.name
    phases.prfc.endDate
    phases.prfc.rejectedDate
    simple.startDate
    optionalFields1.number1 (optionalFields[1,2].number[1-5])
    optionalFields1.date1 (optionalFields[1,2].date[1-5])
    optionalFields1.boolean1 (optionalFields[1,2].boolean[1-5])
    optionalFields1.memo1 (optionalFields[1,2].memo[1-5])
    optionalFields1.text1 (optionalFields[1,2].text[1-5])
    optionalFields1.searchlist1.id (optionalFields[1,2].searchlist[1-5].id)
    optionalFields1.searchlist1.name (optionalFields[1,2].searchlist[1-5].name)
    asset.id
    currentPlanCosts
    estimateCosts
    simpleCosts
    originalPlanCosts
    realizedCostsOnActivities
    remainingCostsOnActivities
    currentPlanTimeSpent
    estimateTimeSpent
    originalPlanTimeSpent
    realizedTimeSpentOnActivities
    remainingTimeSpentOnActivities
    simpleTimeSpent
    processingStatus

    The following operations are available:

    field==value: Equals. Not available for memo values.
    field!=value: Not equal. Not available for memo values.
    field==null: Is null. Special case of Equals, works for all field types.
    field!=null: Is not null. Special case of Not equal, works for all field types.
    field=gt=value: Greater than. Only available for numeric and date values.
    field=ge=value: Greater than or equal. Only available for numeric and date values.
    field=lt=value: Less than. Only available for numeric and date values.
    field=le=value: Less than or equal. Only available for numeric and date values.
    field=sw=value: Starts with. Only available for text and memo values.
    field=in=(oneValue,otherValue): In list. For querying resources that have one of several values, for example all reservations and requests. Not available for memo values.
    field=out=(oneValue,otherValue): Not in list. For querying resources that don't have one of several values, for example all reservations except cancelled and rejected ones. Not available for memo values.
    oneCondition;otherCondition: And operation. Conditions can be and-ed together using a ;.
    oneCondition,otherCondition: Or operation. Conditions can be or-ed together using a ,.
    You can use brackets to group and/or sets together. By default, and takes precedence.

    A value can be specified without quoting or escaping, unless it contains a white space or reserved character.
    String values can be quoted using either ' or ".
    If you need to use both single and double quotes inside a quoted argument, then you must escape one of them using \ (backslash).
    If you want to use \ literally, then double it as \\. Backslash has a special meaning only inside a quoted argument, not in unquoted argument.
    The reserved characters are ' " ( ) ; , = ! ~ > >.
    Date values can be specified using ISO 8601 format which is yyyy-MM-ddTHH:mm:ssZ. The time zone can be specified as Z for UTC, or as offset +/-0900 or +/-01:00.

.PARAMETER Sort
    A parameter to sort the results by. It is currently possible to sort on:

    id
    creationDate
    simple.closedDate
    simple.plannedImplementationDate
    simple.plannedStartDate
    phases.rfc.plannedEndDate
    phases.progress.plannedEndDate
    phases.evaluation.plannedEndDate

    You can specify the direction by providing asc or desc separated by a colon : . The default is desc. Changes that do not have the field set, will always be sorted at the end. For example simple.closedDate:asc
    If the performance is the most important and you don't care about sorting then use id:desc

.PARAMETER Fields
    This parameter allows the client to specify which fields of the Change are present in responses.
    fields must be a string containing a list of supported fields separated with comma. If the keyword 'all' is used the response will contain all of the fields in the example response.
    To specify nested fields use the dot anotation. F.e. fields=simple.assignee.name,status.id
    Note that, unknown items in the fields parameter will result in an error.
    If the fields is mentioned but it was empty, only the id of Change will be returned.
    If a parameter specified more than once, it will NOT result in an error.
    If a Change doesn't have any value for a requested field, that field will be part of response with null as value.
    Field names for Change are case-sensitive.

.PARAMETER PageSize
    Only show this amount of changes in the results. Default is 1000.

.PARAMETER PageStart
    A parameter to tell at which entry the results should start. Default is 0.

.EXAMPLE
    PS C:\> Get-TdChange
    Returns all changes

    PS C:\> $startDate = [datetime]::ParseExact('2023-01-01', 'yyyy-MM-dd', $null)
    PS C:\> $FiqlQuery = "template.name=='New VM';creationDate=ge=" + $startDate.ToString('yyyy-MM-ddTHH:mm:ssZ')
    PS C:\> $changes = Get-TdChange -FiqlQuery $FiqlQuery
    Returns all changes based on the template 'New VM' and created after 2023-01-01.

    PS C:\> $Fields = "number,briefDescription,category,subcategory"
    PS C:\> $changes = Get-TdChange -Fields $fields
    Returns the changes with 4 fields.

    PS C:\> $Fields = "all"
    PS C:\> $change = Get-TdChange -Fields $fields -PageSize 1
    Returns all fields of one change

    PS C:\> $sort = "simple.closedDate:asc"
    PS C:\> $changes = Get-TdChange -Sort $sort
    PS C:\> $changes | Select-Object  @{Label = 'ClosedDate'; Expression = { $_.Simple.closedDate } }, Number
    Returns changes sorted on close date with their respective number

    PS C:\> $changes0 = Get-TdChange -PageSize 10 -PageStart 0
    PS C:\> $changes10 = Get-TdChange -PageSize 10 -PageStart 10
    PS C:\> $changes0
    PS C:\> $changes10
    Returns 0..9 and 10..19 most recent changes
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChange')]

    param
    (
        [Parameter(Position = 0)]
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
        $Archived,

        [string]
        $FiqlQuery,

        [string]
        $Sort,

        [string]
        $Fields,

        [int]
        $PageSize,

        [int]
        $PageStart
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

        if ($PSBoundParameters.Keys -contains 'FiqlQuery') {
            $methodParams['Uri'] = "$($methodParams.uri)&query=$($FiqlQuery.ToString())"
        }

        if ($PSBoundParameters.Keys -contains 'Sort') {
            $methodParams['Uri'] = "$($methodParams.uri)&sort=$($Sort.ToString())"
        }

        if ($PSBoundParameters.Keys -contains 'Fields') {
            $methodParams['Uri'] = "$($methodParams.uri)&fields=$($Fields.ToString())"
        }

        if ($PSBoundParameters.Keys -contains 'PageSize') {
            $methodParams['Uri'] = "$($methodParams.uri)&pageSize=$($PageSize.ToString())"
        }

        if ($PSBoundParameters.Keys -contains 'PageStart') {
            $methodParams['Uri'] = "$($methodParams.uri)&pageStart=$($PageStart.ToString())"
        }

        (Invoke-TdMethod @methodParams).results
    }
}
