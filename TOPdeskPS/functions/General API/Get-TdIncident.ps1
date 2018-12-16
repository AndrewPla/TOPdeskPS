function Get-TdIncident {
    <#
	.SYNOPSIS
		Gets incidents

	.DESCRIPTION
		This command returns incidents from TOPdesk. The most you can grab per request is 100.

	.PARAMETER ResultSize
		The amount of incidents to be returned. Due to API limitations we're only able to return 100 incidents per api call.

	.PARAMETER Start
		This is the offset at which you want to start listing incidents.

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

	.EXAMPLE
		PS C:\> Get-TdIncident
        Grabs a list of 10 incidents
    .EXAMPLE
        PS C:\> Get-TdIncident -Closed
        Gets list of last 10 colsed incidents
    .EXAMPLE
        PS C:\> Get-TdIncident -ResultSize 2000
        Returns 2000 incidents.
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

        [ValidateRange(1, 100000)]
        [int]
        $ResultSize = 10,

        [int]
        $Start = 0,

        [switch]
        $Completed,

        [switch]
        $Closed,

        [switch]
        $Resolved,

        [switch]
        $Archived

    )


    process {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
        Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug


        $uri = "$(Get-TdUrl)/tas/api/incidents"

        switch ($PSCmdlet.ParameterSetName) {

            List {
                $uri = "$uri/?"

                if ($PSBoundParameters.keys -contains 'Completed') {
                    Write-PSFMessage -Level InternalComment -Message "Completed = $Completed"
                    $uri = "$uri&completed=$Completed"
                }

                if ($PSBoundParameters.keys -contains 'Closed') {
                    Write-PSFMessage -Level InternalComment -Message "Closed = $Closed"
                    $uri = "$uri&closed=$Closed"
                }

                if ($PSBoundParameters.keys -contains 'Resolved') {
                    Write-PSFMessage -Level InternalComment -Message "Resolved = $Resolved"
                    $uri = "$uri&resolved=$Resolved"
                }

                if ($PSBoundParameters.keys -contains 'Archived') {
                    $uri = "$uri&archive=$($Archived.tostring().tolower())"
                }

                if ($ResultSize -gt 100) {
                    $pageSize = 100
                }
                else {
                    $pageSize = $ResultSize
                }

                $count = 0
                do {
                    $incidents = @()

                    $remaining = $ResultSize - $count
                    Write-PSFMessage "$remaining incidents remaining"

                    if ($remaining -le 100) {
                        $pageSize = $remaining
                        $status = 'finished'
                    }

                    $loopingUri = "$uri&start=$Start&page_size=$pageSize"
                    $Params = @{
                        'uri' = $loopingUri
                    }
                    $Incidents += Invoke-TdMethod @Params
                    if (($Incidents.count) -eq 1) {
                        Write-PSFMessage 'No incidents remaining.'
                        $status = 'finished'
                    }

                    foreach ($incident in $incidents) {
                        if ($incident.Number -notlike '') {
                            $Incident | Select-PSFObject -Typename 'TOPdeskPS.Incident' -KeepInputObject
                        }
                    }
                    $count += $incidents.count
                    $start += $PageSize


                }
                until ($status -like 'finished')
            }

            Number {
                foreach ($num in $Number) {
                    $Incidents = @()
                    $uri = "$uri/number/$($num.ToLower())"
                    $Params = @{
                        'uri' = $uri
                    }
                    $Incidents += Invoke-TdMethod @Params
                    foreach ($Incident in $Incidents) {
                        $Incident | Select-PSFObject -Typename 'TOPdeskPS.Incident' -KeepInputObject
                    }
                }
            }
        }
    }
}
