[CmdletBinding()]
param ()

function Connect-TdService {
<#
	.SYNOPSIS
		Connects to the TOPdesk Service
	
	.DESCRIPTION
		Generates a token that will be used by every other api call.
	
	.PARAMETER Credential
		A description of the Credential parameter.
	
	.PARAMETER UserType
		A description of the UserType parameter.
	
	.PARAMETER PassThru
		Passes the login token through to the console.
	
	.EXAMPLE
		PS C:\> Connect-TdService
		Prompts you for your TOPdesk credentials and then connects to TOPdesk.
	
	.EXAMPLE
		PS C:\> Connect-TdService -Credential $Cred
		Connects to TOPdesk using the credential stored in the variable Cred.
	
	.OUTPUTS
		Output (if any)
	
	.NOTES
		Created on:   	6/26/2018 9:33 AM
		Edited on:      6/26/2018
		Created by:   	AndrewPla
		Organization:
		Filename:     	New-TdSession.ps1
	
	.INPUTS
		Inputs (if any)
#>
	
	[CmdletBinding(ConfirmImpact = 'Low',
				   SupportsShouldProcess = $true)]
	param
	(
		[Parameter(Mandatory = $true)]
		[PSCredential]
		$Credential,
		
		[ValidateSet('person', 'operator')]
		$UserType = 'operator',
		
		[switch]
		$PassThru
		
	)
	
	begin {
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Function started"
		
		$server = Get-TdConfigServer -ErrorAction Stop
		
		$resourceUri = "$server/tas/api/login/$UserType"
		
		$headers = @{
			'Authorization' = "Basic $(ConvertTo-Base64 "$($Credential.username):$($Credential.GetNetworkCredential().password)")"
		}
	}
	process {
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"
		
		if (-not $PSCmdlet.ShouldProcess("Item")) {
			return
		}
		
		$parameter = @{
			URI	    = $resourceURi
			Method  = "GET"
			Headers = $headers
		}
		Write-Debug "[$($MyInvocation.MyCommand.Name)] Invoking TdMethod with `$parameter"
		
		$result = Invoke-RestMethod @parameter
		
		
		Write-DebugMessage "[$($MyInvocation.MyCommand.Name)] Setting the LoginToken"
		$Script:__LoginToken = "TOKEN id=`"$result`""
		
		if ($PassThru) {
			Write-Output $Script:__LoginToken
		}
	}
	end {
		Write-Verbose "[$($MyInvocation.MyCommand.Name)] Complete"
	}
}

