<#
	.SYNOPSIS
		Converts 

	.EXAMPLE
		PS C:\> Convertto-Base64 -InputObject 'string'
		
	
#>
function Convertto-Base64
{
	[CmdletBinding()]
	Param (
		$InputObject
	)
	
	begin
	{
		Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug','start','param'
	}
	process
	{
		$bytes = [System.Text.Encoding]::ASCII.GetBytes($InputObject)
		$base64 = [System.Convert]::ToBase64String($bytes)
		$base64
	}
	end
	{
	
	}
}