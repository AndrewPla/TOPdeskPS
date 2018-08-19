function Get-TdSubCategory
{
	[CmdletBinding()]
	Param (
	
	)
	
	begin
	{
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
		$SubcategoryURL = (Get-TdUrl) + '/tas/api/incidents/subcategories'
		
	}
	process
	{
		$Params = @{
			'uri' = $SubcategoryUrl
		}
		$Subcategories = Invoke-TdMethod @Params
		$Subcategories
	}
	end
	{
	
	}
}