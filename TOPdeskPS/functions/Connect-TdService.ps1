function Connect-TdService {
<#
	.SYNOPSIS
		Connects to the TOPdesk Service
	
	.DESCRIPTION
		Establishes a connection to TOPdesk.
	
	.PARAMETER Credential
		A description of the Credential parameter.
	
	.PARAMETER UserType
		A description of the UserType parameter.
	
	.PARAMETER PassThru
		Passes the login token through to the console. Can be useful for troubleshooting or if you want to generate a login token to be consumed by a different applicaiton.
	
	.PARAMETER Url
		This is the Url of your topdesk instance. Example: 'Company.TOPdesk.net'
	
	.PARAMETER Register
		Saves your TOPdesk url so you don't need to manually specify it each time. For more information
	
	.PARAMETER EnableException
		Specify whether you want this command to throw an exception if it encounters an error.
	
	.EXAMPLE
		PS C:\> Connect-TdService
		Prompts you for your TOPdesk credentials and then connects to TOPdesk.
	
	.EXAMPLE
		PS C:\> Connect-TdService -Credential $Cred
		Connects to TOPdesk using the credential stored in the variable Cred
#>
	
	[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Connect-TdService')]
	[OutputType([System.String])]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[PSCredential]
		$Credential,
		
		[ValidateSet('person', 'operator')]
		$UserType = 'operator',
		
		[switch]
		$PassThru,
		
		[PSFValidatePattern('http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?', ErrorMessage = '{0} is not a valid TOPdesk Url.')]
		[System.String]
		$Url = (
			Get-PSFConfigValue -FullName TOPdeskPS.Url -NotNull),
		
		[switch]
		$Register,
		
		[switch]
		$EnableException
	)
	
	begin {
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
		
		$resourceUri = "$url/tas/api/login/$UserType"
		Write-PSFMessage -Level Verbose -Message "ResourceURI: $resourceUri" -Tag 'debug', 'internal'
		
		Write-PSFMessage -Level Verbose -Message "Generating header for $($Credential.UserName)"
		$headers = @{
			'Authorization' = "Basic $(ConvertTo-Base64 "$($Credential.username):$($Credential.GetNetworkCredential().password)")"
		}
	}
	process {
		Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level Debug
		Write-PSFMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level Debug
		
		$parameter = @{
			URI	    = $resourceURi
			Method  = "GET"
			Headers = $headers
		}
		
		$result = Invoke-RestMethod @parameter -ErrorAction Stop
		if ($result.item.name -like 'item') {
			Stop-PSFFunction -Message 'invalid url given.' -EnableException $EnableException -Cmdlet $PSCmdlet
			return
		}
		
		else {
			Write-PSFMessage -Level Verbose -Message 'LoginToken received and set.'
			$Script:__LoginToken = "TOKEN id=`"$result`""
		}
		
		if ($PassThru) {
			$Script:__LoginToken
		}
		Set-PSFConfig -FullName TOPdeskPS.Url -Value $Url
		
		if ($Register) {
			Register-PSFConfig -FullName TOPdeskPS.Url
		}	
	}
	end {
		if (Test-PSFFunctionInterrupt) {
			return
		}
		Write-PSFMessage -Message 'Function Complete' -Level internalcomment
	}
}

