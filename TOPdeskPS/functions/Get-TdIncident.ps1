function Get-TdIncident {
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
		
		Switch ($PSCmdlet.ParameterSetName) {
			
			List {
				$uri = "$IncidentURL/?start=$Start&page_size=$PageSize"
				
				
				if ($PSBoundParameters.keys -contains 'Completed') {
					Write-Verbose "Completed = $Completed"
					$uri = "$uri&closed=$Closed"
				}
				
				if ($PSBoundParameters.keys -contains 'Closed') {
					Write-Verbose "Closed = $Closed"
					$uri = "$uri&closed=$Closed"
				}
				
				if ($PSBoundParameters.keys -contains 'Resolved') {
					Write-Verbose "Resolved = $Resolved"
					$uri = "$uri&resolved=$Resolved"
				}
				
				if ($PSBoundParameters.keys -contains 'Archive') {
					Write-Verbose "Archive = $Archive"
					$uri = "$uri&archive=$Archive"
				}
				
				
				Write-Verbose "URI: $uri"
				$Params = @{
					'uri'	  = $uri
				}
				$Incidents = Invoke-TdMethod @Params
			}
			
			Number {
				$Incidents = @()
				foreach ($num in $Number) {
					Write-Verbose "Grabbing Incident # $num"
					$uri = "$IncidentURL/number/$num"
					$Params = @{
						'uri'	  = $uri
					}
					$Incidents += Invoke-TdMethod @Params
				}
			}
			
		}
		
		foreach ($Incident in $Incidents) {
			Write-Verbose "Processing Incident : $($Incident.Number)"
			$Incident.psobject.typenames.Insert(0, 'TOPdeskPS.Incident')
			$Incident
		}
	}
	end {
		Write-PSFMessage -Message 'Function Complete'
		
	}
}