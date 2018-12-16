function Set-TdIncident {
    <#
	.SYNOPSIS
		Updates an incident

	.DESCRIPTION
		This command updates various properties of an incident.

	.PARAMETER Number
		Number of the TOPdesk incident that you want to modify.

	.PARAMETER Action
		Add an action.
        The following html tags can be used to format the text:

        <i>
        <em>
        <b>
        <strong>
        <u>
        <a>
        <img> BASE64-encoding has to be used. Only pictures up to the size of 450x450 pixels are supported. Allowed picture-formats:
        gif, png, bmp, pcx, iff, ras, pnm, psd, jpg
        Example:
        <img src="data:image/png;base64,iVBORw0KGgoAAA...">
        Line breaks can be added via <br> tags and are automatically added after a closing <p> or <div>.
        Can be set by operators and persons.

    .PARAMETER ActionInvisibleForCaller
        Whether the added action is invisible for persons.
        Can only be set by operators.

	.PARAMETER BriefDescription
		Brief description for the incident. This can be set by operators.
		For partials, if not provided, will be automatically copied from the main incident.
		Can be set by persons only when the appropriate setting for the new call form is checked.

	.PARAMETER Request
		The initial request for the incident. You will likely want to use a here-string to construct the request of the incident.

		Line breaks can be added via <br> tags and are automatically added after a closing <p> or
		The following html tags can be used to format the text:

		<i>
		<em>
		<b>
		<strong>
		<u>
		<a>
		<img> BASE64-encoding has to be used. Only pictures up to the size of 450x450 pixels are supported. Allowed picture-formats:
		gif, png, bmp, pcx, iff, ras, pnm, psd, jpg

	.PARAMETER Category
		The name of the category for the incident. Can be set by operators. If not provided to partial incidents, the category will be automatically copied from the main incident.

	.PARAMETER Subcategory
		The name of the category for the incident. Can be set by operators.
		If a subcategory is provided without a category, the corresponding category will be filledi n automatically, unless there are multiple matching categories, in which case the request will fail.
		If not provided to partial incidents, the category will be automatically copied from the main incident.

	.PARAMETER CallerEmail
        This is the email of the incident's caller. TOPdesk will fill the caller's details into the incident automatically.

    .PARAMETER EntryType
        Entry type by id.
        Can only be set by operators.

    .PARAMETER CallType
        Call type by id.
        Can only be set by operators.
        For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

    .PARAMETER CallerBranch
        The caller branch by id.
        Can only be set by operators.

    .PARAMETER CallerEmail
        Email of the caller.
        Can only be set by operators

    .PARAMETER Impact
        Impact by id.
        Can only be set by operators.
        For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

    .PARAMETER Urgency
        Urgency by id.
        Can only be set by operators.
        For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

    .PARAMETER Priority
    Priority by id.
    Can only be set by operators.
    For partial incidents, this field is determined by the main incident and will give an error if provided in the request.
    Will be automatically filled in if you provide impact and/or urgency leading to a unique priority according to your priority matrix, and the same request doesn't provide a priority. For incidents with a linked SLA, if the priority provided cannot be found in the Service Level Priority List, the duration field of the incident will be emptied.

    .PARAMETER ObjectId
        Object by id.
        Can only be set by operators.
        For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

    .PARAMETER LocationId
        Location by id.
        Can only be set by operators.
        For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

    .PARAMETER Operator

Operator by id.
Can only be set by operators.

.PARAMETER OperatorGroup
    Operator group by id.
Can only be set by operators.

.PARAMETER Supplier
    Supplier by id.
Can only be set by operators.
Cannot be filled in if the incident has a supplier service linked.

.PARAMETER ProcessingStatus
Processing status by id.
Can only be set by operators.

.PARAMETER Responded

Whether the incident is responded.
SLM-licence is needed.
Can only be set by operators. When the setting "Status determines responded" is on, this will be filled automatically (manual setting is prohibited).

.PARAMETER Completed
Whether the incident is completed.
Can only be set by operators.

.PARAMETER Closed
Whether the incident is closed.
Can only be set by operators and persons.

.PARAMETER Costs
Costs
Can only be set by operators.

.PARAMETER Duration

Duration by id.
Can only be set by operators.
Cannot be filled in if the incident has a supplier service linked.

    .PARAMETER TargetDate
    Target date. This includes the timezone information from the provided object.
Can only be set by operators.
Cannot be filled in if the incident has a supplier service linked.

    .PARAMETER OnHold
    sets the ticket to onhold.
    Can only be set by operators.

    .PARAMETER MajorCall
        Whether the incident is a major call.
        Can only be set by operators.

    .PARAMETER MajorCallObject
        Major call by id.
        Can only be set by operators.

    .PARAMETER PublishToSsd
        Whether the incident should be published in the Self Service Desk, only major incidents can be published.
        Can only be set by operators.

        .PARAMETER ClosureCode
            Closure code by id.
Can only be set by operators.

.PARAMETER ExternalNumber

External number.
Can only be set by operators.

	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

	.EXAMPLE
		PS C:\> Set-TdIncident -IncidentNumber 'I1805-221' -Action 'Example Action'
		Updates incident I1805-221 with the action 'Example Action'
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Set-TdIncident',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            position = 0)]
        [string]
        $Number,

        [string]
        $Action,

        [switch]
        $ActionInvisibleForCaller,

        [ValidateCount(0, 80)]
        [string]
        $BriefDescription,

        [string]
        $Request,

        [string]
        $Category,

        [string]
        $Subcategory,

        [PSFValidatePattern('\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*', ErrorMessage = '{0} is not a valid email address.')]
        [string]
        $CallerEmail,

        [string]
        $EntryType,

        [string]
        $ExternalNumber,

        [string]
        $CallerBranch,

        [string]
        $Impact,

        [string]
        $Urgency,

        [string]
        $Priority,

        [string]
        $ObjectId,

        [string]
        $LocationId,

        [string]
        $CallType,

        [string]
        $Operator,

        [string]
        $OperatorGroup,

        [string]
        $Supplier,

        [alias('Status')]
        [string]
        $ProcessingStatus,

        [Switch]
        $Responded,

        [switch]
        $Completed,

        [switch]
        $Closed,

        [string]
        $ClosureCode,

        [single]
        $Costs,

        [string]
        $Duration,

        [datetime]
        $TargetDate,

        [switch]
        $OnHold,

        [switch]
        $MajorCall,

        [string]
        $MajorCallObject,

        [switch]
        $PublishToSsd

    )
    <#TODO


        Responsedate
        completeddate

        closedDate

        feedbackRating
        feedbackMessage


        lots of free fields
        #>

    process {
        Write-PSFMessage -Level InternalComment -Message "ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "PSBoundParameters: $($PSBoundParameters | Out-String)"

        $IncidentURL = (Get-TdUrl) + "/tas/api/incidents/number/$($Number.ToLower())"



        Write-PSFMessage -Level Verbose -Message "Generating Body of request"
        $Body = [PSCustomObject]@{}
        $callerBody = [PSCustomObject]@{}

        switch ($PSBoundParameters.Keys) {
            Action {
                $Body | Add-Member -MemberType NoteProperty -Name 'action' -Value $Action
            }
            ActionInvisibleForCaller {
                $Body | Add-Member -MemberType NoteProperty -Name 'actionInvisibleForCaller' -Value ($ActionInvisibleForCaller.tostring().tolower())
            }
            BriefDescription {
                $Body | Add-Member -MemberType NoteProperty -Name 'briefDescription' -Value $BriefDescription
            }
            Status {
                $Body | Add-Member -MemberType NoteProperty -Name 'status' -Value $Status
            }
            Request {
                $Body | Add-Member -MemberType NoteProperty -Name 'request' -Value $Request
            }
            CallerEmail {
                $CallerLookup = @{ 'email' = $CallerEmail }
                $Body | Add-Member -MemberType NoteProperty -Name 'callerLookup' -Value $CallerLookup
            }
            Subcategory {
                $SubcategoryValue = @{
                    name = $Subcategory
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'subcategory' -Value $SubcategoryValue
            }
            Category {
                $CategoryValue = @{
                    name = $Category
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'category' -Value $CategoryValue
            }
            EntryType {
                $entryTypeValue = @{ id = $entryType }
                $Body | Add-Member -MemberType NoteProperty -Name 'entryType' -Value $EntryTypeValue
            }
            CallType {
                $callTypeValue = @{ id = $CallType}
                $Body | Add-Member -MemberType NoteProperty -Name 'callType' -Value $callTypeValue
            }
            ExternalNumber {
                $Body | Add-Member -MemberType NoteProperty -name 'externalNumber' -Value $ExternalNumber
            }

            Impact {
                $val = @{id = $Impact}
                $Body | Add-Member -MemberType NoteProperty -Name impact -Value $val
            }

            Urgency {
                $val = @{id = $urgency}
                $Body | Add-Member -MemberType NoteProperty -Name urgency -Value $val
            }

            Priority {
                $val = @{id = $Priority}
                $body | Add-Member -MemberType NoteProperty -name priority -Value $val
            }

            ObjectId {
                $val = @{id = $ObjectId}
                $body | Add-Member -MemberType NoteProperty -name object -Value $val
            }

            LocationId {
                $val = @{ id = $LocationId }
                $body | Add-Member -MemberType NoteProperty -name object -Value $val
            }

            Operator {
                $val = @{id = $Operator}
                $body | Add-Member -MemberType NoteProperty -name operator -Value $val
            }

            OperatorGroup {
                $val = @{id = $OperatorGroup}
                $body | Add-Member -MemberType NoteProperty -name operatorGroup -Value $val
            }

            Supplier {
                $val = @{id = $Supplier}
                $body | Add-Member -MemberType NoteProperty -name supplier -Value $val
            }

            ProcessingStatus {
                $val = @{id = $ProcessingStatus}
                $body | Add-Member -MemberType NoteProperty -name processingStatus -Value $val
            }
            Responded {
                $body | Add-Member -MemberType NoteProperty -name responded -Value ($Responded.tostring().tolower())
            }
            Completed {
                $body | Add-Member -MemberType NoteProperty -name completed -Value ($Completed.tostring().tolower())
            }

            Closed {
                $body | Add-Member -MemberType NoteProperty -name closed -Value ($closed.tostring().tolower())
            }

            Costs {
                $body | Add-Member -MemberType NoteProperty -name costs -Value $Costs
            }

            Duration {
                $val = @{id = $Duration}
                $body | Add-Member -MemberType NoteProperty -name duration -Value $val
            }
            TargetDate {
                $d = Get-Date $TargetDate -UFormat "%Y-%m-%dT%H:%M:%S.000%Z00"
                $Body | Add-Member -MemberType NoteProperty -Name targetDate -Value $d
            }

            OnHold {
                $body | Add-Member -MemberType NoteProperty -name onHold -Value ($OnHold.tostring().tolower())
            }

            MajorCall {
                $Body | Add-Member -MemberType NoteProperty -name majorCall -value ($MajorCall.tostring().tolower())
            }

            MajorCallObject {
                $val = @{id = $MajorCallObject}
                $Body | Add-Member -MemberType NoteProperty -Name majorCallObject -Value $val
            }

            PublishToSsd {
                $Body | Add-Member -MemberType NoteProperty -Name publishToSsd -Value ($PublishToSsd.tostring().tolower())
            }

            #region Caller Parameters
            CallerBranch {
                $caller = $true
                $val = @{id = $CallerBranch}
                $callerBody | Add-Member -MemberType NoteProperty -Name branch -Value $val
            }
            CallerEmail {
                $caller = $true
                $callerBody | Add-Member -MemberType NoteProperty -Name email -Value $CallerEmail
            }
            #endregion caller Parameters


        }
        if ($caller) { $Body | Add-Member -MemberType NoteProperty -Name caller -Value $callerBody }

        $Params = @{
            'Uri' = $IncidentURL
            'Body' = $Body | ConvertTo-Json
            'Method' = 'Put'
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $IncidentUrl -Action "Sending $($Params.body | out-string) ")) {
            return
        }
        Invoke-TdMethod @Params
    }
}
