function New-TdIncident {
    <#
.SYNOPSIS
		Creates a new incident

.DESCRIPTION
		This command creates a new incident in TOPdesk

.PARAMETER Action
		Initial action.
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
        Whether the initial action is invisible for persons.
        Can only be set by operators.
        Default value is false

.PARAMETER CallTypeId
Call type by id.
Can be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.

.PARAMETER BriefDescription
		Brief description for the incident. This can be set by operators.
		For partials, if not provided, will be automatically copied from the main incident.
		Can be set by persons only when the appropriate setting for the new call form is checked.

.PARAMETER CallerLookupEmail
        This is the email of the incident's caller. TOPdesk will fill the caller's details into the incident automatically.

        Lookup value for filling in a registered caller's contact details.
Can only be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
The caller is filled in automatically for persons.

.PARAMETER CallerLookupId
Id of the caller.

.PARAMETER EntryTypeId
Entry type by id.
Can only be set by operators.

.PARAMETER Status
		Status of the incident. Available values:
		FirstLine
		SecondLine
        Partial

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
Category by name.
Can be set by operators.
For partials, if not provided, will be automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.
It is an error to provide both an id and a name.

.PARAMETER CategoryId
Category by id.
Can be set by operators.
For partials, if not provided, will be automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.
It is an error to provide both an id and a name.

.PARAMETER Subcategory
	Subcategory by name.
Can be set by operators.
For partials, if not provided, will be automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.
It is an error to provide both an id and a name. If a subcategory is provided without a category, the corresponding category will be filled in automatically, unless there are multiple matching categories, in which case the request will fail.

.PARAMETER ExternalNumber
External number.
Can only be set by operators.
For partials, if not provided, will be automatically copied from the main incident.

.PARAMETER MainIncidentId
Main incident id, required for creating a partial incident.
This must be an open, unarchived second line incident and visible to the operator.
It is an error to provide a main incident for non-partial incidents.
Can only be set by operators.

.PARAMETER ObjectName

Object by name.
Can be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.

.PARAMETER LocationId

Location by id.
Can be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.

.PARAMETER ImpactId
Impact by id.
Can only be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.

.PARAMETER UrgencyId
Urgency by id.
Can only be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.

.PARAMETER PriorityId
Priority by id.
Can only be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
Will be automatically filled in if you provide impact and/or urgency leading to a unique priority according to your priority matrix, and the same request doesn't provide a priority. For incidents with a linked SLA, if the priority provided cannot be found in the Service Level Priority List, the duration field of the incident will be emptied.

.PARAMETER DurationId
Duration by id.
Can only be set by operators.

.PARAMETER TargetDate
Target date.
Can only be set by operators.
Example: "targetDate" : "2015-11-15T14:00:00.000+0200"
The given time offset will be used. Without a given offset Zulu/UTC time will be assumed. E.g. 2015-10-28T10:30:00.000 is equivalent to 2015-10-28T10:30:00.000+0000

.PARAMETER OperatorId
Operator by id.
Can only be set by operators.
For partials, if not provided, will be automatically copied from the main incident.

.Parameter OperatorGroupId
Operator group by id.
Can be set by operators.
For partials, if not provided, will be automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.

.PARAMETER SupplierId
Supplier by id.
Can only be set by operators

.PARAMETER ProcessingStatusId
ProcessingStatus by id.
Can only be set by operators

.PARAMETER Responded

Whether the incident is responded.
SLM-licence is needed.
Can only be set by operators. When the setting "Status determines responded" is on, this will be filled automatically (manual setting is prohibited).

.PARAMETER ResponseDate
Response date.
SLM-licence is needed.
Can only be set by operators.
Will automatically be set to current date if left out and "responded : true" is set.
Example: "responseDate" : "2015-11-15T14:00:00.000+0200"
The given time offset will be used. Without a given offset Zulu/UTC time will be assumed. E.g. 2015-10-28T10:30:00.000 is equivalent to 2015-10-28T10:30:00.000+0000

.PARAMETER Completed
Whether the incident is completed.
Can only be set by operators.

.PARAMETER CompletedDate
Whether the incident is completed.
Can only be set by operators.

.PARAMETER Closed
Whether the incident is closed.
Can only be set by operators.
For partials, will be ignored. The value of completed will be used instead.

.PARAMETER ClosedDate
Closed date.
Can only be set by operators.
For partials, will be ignored. The value of completedDate will be used instead.
Example: "closedDate" : "2018-11-15T14:00:00.000+0200"
The given time offset will be used. Without a given offset Zulu/UTC time will be assumed. E.g. 2018-10-28T10:30:00.000 is equivalent to 2018-10-28T10:30:00.000+0000

.PARAMETER ClosureCodeId
Closure code by id.
Can only be set by operators.

.PARAMETER Costs
Costs.
Can only be set by operators.

.PARAMETER SlaId
SLA by id.
Can only be set by operators.

.PARAMETER OnHold
Specify whether the incident is on hold. On hold date will be filled accordingly. can only be set by operators.

.PARAMETER CallerPhoneNumber
Phone number of the caller.
Can only be set by operators.

.PARAMETER CallerMobileNumber
Mobile phone number of the caller.
Can only be set by operators.

.PARAMETER CallerEmail
Email of the caller.
Can only be set by operators.

.PARAMETER CallerDepartmentId
Department of the caller by id.
Can only be set by operators.

.PARAMETER CallerLocationId
Location of the caller by id.
Can only be set by operators.

.PARAMETER CallerBudgetHolderId
Budget holder of the caller by id.
Can only be set by operators.

.PARAMETER CallerPersonExtraFieldAId
Person extra a of the caller by id.
Can only be set by operators.

.PARAMETER CallerPersonExtraFieldBId
Person extra b of the caller by id.
Can only be set by operators.

.PARAMETER CallerBranchId
The caller branch by id. can only be set by operators.

.PARAMETER MajorCall
Whether the incident is a major call.
Can only be set by operators.

.PARAMETER MajorCallObjectId
Major call by id.
Can only be set by operators.

.PARAMETER PublishToSsd
Whether the incident should be published in the Self Service Desk; only major incidents can be published.
Can only be set by operators.

.PARAMETER Confirm
	If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

.EXAMPLE
		PS > New-TdIncident -CallerLookupEmail 'user@Company.net' -Action 'Initial Action' -BriefDescription 'Example Incident' -Request 'Printer Assistance'
        This creates a basic incident for the Caller 'user@Company.net'

.EXAMPLE
    PS > New-TdIncident -CallerLookupEmail 'user@company.net' -Request 'Incident Request' -OperatorGroupId (Get-TdOperatorGroup 'TechSupport').id
    Creates a new incident and and assigns it to the Techsupport operator group
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/New-TdIncident',
        SupportsShouldProcess = $true)]
    param
    (
        [string]
        $Action,

        [switch]
        $ActionInvisibleForCaller,

        [string]
        $EntryTypeId,

        [string]
        $CallTypeId,

        [string]$ObjectName,

        [string]$LocationId,

        [string]$ExternalNumber,

        [string]$Subcategory,

        [string]$MainIncidentId,

        [ValidateCount(0, 80)]
        [string]
        $BriefDescription,

        [Parameter()]
        [PSFValidatePattern('\w+([-+.'''''''']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*', ErrorMessage = '{0} is not a valid email address.')]
        [string]
        $CallerLookupEmail,


        [Alias('CallerId')]
        [string]
        $CallerLookupId,


        [ValidateSet('firstLine', 'secondLine', 'partial')]
        [string]
        $Status = 'firstLine',

        [string]
        $Request,

        [string]
        $CallerBranchId,

        [string]
        $Category,

        [string]$CategoryId,

        [string]$ImpactId,

        [string]$UrgencyId,

        [string]$PriorityId,

        [string]$DurationId,

        [string]$TargetDate,

        [string]$SlaId,

        [switch]$OnHold,


        # Processing

        [string]$OperatorId,

        [string]$OperatorGroupId,

        [string]$SupplierId,

        [string]$ProcessingStatusId,

        [switch]$Responded,

        [string]$ResponseDate,

        [switch]$Completed,

        [string]$CompletedDate,

        [string]$Closed,

        [string]$ClosedDate,

        [string]$ClosureCodeId,

        [string]$Costs,




        # Construct caller body



        [string]
        $CallerPhoneNumber,

        [string]
        $CallerMobileNumber,

        [string]
        $CallerEmail,

        [string]$CallerDepartmentId,

        [string]$CallerLocationId,

        [string]$CallerBudgetHolderId,

        [string]$CallerPersonExtraFieldAId,

        [string]$CallerPersonExtraFieldBId,

        # end construct caller body


        # Major Call
        [switch]$MajorCall,

        [string]$MajorCallObjectId,

        [switch]$PublishToSsd

    )

    begin {
        $IncidentURL = (Get-TdUrl) + '/tas/api/incidents'
    }

    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"


        $Body = [PSCustomObject]@{ }
        $callerBody = [pscustomobject]@{ }

        switch ($PSBoundParameters.Keys) {
            Action {
                $Body | Add-Member -MemberType NoteProperty -Name 'action' -Value $Action
            }
            ActionInvisibleForCaller {
                $Body | Add-Member -MemberType NoteProperty -Name 'actionInvisibleForCaller' -Value $ActioninvisibleForCaller.tostring().tolower()
            }
            BriefDescription {
                $Body | Add-Member -MemberType NoteProperty -Name 'briefDescription' -Value $BriefDescription
            }
            EntryTypeId {
                $obj = [pscustomobject]@{
                    id = $EntryTypeId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'entryType' -Value $obj
            }

            ExternalNumber {
                $Body | Add-Member -MemberType NoteProperty -Name 'externalNumber' -Value $ExternalNumber
            }

            MainIncidentId {
                $Body | Add-Member -MemberType NoteProperty -Name 'mainIncident' -Value (
                    [pscustomobject]@{ id = $MainIncidentId } )
            }
            CallTypeId {
                $Body | Add-Member -Membertype NoteProperty -Name 'callType' -Value ([pscustomobject]@{id = $CallTypeId })
            }
            Status {

                # Make sure that the case is set properly
                switch ($Status) {
                    'firstline' {
                        $status = 'firstLine'
                    }
                    'secondline' {
                        $status = 'secondLine'
                    }
                    'partial' {
                        $status = 'partial'
                    }
                }

                $Body | Add-Member -MemberType NoteProperty -Name 'status' -Value $Status
            }
            Request {
                $Body | Add-Member -MemberType NoteProperty -Name 'request' -Value $Request

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

            CategoryId {
                $Body | Add-Member -Membertype NoteProperty -Name 'category' -Value ([pscustomobject]@{id = $CategoryId })
            }

            #region Object/location

            ObjectName {
                $Body | Add-Member -MemberType NoteProperty -Name 'object' -Value (
                    [pscustomobject]@{ name = $ObjectName })
            }

            LocationId {
                $Body | Add-Member -MemberType NoteProperty -Name 'location' -Value (
                    [pscustomobject]@{ id = $LocationId }
                )
            }

            #endregion Object/location

            #region Processing
            OperatorId {
                $Body | Add-Member -Membertype NoteProperty -Name 'operator' -Value (
                    [pscustomobject]@{id = $OperatorId })
            }
            OperatorGroupId {
                $Body | Add-Member -Membertype NoteProperty -Name 'operatorGroup' -Value (
                    [pscustomobject]@{id = $operatorGroupId })
            }
            SupplierId {
                $Body | Add-Member -Membertype NoteProperty -Name 'supplier' -Value (
                    [pscustomobject]@{id = $SupplierId })
            }
            ProcessingStatusId {
                $Body | Add-Member -Membertype NoteProperty -Name 'processingStatus' -Value (
                    [pscustomobject]@{id = $ProcessingStatusId })
            }
            Responded {
                $Body | Add-Member -Membertype noteproperty -name 'responded' -Value $Responded.tostring().tolower()
            }
            ResponseDate {
                $Body | Add-Member -Membertype NoteProperty -Name 'responseDate' -Value $ResponseDate
            }
            Completed {
                $Body | Add-Member -Membertype noteproperty -name 'completed' -Value $Completed.tostring().tolower()
            }
            CompletedDate {
                $Body | Add-Member -Membertype NoteProperty -Name 'completedDate' -Value $CompletedDate
            }
            Closed {
                $Body | Add-Member -Membertype noteproperty -name 'Closed' -Value $Closed.tostring().tolower()
            }
            ClosedDate {
                $Body | Add-Member -Membertype NoteProperty -Name 'closedDate' -Value $ClosedDate
            }
            ClosureCodeId {
                $Body | Add-Member -Membertype NoteProperty -Name 'closureCode' -Value (
                    [pscustomobject]@{id = $ClosureCodeId })
            }
            Costs {
                $Body | Add-Member -Membertype NoteProperty -Name 'costs' -Value $Costs
            }
            #endregion Processing


            #region Planning

            ImpactId {
                $Body | Add-Member -MemberType NoteProperty -Name 'impact' -Value (
                    [pscustomobject]@{ id = $ImpactId })
            }


            UrgencyId {
                $Body | Add-Member -MemberType NoteProperty -Name 'urgency' -Value (
                    [pscustomobject]@{ id = $urgencyId })
            }
            PriorityId {
                $Body | Add-Member -MemberType NoteProperty -Name 'priority' -Value (
                    [pscustomobject]@{ id = $PriorityId })
            }
            DurationId {
                $Body | Add-Member -MemberType NoteProperty -Name 'duration' -Value (
                    [pscustomobject]@{ id = $DurationId })
            }
            TargetDate {
                $Body | Add-Member -MemberType NoteProperty -Name 'targetDate' -Value $TargetDate
            }
            SlaId {
                $Body | Add-Member -MemberType NoteProperty -Name 'sla' -Value (
                    [pscustomobject]@{ id = $SlaId })
            }
            OnHold {
                $Body | Add-Member -MemberType NoteProperty -Name 'onHold' -Value $Onhold.tostring().tolower()
            }

            #endregion Planning

            #region callerLookup Construction

            CallerLookupEmail {
                $Body | Add-Member -MemberType NoteProperty -Name 'callerLookup' -Value (
                    [pscustomobject]@{ email = $CallerLookupEmail }
                )
            }

            CallerLookupId {
                $Body | Add-Member -MemberType NoteProperty -Name 'callerLookup' -Value (
                    [pscustomobject]@{ id = $CallerLookupId }
                )
            }

            #endregion callerLookup construction

            #region Major Call
            MajorCall {
                $Body | Add-Member -MemberType NoteProperty -Name 'majorCall' -Value $Majorcall.tostring().tolower()
            }
            MajorCallObjectId {
                $Body | Add-Member -MemberType NoteProperty -Name 'majorCallObject' -Value (
                    [pscustomobject]@{ id = $MajorCallObjectId }
                )
            }
            PublishToSsd {
                $Body | Add-Member -MemberType NoteProperty -Name 'publishToSsd' -Value $PublishToSsd.tostring().tolower()

            }
            #endregion Major Call


            #region Construct CallerBody

            CallerBranchId {
                $obj = [pscustomobject]@{
                    'id' = $callerBranchId
                }

                $callerBody | Add-Member -MemberType noteproperty -Name 'branch' -value $obj
            }

            CallerPhoneNumber {
                $callerBody | Add-Member -MemberType NoteProperty -Name 'phoneNumber' -value $callerPhoneNumber
            }

            CallerMobileNumber {
                $callerBody | Add-Member -MemberType NoteProperty -Name 'mobileNumber' -Value $callerMobileNumber
            }

            CallerEmail {
                $callerBody | Add-Member -MemberType NoteProperty -Name 'email' -Value $callerEmail
            }

            callerDepartmentId {
                $obj = [pscustomobject]@{
                    id = $callerDepartmentId
                }
                $callerBody | Add-Member -MemberType NoteProperty -Name 'department' -Value $obj
            }

            CallerLocationId {
                $obj = [pscustomobject]@{
                    id = $callerlocationId
                }
                $callerBody | Add-Member -MemberType NoteProperty -Name 'location' -Value $obj
            }

            CallerBudgetHolderId {
                $obj = [pscustomobject]@{
                    id = $callerbudgetHolderId
                }
                $callerBody | Add-Member -MemberType NoteProperty -Name 'budgetHolder' -Value $obj
            }

            CallerPersonExtraFieldAId {
                $obj = [pscustomobject]@{
                    id = $callerPersonExtraFieldAId
                }
                $callerBody | Add-Member -MemberType NoteProperty -Name 'personExtraFieldA' -Value $obj
            }

            CallerPersonExtraFieldBId {
                $obj = [pscustomobject]@{
                    id = $callerPersonExtraFieldBId
                }
                $callerBody | Add-Member -MemberType NoteProperty -Name 'personExtraFieldB' -Value $obj
            }

            #endregion
        }


        $Body | Add-Member -MemberType NoteProperty -Name 'caller' -Value $callerBody

        $Params = @{
            'Uri' = $IncidentURL
            'Body' = $Body | ConvertTo-Json
            'Method' = 'Post'
        }
        if ($PSCmdlet.ShouldProcess("The Request" , "Creating new incident with body -- `n $($body | ConvertTo-Json)")) {
            Invoke-TdMethod @Params
        }
    }
}
