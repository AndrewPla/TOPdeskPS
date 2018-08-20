function Get-TdIncident {
<#
	.SYNOPSIS
		Grabs Incidents from TOPdesk
	
	.DESCRIPTION
		This command returns incidents from TOPdesk. The most you can grab per request is 100.
	
	.PARAMETER PageSize
		The Amount of incidents to be returned per request. The default value is 10 and the maximum value is 100.
	
	.PARAMETER Start
		This is the offset at which you want to start listing incidents at. This is useful if you want to grab more than 100 incidents.
		
		The default value is 0.
	
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
	#>
	
	[CmdletBinding(DefaultParameterSetName = 'List')]
	param
	(
		[ValidateRange(1, 100)]
		[int]
		$PageSize = 10,
		
		[int]
		$Start = 0,
		
		[Parameter(ParameterSetName = 'List')]
		[boolean]
		$Completed,
		
		[Parameter(ParameterSetName = 'List')]
		[boolean]
		$Closed,
		
		[Parameter(ParameterSetName = 'List')]
		[boolean]
		$Resolved,
		
		[Parameter(ParameterSetName = 'List')]
		[boolean]
		$Archived,
		
		[Parameter(ParameterSetName = 'Number',
				   ValueFromPipelineByPropertyName = $true)]
		[Alias('IncidentNumber')]
		[string[]]
		$Number
	)
	
	begin {
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
		$IncidentURL = (Get-TdUrl) + '/tas/api/incidents'
		Write-PSFMessage -Level InternalComment -Message "IncidentURL: $IncidentUrl"
	}
	process {
		Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
		Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug
		
		switch ($PSCmdlet.ParameterSetName) {
			
			List {
				$uri = "$IncidentURL/?start=$Start&page_size=$PageSize"
				
				
				if ($PSBoundParameters.keys -contains 'Completed') {
					Write-PSFMessage -Level InternalComment -Message "Completed = $Completed"
					$uri = "$uri&closed=$Closed"
				}
				
				if ($PSBoundParameters.keys -contains 'Closed') {
					Write-PSFMessage -Level InternalComment -Message "Closed = $Closed"
					$uri = "$uri&closed=$Closed"
				}
				
				if ($PSBoundParameters.keys -contains 'Resolved') {
					Write-PSFMessage -Level InternalComment -Message "Resolved = $Resolved"
					$uri = "$uri&resolved=$Resolved"
				}
				
				if ($PSBoundParameters.keys -contains 'Archive') {
					Write-PSFMessage -Level InternalComment -Message "Archive = $Archive"
					$uri = "$uri&archive=$Archive"
				}
				
				
				Write-PSFMessage -Level InternalComment -Message "URI: $uri"
				$Params = @{
					'uri' = $uri
				}
				$Incidents = Invoke-TdMethod @Params
			}
			
			Number {
				$Incidents = @()
				foreach ($num in $Number) {
					Write-PSFMessage -Level InternalComment -Message "Grabbing Incident # $num"
					$uri = "$IncidentURL/number/$($num.ToLower())"
					$Params = @{
						'uri' = $uri
					}
					$Incidents += Invoke-TdMethod @Params
				}
			}
			
		}
		
		foreach ($Incident in $Incidents) {
			Write-PSFMessage "Processing Incident : $($Incident.Number)" -Level Verbose
			$Incident | Select-PSFObject -Typename 'TOPdeskPS.Incident' -KeepInputObject
			#$Incident
		}
	}
	end {
		Write-PSFMessage -Message 'Function Complete'
		
	}
}