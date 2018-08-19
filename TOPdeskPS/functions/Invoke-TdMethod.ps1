function Invoke-TdMethod {
<#
	.SYNOPSIS
		internal wrapper for Invoke-RestMethod
	
	.DESCRIPTION
		A detailed description of the Invoke-TdMethod function.
	
	.PARAMETER ContentType
		A description of the ContentType parameter.
	
	.PARAMETER Uri
		A description of the Uri parameter.
	
	.PARAMETER Body
		A description of the Body parameter.
	
	.PARAMETER Method
		A description of the Method parameter.
	
	.PARAMETER Headers
		A description of the Headers parameter.
	
	.EXAMPLE
		PS C:\> Invoke-TdMethod
	
	.NOTES
		Additional information about the function.
#>
	
	[CmdletBinding()]
	param
	(
		[system.string]
		$ContentType = 'application/json',
		
		[uri]
		$Uri,
		
		[pscustomobject]
		$Body,
		
		[ValidateSet('Get', 'Set', 'Put', 'Patch', 'Delete', 'Post', 'Head', 'Merge', 'Options')]
		[string]
		$Method = 'Get'
		
	
	)
	
	begin {
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
		$Headers = @{
			'Authorization' = $Script:__LoginToken
		}
	}
	process {
		
		$Params = @{
			'Body' = ($Body | ConvertTo-Json)
			'Method' = $Method
			'Uri'  = $Uri
			'Headers' = $Headers
			'ContentType' = $ContentType
		}
		Write-PSFMessage -Level InternalComment -Message "Params to be bassed to IRM: $($params.Keys -join ",")"
		
		Invoke-RestMethod @Params
	}
	end {
		
	}
}