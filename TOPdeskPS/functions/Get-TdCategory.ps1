function Get-TdCategory {
<#
	.SYNOPSIS
		Get categories from TOPdesk
	
	.DESCRIPTION
		Gets either one category or a list of categories from TOPdesk.
	
	.PARAMETER Name
		This is the name of the category that you want. This can be useful if you want to pass a category id to a different command.
	
	.EXAMPLE
		PS C:\> Get-TdCategory
			Gets a list of all categories
	.EXAMPLE
		PS C:\> Get-TdCategory -Name 'End User Support'
			Gets the category with the name 'End User Support'

#>
	
	[CmdletBinding()]
	param
	(
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
		if ($Name) {
			$Categories -match $Name
		}
		else {
			$Categories
		}
	}
	end {
		
	}
}