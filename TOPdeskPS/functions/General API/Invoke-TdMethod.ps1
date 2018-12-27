function Invoke-TdMethod {
    <#
	.SYNOPSIS
		internal wrapper for Invoke-RestMethod

	.DESCRIPTION
		A detailed description of the Invoke-TdMethod function.

	.PARAMETER ContentType
		A description of the ContentType parameter.

	.PARAMETER Uri
		A description of the Uri parameter.

	.PARAMETER Body
		The body of the request to be sent to TOPdesk. Accepts a PSCustomObject and converts it to JSON.

	.PARAMETER Method
		The method that you want to pass

	.PARAMETER Token
		Custom Api token if you want to avoid using Connect-TdService ex:'TOKEN id="Token id="Base64encodedToken'

	.EXAMPLE
		PS C:\> Invoke-TdMethod -Token $Token -Body $Body
		Sends a Get request to your TOPdesk instance.

#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Invoke-TdMethod')]
    param
    (
        [system.string]
        $ContentType = 'application/json',

        [uri]
        $Uri,

        [pscustomobject]
        $Body,

        [ValidateSet('Get', 'Set', 'Put', 'Patch', 'Delete', 'Post', 'Head', 'Merge', 'Options')]
        [string]
        $Method = 'Get',

        [string]
        $Token
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'

    }
    process {
        if ($Token) {
            $Headers = @{
                'Authorization' = $Token
            }
        }
        else {
            if (-not $Script:__LoginToken) {
                throw 'no connection to topdesk, try running Connect-TdService'
            }
            $Headers = @{
                'Authorization' = $Script:__LoginToken
            }
        }
        $Params = @{
            'Body' = $Body
            'Method' = $Method
            'Uri' = $Uri
            'Headers' = $Headers
            'ContentType' = $ContentType
        }
        Write-PSFMessage -Level InternalComment -Message "Params to be bassed to IRM: $($params.Keys -join ",")"
        Invoke-RestMethod @Params

    }
}
