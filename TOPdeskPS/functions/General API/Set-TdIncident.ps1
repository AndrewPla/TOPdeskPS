function Set-TdIncident {
    <#
	.SYNOPSIS
		Updates an incident

	.DESCRIPTION
		This command updates various properties of an incident.

	.PARAMETER IncidentNumber
		Number of the TOPdesk incident that you want to update.

	.PARAMETER Action
		A description of the Action parameter.

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

    .PARAMETER EntryType
        ID of EntryType see Get-TdEntryType
    .PARAMETER CallType
        ID of CallType see Get-TdCallType
	.PARAMETER CallerLookup
        This is the ID of the incident's caller. TOPdesk will fill the caller's details into the incident automatically.

    .PARAMETER ActionInvisibleForCaller
        will make posted action invisible to caller

    .PARAMETER BranchId
    ID of the Branch. See Get-TdBranch | this is used for links

    .PARAMETER LocationId
    ID of the Location. See Get-TdLocation | this is used for links

    .PARAMETER ObjectId
    ID of the object

    .PARAMETER CallerBranchId
    ID of the Caller's Branch. See Get-TdBranch

    .PARAMETER CallerDynamicName
    Caller's name

    .PARAMETER CallerPhoneNumber
    Caller's Phone Number

    .PARAMETER CallerMobileNumber
    Caller's Mobile Number

    .PARAMETER CallerEmail
    Caller's Email

    .PARAMETER CallerDepartmentId
    ID of caller's department. See Get-TdDepartment

    .PARAMETER CallerLocationId
    ID of caller's location. See Get-TdLocation

    .PARAMETER CallerBudgetHolderId
    ID of Caller's BudgetHolder See Get-TdBudgetHolder

    .PARAMETER ImpactID
    ID of Impact. See Get-TdImpact

    .PARAMETER UrgencyId
    ID of Urgency. See Get-TdUrgency

    .PARAMETER ProcessingStatusId
    ID of ProcessingStatus see Get-TdProcessingStatus

    .PARAMETER PriorityId
    ID of Priority. See Get-TdPriority

    .PARAMETER DurationId
    ID of Duration. See Get-TdDuration

    .PARAMETER TargetDate
    Target Date in format 2015-11-15T14:00:00.000+0200

    .PARAMETER OnHold
    OnHold true/false

    .PARAMETER OperatorID
    ID of Operator. See Get-TdOperator

    .PARAMETER OperatorGroupID
    ID of OperatorGroup. See Get-TdOperatorGroup

    .PARAMETER SupplierID
    ID of Supplier. See Get-TdSupplier

    .PARAMETER ProcessingStatus
    ID of ProcessingStatus. See Get-TdProcessingStatus

    .PARAMETER Responded
    Responded true/false

    .PARAMETER ResponseDate
    Response Date in format 2015-11-15T14:00:00.000+0200

    .PARAMETER Completed
    Completed true/fause

    .PARAMETER CompletedDate
    Completed Date in format 2015-11-15T14:00:00.000+0200

    .PARAMETER Closed
    Closed true/false

    .PARAMETER ClosedDate
    Closed Date in format 2015-11-15T14:00:00.000+0200

    .PARAMETER ClosureCodeId
    ID of ClosureCode see Get-TdClosureCode

    .PARAMETER Costs
    Float value of Costs

    .PARAMETER ExternalNumber
    External Number

	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

	.EXAMPLE
		PS C:\> Set-TdIncident -IncidentNumber 'I1805-221' -Action 'Example Action'
        Updates incident I1805-221 with the action 'Example Action'

    .LINK
    https://developers.topdesk.com/documentation/index.html#api-Incident-UpdateIncidentByNumber
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Set-TdIncident',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Number')]
        [string]
        $IncidentNumber,

        [ValidateCount(0, 80)]
        [string]
        $BriefDescription,

        [string]
        $Request,

        [string]
        $Action,

        [switch]
        $ActionInvisibleForCaller,

        [string]
        $EntryType,

        [string]
        $CallType,

        [string]
        $Category,

        [string]
        $Subcategory,

        [string]
        $ExternalNumber,

        #[PSFValidatePattern('\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*', ErrorMessage = '{0} is not a valid email address.')]
        [string]
        $CallerLookup, #TODO change this to accept email or ID

        [string]
        $CallerBranchId,

        [string]
        $CallerDynamicName,

        [string]
        $CallerPhoneNumber,

        [string]
        $CallerMobileNumber,

        [PSFValidatePattern('\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*', ErrorMessage = '{0} is not a valid email address.')]
        [string]
        $CallerEmail,

        [string]
        $CallerDepartmentId,

        [string]
        $CallerLocationId,

        [string]
        $CallerBudgetHolderId,

        [string]
        $ObjectId,

        [string]
        $LocationId,

        [string]
        $BranchId,

        [string]
        $ImpactId,

        [string]
        $UrgencyId,

        [string]
        $PriorityId,

        [string]
        $DurationId,

        [string]
        $TargetDate,

        [switch]
        $OnHold,

        [string]
        $OperatorId,

        [string]
        $OperatorGroupId,

        [string]
        $SupplierId,

        [string]
        $ProcessingStatusId,

        [switch]
        $Responded,

        [string]
        $ResponseDate,

        [switch]
        $Completed,

        [string]
        $CompletedDate,

        [switch]
        $Closed,

        [string]
        $ClosedDate,

        [string]
        $ClosureCodeId,

        [string]
        $costs

    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'

    }
    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $IncidentURL = (Get-TdUrl) + "/tas/api/incidents/number/$($IncidentNumber.ToLower())"

        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $IncidentNumber -Action 'Updating the incident.')) {
            return
        }

        Write-PSFMessage -Level Verbose -Message "Generating Body of request"
        $Body = [PSCustomObject]@{
        }
        $Caller = [PSCustomObject]@{
        }


        switch ($PSBoundParameters.Keys) {
            Action {
                Write-PSFMessage -Level InternalComment -Message "Adding action to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'action' -Value $Action
            }
            ActionInvisibleForCaller {
                Write-PSFMessage -Level InternalComment -Message "Adding ActionInvisibleForCaller to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'ActionInvisibleForCaller' -Value $ActionInvisibleForCaller
            }
            BriefDescription {
                Write-PSFMessage -Level InternalComment -Message "Adding BriefDescription to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'briefDescription' -Value $BriefDescription
            }
            Status {
                Write-PSFMessage -Level InternalComment -Message "Adding Status to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'status' -Value $Status
            }
            Request {
                Write-PSFMessage -Level InternalComment -Message "Adding Request to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'request' -Value $Request
            }

            CallerLookup {
                Write-PSFMessage -Level InternalComment -Message "Adding CallerId to Body"

                $ThisCallerLookup = @{
                    'id' = $CallerLookup
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'callerLookup' -Value $ThisCallerLookup
            }
            Subcategory {
                Write-PSFMessage -Level InternalComment -Message "Adding Subcategory to Body"
                $SubcategoryValue = @{
                    name = $Subcategory
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'subcategory' -Value $SubcategoryValue
            }
            Category {
                Write-PSFMessage -Level InternalComment -Message "Adding category to Body"
                $CategoryValue = @{
                    name = $Category
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'category' -Value $CategoryValue
            }
            EntryType {
                Write-PSFMessage -Level InternalComment -Message "Adding EntryType to Body"
                $ThisEntryType = @{
                    id = $EntryType
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'entryType' -Value $EntryType
            }
            CallType {
                Write-PSFMessage -Level InternalComment -Message "Adding callType to Body"
                $ThisCallType = @{
                    id = $CallType
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'callType' -Value $CallType
            }
            CallerBranchId {
                Write-PSFMessage -Level InternalComment -Message "Adding CallerBranch to Caller"
                $ThisBranch = @{
                    id = $CallerBranch
                }
                $Caller | Add-Member -MemberType NoteProperty -Name 'branch' -Value $ThisBranch
            }
            CallerDynamicName {
                Write-PSFMessage -Level InternalComment -Message "Adding $CallerDynamicName to Caller"
                $Caller | Add-Member -MemberType NoteProperty -Name 'dynamicName' -Value $CallerDynamicName
            }
            CallerEmail {
                Write-PSFMessage -Level InternalComment -Message "Adding CallerEmail to Caller"
                $Caller | Add-Member -MemberType NoteProperty -Name 'email' -Value $CallerEmail
            }
            CallerDepartmentId {
                Write-PSFMessage -Level InternalComment -Message "Adding CallerDepartment to Caller"
                $ThisDepartment = @{
                    id = $CallerDepartment
                }
                $Caller | Add-Member -MemberType NoteProperty -Name 'department' -Value $ThisDepartment
            }
            CallerLocationId {
                Write-PSFMessage -Level InternalComment -Message "Adding CallerLocation to Caller"
                $ThisLocation = @{
                    id = $CallerLocation
                }
                $Caller | Add-Member -MemberType NoteProperty -Name 'location' -Value $ThisLocation
            }
            CallerBudgetHolderId {
                Write-PSFMessage -Level InternalComment -Message "Adding CallerBudgetHolder to Caller"
                $ThisBudgetHolder = @{
                    id = $CallerBudgetHolder
                }
                $Caller | Add-Member -MemberType NoteProperty -Name 'budgetHolder' -Value $ThisBudgetHolder
            }
            CallerMobileNumber {
                Write-PSFMessage -Level InternalComment -Message "Adding CallerMobileNumber to Caller"
                $Caller | Add-Member -MemberType NoteProperty -Name 'mobileNumber' -Value $CallerMobileNumber
            }
            CallerPhoneNumber {
                Write-PSFMessage -Level InternalComment -Message "Adding CallerPhoneNumber to Caller"
                $Caller | Add-Member -MemberType NoteProperty -Name 'phoneNumber' -Value $CallerPhoneNumber
            }
            ObjectId {
                Write-PSFMessage -Level InternalComment -Message "Adding Object to Body"
                $ThisObject = @{
                    id = $ObjectId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'object' -Value $ThisObject
            }
            LocationId {
                Write-PSFMessage -Level InternalComment -Message "Adding Location to Body"
                $ThisLocation = @{
                    id = $LocationId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'location' -Value $ThisLocation
            }
            BranchId {
                Write-PSFMessage -Level InternalComment -Message "Adding Branch to Body"
                $ThisBranch = @{
                    id = $BranchId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'branch' -Value $ThisBranch
            }
            ImpactId {
                Write-PSFMessage -Level InternalComment -Message "Adding Impact to Body"
                $ThisImpact = @{
                    id = $ImpactId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'impact' -Value $ThisImpact
            }
            UrgencyId {
                Write-PSFMessage -Level InternalComment -Message "Adding Urgency to Body"
                $ThisUrgency = @{
                    id = $ImpactId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'urgency' -Value $ThisUrgency
            }
            PriorityId {
                Write-PSFMessage -Level InternalComment -Message "Adding Priority to Body"
                $ThisPriority = @{
                    id = $PriorityId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'priority' -Value $ThisPriority
            }
            DurationId {
                Write-PSFMessage -Level InternalComment -Message "Adding Duration to Body"
                $ThisDuration = @{
                    id = $DurationId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'impact' -Value $ThisDuration
            }
            TargetDate {
                Write-PSFMessage -Level InternalComment -Message "Adding TargetDate to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'targetDate' -Value $TargetDate
            }
            OnHold {
                Write-PSFMessage -Level InternalComment -Message "Adding onHold to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'onHold' -Value $OnHold
            }
            OperatorId {
                Write-PSFMessage -Level InternalComment -Message "Adding Operator to Body"
                $ThisOperator = @{
                    id = $OperatorId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'operator' -Value $ThisOperator
            }
            OperatorGroupId {
                Write-PSFMessage -Level InternalComment -Message "Adding OperatorGroup to Body"
                $ThisOperatorGroup = @{
                    id = $OperatorGroupId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'operatorGroup' -Value $ThisOperatorGroup
            }
            SupplierId {
                Write-PSFMessage -Level InternalComment -Message "Adding Supplier to Body"
                $ThisSupplier = @{
                    id = $SupplierId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'supplier' -Value $ThisSupplier
            }
            ProcessingStatusId {
                Write-PSFMessage -Level InternalComment -Message "Adding ProcessingStatus to Body"
                $ThisProcessingStatus = @{
                    id = $ProcessingStatusId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'processingStatus' -Value $ThisProcessingStatus
            }
            Responded {
                Write-PSFMessage -Level InternalComment -Message "Adding Responded to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'responded' -Value $Responded
            }
            ResponseDate {
                Write-PSFMessage -Level InternalComment -Message "Adding ResponseDate to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'responseDate' -Value $ResponseDate
            }
            Completed {
                Write-PSFMessage -Level InternalComment -Message "Adding Completed to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'completed' -Value $Completed
            }
            CompletedDate {
                Write-PSFMessage -Level InternalComment -Message "Adding CompletedDate to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'completedDate' -Value $CompletedDate
            }
            Closed {
                Write-PSFMessage -Level InternalComment -Message "Adding Closed to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'closed' -Value $Closed
            }
            ClosedDate {
                Write-PSFMessage -Level InternalComment -Message "Adding ClosedDate to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'closedDate' -Value $ClosedDate
            }
            ClosureCodeId {
                Write-PSFMessage -Level InternalComment -Message "Adding CloseureCode to Body"
                $ThisCloseureCode = @{
                    id = $ClosureCodeId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'closurecode' -Value $ClosureCodeId
            }
            Costs {
                Write-PSFMessage -Level InternalComment -Message "Adding Costs to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'costs' -Value $Costs
            }
        }
        #I can do this better
        if (($CallerBranchId) -or ($CallerDynamicName) -or ($CallerPhoneNumber) -or ($CallerMobileNumber) -or ($CallerEmail) -or ($CallerDepartmentId) -or ($CallerLocationId) -or ($CallerBudgetHolderId)) {
            $Body | Add-Member -MemberType NoteProperty -Name 'caller' -Value $Caller
        }

        $Params = @{
            'Uri' = $IncidentURL
            'Body' = $Body | ConvertTo-Json
            'Method' = 'Put'
        }

        Invoke-TdMethod @Params
    }
    end {

    }
}
