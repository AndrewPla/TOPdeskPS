function Convertto-Base64 {
    <#
	.SYNOPSIS
		Command that converts a string into base64 ecoding
	
	.PARAMETER input
		A description of the input parameter.
	
	.EXAMPLE
		PS C:\> Convertto-Base64
#>

    [CmdletBinding()]
    Param ($InputObject)
	
    $bytes = [System.Text.Encoding]::ASCII.GetBytes($InputObject)
    $base64 = [System.Convert]::ToBase64String($bytes)
    $base64
}
