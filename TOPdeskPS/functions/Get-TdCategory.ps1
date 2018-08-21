function Get-TdCategory {
<#
	.SYNOPSIS
		Get categories from TOPdesk
	
	.DESCRIPTION
		Gets either one category or a list of categories from TOPdesk.
	
	.PARAMETER Name
		This is the name of the category that you want. This can be useful if you want to pass a category id to a different command.
	
	.PARAMETER Token
		REST login token. This isn't needed if you want to use the token generated with Connect-TdService
	
	.EXAMPLE
		PS C:\> Get-TdCategory
		Gets a list of all categories
	
	.EXAMPLE
		PS C:\> Get-TdCategory -Name 'End User Support'
		Gets the category with the name 'End User Support'
	
	.NOTES
		Additional information about the function.
#>
	
	[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Get-TdCategory')]
	param
	(
		[System.String]
		$Name,
		
		[string]
		$Token
	)
	
	begin {
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
		$CategoryURL = (Get-TdUrl) + '/tas/api/incidents/categories'
		
	}
	process {
		$Params = @{
			'uri' = $CategoryUrl
		}
		if ($Token) {
			$Params.add('Token', $Token)
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