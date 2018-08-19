function Get-TdUrl
{
	[CmdletBinding()]
	Param (
	
	)
	
	begin
	{
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug','start','param'
	}
	process
	{
		try {
		 Get-PSFConfigValue -FullName TOPdeskPS.Url -NotNull
		}
		catch {
			throw 'Unable to find your TOPdesk url. Try running Connect-TdService.'
		}
		
	}
	end
	{
	
	}
}