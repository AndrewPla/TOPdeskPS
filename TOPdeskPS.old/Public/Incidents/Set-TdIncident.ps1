[CmdletBinding()]
param ()

function Set-TdIncident {
<#
	.SYNOPSIS
		Short description
	
	.DESCRIPTION
		Set-TdIncident Function
	
	.PARAMETER Number
		This is the incident number.
	
	.PARAMETER BriefDescription
		Brief description field of the incident.
	
	.PARAMETER Action
		Action field.
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
		Can be set by operators and 
	
	.EXAMPLE
		PS C:\> <example usage>
		Explanation of what the example does
	
	.OUTPUTS
		Output (if any)
	
	.NOTES
		Created on:   	7/11/2018 9:23 PM
		Edited on:      7/11/2018
		Created by:   	AndrewPla
		Organization:
		Filename:     	Set-TdIncident.ps1
	
	.INPUTS
		Inputs (if any)
#>
	
	[CmdletBinding(ConfirmImpact = 'Medium',
				   SupportsShouldProcess = $true)]
	[OutputType([string])]
	param
	(
		[Parameter(ValueFromPipelineByPropertyName = $true)]
		[string]
		$Number,
		
		[Parameter(ValueFromPipelineByPropertyName = $true)]
		[string]
		$BriefDescription,
		
		[Parameter(ValueFromPipelineByPropertyName = $true)]
		[string]
		$Action,
		
		$token
	)
	
	begin {
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
		Write-Verbose "ParameterSetName $($PSCmdlet.ParameterSetName)"
		Write-Verbose "PSBoundParameters $($PSBoundParameters.Keys -join ", ")"
		
		$TOPdeskUrl = Get-TdConfigServer -ErrorAction stop
		$IncidentURL = $TOPdeskUrl + '/tas/api/incidents'
		
		Write-Verbose 'Generating Authorization Header'
		$headers = @{
			'Authorization' = $Script:__LoginToken
		}
		if ()
	}
	process {
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
		
		if (-not $PSCmdlet.ShouldProcess("Item")) {
			return
		}
		
		foreach ($Num in $Number) {
			$uri = "$IncidentURL/number/$Num"
			
			
			Write-Verbose "Grabbing Incident # $num"
			$Body = @{
				action = $Action
			}
			$uri = "$IncidentURL/number/$num"
			$Params = @{
				Headers = $headers
				uri	    = $uri
				Body    = (ConvertTo-Json $Body)
				Method  = 'Put'
			}
			$Incident = Invoke-RestMethod @Params
			
			Write-Verbose "Updated Incident Number: $($Incident.Number)"
			$Incident.psobject.typenames.Insert(0, 'TOPdeskPS.Incident')
			Write-Output $Incident
		}
		
		
		
	}
	end {
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
	}
}

