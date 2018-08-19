function Disconnect-TdService
{
	[CmdletBinding()]
	Param (
		
	)
	
	begin
	{
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
		Write-PSFMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
	}
	process
	{
		$ResourceUri = (get-TdUrl) + '/tas/api/logout'
		Write-PSFMessage -Level InternalComment -Message "ResourceUri: $ResourceUri"
		$headers = @{
			'Authorization' = $Script:__LoginToken
		}
		
		$parameter = @{
			URI	    = $resourceURi
			Method = 'GET'
			Headers = $headers
		}
		
		#TODO: test more.
		$result = Invoke-RestMethod @parameter -ErrorAction Stop
		$result
		$Script:__LoginToken = $null
	}
	end
	{
		Write-PSFMessage -Level InternalComment 'Function complete.'
	}
}