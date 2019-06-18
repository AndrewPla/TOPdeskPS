function Get-TdIncident {
    <#
	.SYNOPSIS
		Gets incidents

	.DESCRIPTION
		This command returns incidents from TOPdesk. The most you can grab per request is 100.

	.PARAMETER ResultSize
        The amount of incidents to be returned. Due to API limitations we're only able to return 1000 incidents per api call.

        If you would like to grab more than 10000 incidents at once you can use a very high value for resultsize and it will loop through until it reaches the resultsize or it runs out of events to return.

	.PARAMETER Start
		This is the offset at which you want to start listing incidents. Using Resultsize

	.PARAMETER Completed
		Retrieve only incidents that are completed / not completed. Set this parameter to $false to only retrieve not completed incidents, and set it to $true to only receive completed incidents.

	.PARAMETER Closed
		Retrieve only incidents that are closed /not closed.

	.PARAMETER Resolved
		Retrieve only incidents that are resolved depending on the setting "Call is resolved when" (Module Settings -> Call Management -> General)

	.PARAMETER Archived
		Whether to retrieve archived incidents.

	.PARAMETER Number
        This is the incident number of the incident that you would like to retrieve.

    .PARAMETER OrderBy
        Order the retrieved incidents by these criteria:
call_date
creation_date
modification_date
target_date
closed_date
with the order ASC (ascending) or DESC (descending) appended with a plus-sign. Possible combinations of orders are comma-separated
Example: order_by=creation_date+DESC,target_date+ASC
Default is sorted by creation date, descending (newest first).
Default value: creation_date+DESC

.PARAMETER MajorCall
Retrieve only incidents that are major calls / not major calls.
Can only be set by operators.

.PARAMETER TargetDateStart
Retrieve only incidents with target date greater or equal to this day 00:00:00, using time zone of the logged in user or operator

Accepts DateTime Objects

.PARAMETER TargetDateEnd
Retrieve only incidents with target date smaller or equal to this day 23:59:59, using time zone of the logged in user or operator

Accepts Datetime objects

.PARAMETER CallDateStart
Retrieve only incidents with call date greater or equal to this day 00:00:00, using time zone of the logged in user or operator

Accepts DateTime Objects

.PARAMETER CallDateEnd
Retrieve only incidents with call date smaller or equal to this day 23:59:59, using time zone of the logged in user or operator

Accepts Datetime objects
.PARAMETER CreationDateStart
Retrieve only incidents with creation date greater or equal to this day 00:00:00, using time zone of the logged in user or operator

Accepts DateTime Objects

.PARAMETER CreationDateEnd
Retrieve only incidents with creation date smaller or equal to this day 23:59:59, using time zone of the logged in user or operator

Accepts Datetime objects
.PARAMETER ModificationDateStart
Retrieve only incidents with modification date greater or equal to this day 00:00:00, using time zone of the logged in user or operator

Accepts DateTime Objects

.PARAMETER ModificationDateEnd
Retrieve only incidents with modification date smaller or equal to this day 23:59:59, using time zone of the logged in user or operator

Accepts Datetime objects
.PARAMETER ClosedDateStart
Retrieve only incidents with closed date greater or equal to this day 00:00:00, using time zone of the logged in user or operator

Accepts DateTime Objects
.PARAMETER ClosedDateEnd
Retrieve only incidents with closed date smaller or equal to this day 23:59:59, using time zone of the logged in user or operator

Accepts Datetime objects



.PARAMETER CallerId
Retrieve only incidents reported by one of these caller ids

.PARAMETER OperatorGroupId
Retrieve only incidents assigned to one of these operator group ids or "unassigned" for unassigned incidents

.PARAMETER OperatorId
Retrieve only incidents assigned to one of these operator ids or "unassigned" for unassigned incidents

.PARAMETER ProcessingStatusId
Retrieve only incidents with one of these processing status ids

.PARAMETER MainIncidentId
Retrieve only incidents that have one of these main incident ids. Overrides any status filter as only partials have main incidents.

.PARAMETER Status
    Retrieve only firstLine/secondLine/partial incidents (permission required)

.PARAMETER CallerBranchId
Retrieve only incidents reported by callers from one of these branch ids

.PARAMETER ObjectId
Retrieve only incidents that have one of the specified objects set (by id)

.PARAMETER ObjectName
Retrieve only incidents that have one of the specified objects set (by object name)

.PARAMETER LinkedObjectId
Retrieve only incidents that are linked to one of the specified objects (by id)

.PARAMETER LinkedObjectName

Retrieve only incidents that are linked to one of the specified objects (by object name)

.PARAMETER ExternalLinkId
Retrieve only incidents with external link id equal to one of these values. Should be used in combination with ExternalLinkType

.PARAMETER ExternalLinkType
Retrieve only incidents with external link type equal to one of these values. Should be used in combination with external_link_id.

.PARAMETER ExternalNumber
Retrieve one or more incidents with the given external numbers.

.PARAMETER Id
Retrieve one or more incidents with the given ids, make sure "page_size" is set accordingly to get all results.


	.EXAMPLE
		PS C:\> Get-TdIncident
        returns incidents

    .EXAMPLE
        PC> Get-Tdincident | Format-List *
        return incidents and all of their properties

    .EXAMPLE
        PS C:\> Get-TdIncident -Closed
        Returns incidents and includes closed incidents.
    .EXAMPLE
        PS C:\> Get-TdIncident -ResultSize 2000
        Returns 2000 incidents.
    .Example
        PS > Get-TdIncident -ResultSize Unlimited -ModificationDateStart (Get-date).adddays(-7)
        Returns all Incidents Modified in the last 7 days
#>

    [CmdletBinding(DefaultParameterSetName = 'List',
        HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Get-TdIncident')]
    param
    (
        [Parameter(ParameterSetName = 'Number',
            ValueFromPipeline = $true,
            position = 0)]
        [Alias('IncidentNumber')]
        [string[]]
        $Number,

        [ValidateRange(1, 999999)]
        [int]
        $ResultSize = 10,

        [int]
        $Start = 0,


        # Filters only one value used for each
        [switch]
        $Completed,

        [switch]
        $Closed,

        [switch]
        $Resolved,

        [switch]
        $Archived,

        #TODO
        [switch]
        $MajorCall,

        [datetime]
        $TargetDateStart,

        [datetime]
        $TargetDateEnd,

        [datetime]
        $CallDateStart,

        [datetime]
        $CallDateEnd,

        [datetime]
        $CreationDateStart,

        [datetime]
        $CreationDateEnd,

        [datetime]
        $ModificationDateStart,

        [datetime]
        $ModificationDateEnd,

        [datetime]
        $ClosedDateStart,

        [datetime]
        $ClosedDateEnd,

        # Filters accepting multiple values

        [string[]]
        $CallerId,

        [string[]]
        $OperatorGroupId,

        [string[]]
        $OperatorId,

        [string[]]
        $ProcessingStatusId,

        [string[]]
        $MainIncidentId,


        [ValidateSet('firstLine', 'secondLine', 'partial')]
        [string[]]
        $Status,

        [string[]]
        $CallerBranchId,

        [string[]]
        $ObjectId,

        [string[]]
        $ObjectName,

        [string[]]
        $LinkedObjectId,

        [string[]]
        $LinkedObjectName,

        [string[]]
        $ExternalLinkId,

        [string[]]
        $ExternalLinkType,

        [string[]]
        $ExternalNumber,

        [string[]]
        $Id,
        # Sorting
        [string]
        $OrderBy

    )


    process {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug


        $uri = "$(Get-TdUrl)/tas/api/incidents"

        switch ($PSCmdlet.ParameterSetName) {

            List {
                $uri = "$uri/?"

                switch ($PSBoundParameters.keys) {

                    #Region Filter parameters (used once)
                    Completed {
                        $uri = "$uri&completed=$Completed"
                    }

                    Closed {
                        $uri = "$uri&closed=$Closed"
                    }

                    Resolved {
                        $uri = "$uri&resolved=$Resolved"
                    }

                    Archived {
                        $uri = "$uri&archived=$($Archived.tostring().tolower())"
                    }


                    MajorCall {
                        $uri = "$uri&major_call=$($MajorCall.tostring().tolower())"
                    }

                    TargetDateStart {
                        $uri = "$uri&target_date_start=$(Get-Date $TargetDateStart -Format 'yyyy-MM-dd')"
                    }

                    TargetDateEnd {
                        $uri = "$uri&target_date_end=$(Get-Date $TargetDateEnd -Format 'yyyy-MM-dd')"
                    }

                    CallDateStart {
                        $uri = "$uri&call_date_start=$(Get-Date $CallDateStart -Format 'yyyy-MM-dd')"
                    }
                    CallDateEnd {
                        $uri = "$uri&call_date_end=$(Get-Date $CallDateEnd -Format 'yyyy-MM-dd')"
                    }

                    CreationDateStart {
                        $uri = "$uri&creation_date_start=$(Get-Date $CreationDateStart -Format 'yyyy-MM-dd')"
                    }

                    CreationDateEnd {
                        $uri = "$uri&creation_date_end=$(Get-Date $CreationDateEnd -Format 'yyyy-MM-dd')"
                    }

                    ModificationDateStart {
                        $uri = "$uri&modification_date_start=$(Get-Date $ModificationDateStart -Format 'yyyy-MM-dd')"
                    }

                    ModificationDateEnd {
                        $uri = "$uri&modification_date_end=$(Get-Date $ModificationDateEnd -Format 'yyyy-MM-dd')"
                    }

                    ClosedDateStart {
                        $uri = "$uri&closed_date_start=$(Get-Date $ClosedDateStart -Format 'yyyy-MM-dd')"
                    }

                    ClosedDateEnd {
                        $uri = "$uri&closed_date_end=$(Get-Date $ClosedDateEnd -Format 'yyyy-MM-dd')"
                    }

                    #endregion Filter parameters (used once)

                    #region Filter Parameters (multiple values)


                    CallerId {
                        foreach ($g in $CallerId) {
                            $uri = "$uri&caller=$g"
                        }
                    }

                    OperatorGroupId {
                        foreach ($g in $OperatorGroupId) {
                            $uri = "$uri&operator_group=$g"
                        }
                    }

                    OperatorId {
                        foreach ($g in $operatorId) {
                            $uri = "$uri&operator=$g"
                        }
                    }

                    ProcessingStatusId {
                        foreach ($g in $ProcessingStatusId) {
                            $uri = "$uri&processing_status=$g"
                        }
                    }

                    MainIncidentId {
                        foreach ($g in $MainIncidentId) {
                            $uri = "$uri&main_incident_id=$g"
                        }
                    }

                    Status {
                        foreach ($g in $status) {
                            $uri = "$uri&status=$g"
                        }
                    }

                    CallerBranchId {
                        foreach ($g in $CallerBranchId) {
                            $uri = "$uri&caller_branch=$g"
                        }
                    }

                    ObjectId {
                        foreach ($g in $ObjectId) {
                            $uri = "$uri&object_id=$g"
                        }
                    }


                    ObjectName {
                        foreach ($g in $ObjectName) {
                            $uri = "$uri&object_name=$g"
                        }
                    }

                    LinkedObjectId {
                        foreach ($g in $LinkedObjectId) {
                            $uri = "$uri&linked_object_id=$g"
                        }
                    }

                    LinkedObjectName {
                        foreach ($g in $LinkedObjectName) {
                            $uri = "$uri&linked_object_name=$g"
                        }
                    }

                    ExternalLinkId {
                        foreach ($g in $ExternalLinkeId) {
                            $uri = "$uri&external_link_id=$g"
                        }
                    }

                    ExternalLinkType {
                        foreach ($g in $ExternalLinkType) {
                            $uri = "$uri&external_link_type=$g"
                        }
                    }

                    Id {
                        foreach ($g in $Id) {
                            $uri = "$uri&id=$g"
                        }
                    }

                    ExternalNumber {
                        foreach ($g in $ExternalNumber) {
                            $uri = "$uri&external_number=$g"
                        }
                    }
                }

                #endregion Filter Parameters (multiple values)



                if ($ResultSize -gt 10000) {
                    $pageSize = 10000
                }
                else {
                    $pageSize = $ResultSize
                }

                $uri = $uri.Replace('?&', '?')
                $count = 0
                do {
                    # Add a number to 'unlimited'
                    if ($ResultSize -like 'unlimited') { $ResultSize = 99999999 }
                    $remaining = $ResultSize - $count

                    # 10000 is the most we can get per api call. if -LE 10k is needed then we don't need to loop any more.
                    if ($remaining -le 10000) {
                        $pageSize = $remaining
                        $loopingStatus = 'finished'
                    }

                    # Set the uri each time we loop because we need to increase the start
                    $loopingUri = "$uri&start=$Start&page_size=$pageSize"
                    $Params = @{
                        'uri' = $loopingUri
                    }

                    # grab the incidents
                    $incidents = Invoke-TdMethod @Params

                    if (($Incidents.count) -eq 1) {
                        $LoopingStatus = 'finished'
                    }

                    foreach ($incident in $incidents) {
                        if ($incident.Number -notlike '') {
                            $Incident | Select-PSFObject -Typename 'TOPdeskPS.Incident' -KeepInputObject
                        }
                    }
                    $count += $incidents.count
                    $start += $PageSize
                }
                until ($loopingStatus -like 'finished')
            }

            Number {
                foreach ($num in $Number) {
                    $uri = "$uri/number/$($num.ToLower())"
                    $Params = @{
                        'uri' = $uri
                    }

                    Invoke-TdMethod @Params |
                    Foreach-Object {
                        # add the type to the result
                        $_ | Select-PSFObject -Typename 'TOPdeskPS.Incident' -KeepInputObject
                    }
                }
            }
        }
    }
}
}

