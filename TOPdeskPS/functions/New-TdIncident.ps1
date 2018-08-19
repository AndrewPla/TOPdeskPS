function New-TdIncident {
	[CmdletBinding()]
	param (
		
		[Parameter(Mandatory = $true)]
		[string]
		$Request,
		
		[Parameter(Mandatory = $true)]
		[string]
		$Action,
		
		[Parameter(Mandatory = $true)]
		[string]
		$CallerEmail
		
	)
	
	begin {
		$IncidentURL = (Get-TdUrl) + '/tas/api/incidents'
		Write-PSFMessage -Level internalcomment -Message "IncidentURL: $IncidentURL"
		Write-PSFMessage -Level verbose -Message 'Generating Authorization Header'
		$headers = @{
			'Authorization' = $Script:__LoginToken
		}
	}
	
	process {
		Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
		Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
		
		if (-not $PSCmdlet.ShouldProcess("Item")) {
			return
		}
		$email =
		$body = @{
			"request" = "$request";
			"action"  = "$action";
			"caller"  = "email: $CallerEmail"
		} | ConvertTo-Json
		
		Write-Output $Body
		$Params = @{
			'Headers'	  = $headers
			'uri'		  = $IncidentURL
			'body'	      = $body
			'method'	  = 'post'
			'ContentType' = "application/json"
		}
		
		Invoke-RestMethod @Params
	}
	
	end {
		
	}
}