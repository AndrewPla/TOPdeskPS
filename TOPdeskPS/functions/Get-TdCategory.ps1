function Get-TdCategory {
	[CmdletBinding()]
	param (
		[System.String]
		$Name
	)
	
	begin {
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
		$CategoryURL = (Get-TdUrl) + '/tas/api/incidents/categories'
		
	}
	process {
		$Params = @{
			'uri' = $CategoryUrl
		}
		$Categories = Invoke-TdMethod @Params
		$Categories
	}
	end {
		
	}
}