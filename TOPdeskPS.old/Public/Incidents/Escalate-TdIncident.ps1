[CmdletBinding()]
param ()

function Escalate-TdIncident {
    <#
.SYNOPSIS
    Short description
.DESCRIPTION
    Escalate-TdIncident Function
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    Created on:   	7/8/2018 4:23 PM
    Edited on:      7/8/2018
    Created by:   	AndrewPla
    Organization: 	 
    Filename:     	Escalate-TdIncident.ps1

#>
	[CmdletBinding(
				   ConfirmImpact = 'Medium',
				   #HelpUri = 'https://topdeskps.readthedocs.io/en/latest/Module/Escalate-TdIncident',
				   SupportsShouldProcess = $true
				   )]
	[OutputType([string])]
	param
	(
		[Parameter(ParameterSetName = 'Number',
				   ValueFromPipelineByPropertyName = $true)]
		[string[]]
		$Number
	)
	begin {
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
		
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
		
		$Incidents = @()
		foreach ($num in $Number) {
			Write-Verbose "Escalating Incident $ $num"
			$uri = "$IncidentURL/number/$num/escalate"
			$Params = @{
				'Headers' = $headers
				'uri'	  = $uri
				'Method' = 'Patch'
			}
			$Incidents += Invoke-RestMethod @Params
		}
		foreach ($Incident in $Incidents) {
			Write-Verbose "Processing Incident : $($Incident.INumber)"
			$Incident.psobject.typenames.Insert(0, 'TOPdeskPS.Incident')
			$Incident
		}
		
		
	}
	end {
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
	}
}

