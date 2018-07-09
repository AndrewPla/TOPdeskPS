[CmdletBinding()]
param ()

function Get-TDIncident {
<#
	.SYNOPSIS
		Grabs incidents from TopDesk.
	
	.DESCRIPTION
		A detailed description of the Get-TDIncident function.
	
	.PARAMETER PageSize
		The number of incidents to be returned
	
	.PARAMETER Start
		This is the number of the incident that you want to begin receiving results from.
	
	.PARAMETER Completed
		A description of the Completed parameter.
	
	.PARAMETER Closed
		Retrieve only incidents that are either closed or not closed.
	
	.PARAMETER Resolved
		Retrieve only incidents that are either resolved or not resolved.
	
	.PARAMETER Archived
		A description of the Archive parameter.
	
	.PARAMETER Number
		This is the incident number. Specify this if you know the number of the incident that you want.
	
	.PARAMETER Token
		This is the token that you use to authenticate with TopDesk. This can be created with New-TDAuthToken.
	
	.PARAMETER ID
		A description of the ID parameter.
	
	.EXAMPLE
		PS C:\> Get-TDIncident -Token (New-TDAuthToken -Credential (Get-Credential)
		This will grab the latest 10 incidents
#>
	
	[CmdletBinding(DefaultParameterSetName = 'List')]

	param
	(
		[ValidateRange(1, 100)]
		[int]
		$PageSize = 10,
		
		[Parameter(ParameterSetName = ' List')]
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
		
		#ToDo delete this testing part
		Write-Verbose "ParameterSetName $($PSCmdlet.ParameterSetName)"
		Write-Verbose "PSBoundParameters $($PSBoundParameters.Keys -join ", ")"
		
		$TOPdeskUrl = Get-TdConfigServer -ErrorAction stop
		$IncidentURL = $TOPdeskUrl + '/tas/api/incidents'
		
		Write-Verbose 'Generating Authorization Header'
		$headers = @{ 'Authorization' = $Script:__LoginToken }
	}
	
	process {
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
		
		if (-not $PSCmdlet.ShouldProcess("Item")) {
			return
		}
		
		switch ($PSCmdlet.ParameterSetName) {
			
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
					'Headers' = $headers
					'uri'	  = $uri
				}
				$Incidents = Invoke-RestMethod @Params
			}
			
			Number {
				$Incidents = @()
				foreach ($num in $Number) {
					Write-Verbose "Grabbing Incident # $num"
					$uri = "$IncidentURL/number/$num"
					$Params = @{
						'Headers' = $headers
						'uri'	  = $uri
					}
					$Incidents += Invoke-RestMethod @Params
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
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
	}
}
