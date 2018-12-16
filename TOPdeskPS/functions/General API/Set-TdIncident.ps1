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

	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

	.EXAMPLE
		PS C:\> Set-TdIncident -IncidentNumber 'I1805-221' -Action 'Example Action'
		Updates incident I1805-221 with the action 'Example Action'
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Update-TdIncident',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
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
        $LocationId



    )
    <#TODO
        duration
        targetDate
        onHold

        Operator
        OperatorGroup
        Supplier
        processingStatus
        Responded
        Responsedate
        completed
        completeddate
        closed
        closedDate
        closurecode
        costs

        feedbackRating
        feedbackMessage

        majroCall
        majorCallObject
        publishtoSsd

        lots of free fields
        #>

    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $IncidentURL = (Get-TdUrl) + "/tas/api/incidents/number/$($IncidentNumber.ToLower())"



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

            #region Caller Parameters
            CallerBranch {
                $val = @{id = $CallerBranch}
                $callerBody | Add-Member -MemberType NoteProperty -Name 'branch' -Value $val
            }
            CallerEmail {
                $callerBody | Add-Member -MemberType NoteProperty -Name email -Value $CallerEmail
            }
            #endregion caller Parameters


        }
        if ($callerBody) { $Body | Add-Member -MemberType NoteProperty -Name caller -Value $callerBody }

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
