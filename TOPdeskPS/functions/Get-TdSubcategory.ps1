function Get-TdSubcategory {
<#
	.SYNOPSIS
		Get subcategories from TOPdesk
	
	.DESCRIPTION
		Gets either one subcategory or a list of subcategories from TOPdesk.
	
	.PARAMETER Name
		This is the name of the subcategory that you want. This can be useful if you want to pass a subcategory id to a different command.
	
	.EXAMPLE
		PS C:\> Get-TdSubcategory
		Gets a list of all subcategories
	
	.EXAMPLE
		PS C:\> Get-TdSubcategory -Name 'Applications'
		Gets the Subcategory with the name 'Applications'
	
#>
	
	[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Get-TdSubcategory')]
	param
	(
		[System.String]
		$Name
	)
	
	begin {
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
		$SubcategoryURL = (Get-TdUrl) + '/tas/api/incidents/subcategories'
		
	}
	process {
		$Params = @{
			'uri' = $SubcategoryUrl
		}
		$Subcategories = Invoke-TdMethod @Params
		if ($Name) {
			$Subcategories -match $Name
		}
		else {
			$Subcategories
		}
	}
	end {
		
	}
}