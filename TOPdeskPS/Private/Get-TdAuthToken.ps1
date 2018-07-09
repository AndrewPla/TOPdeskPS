function Get-TDAuthToken {
    <#
	.SYNOPSIS
		This is used to create a Authorization Token to access the TopDesk API.
	
	.DESCRIPTION
		A detailed description of the New-TDAuthToken function.
	
	.PARAMETER Credential
		The credential of your TopDesk account
	
	.PARAMETER URL
		A description of the URL parameter.
	
	.EXAMPLE
				PS C:\> 
#>
	
    [CmdletBinding()]
    param
    ()
    $credential = get-tdapplicationpassword -verbose
    $userName = $Credential.UserName
    $password = $Credential.GetNetworkCredential().password
    $basicAuthValue = "Basic $(ConvertTo-Base64 "${Username}:${Password}")"		
    @{ 'Authorization' = $BasicAuthValue }
}
