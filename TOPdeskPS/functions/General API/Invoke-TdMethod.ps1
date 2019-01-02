function Invoke-TdMethod {
    <#
	.SYNOPSIS
		internal wrapper for Invoke-RestMethod. This command is exposed in case you encounter api calls that aren't part of this module. All api commands call this command  to perform the web request.

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
        Custom Api token if you want to avoid using Connect-TdService ex:'TOKEN id="Token id="Base64encodedToken

    .PARAMETER FileBody
    A special body that is to be used with Multipart Form requests. this is needed because composing a multi form request in Windows PowerShell is challenging. PS Core doesn't need this.

	.EXAMPLE
		PS C:\> Invoke-TdMethod -Token $Token -Body $Body
		Sends a Get request to your TOPdesk instance.

#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Invoke-TdMethod')]
    param
    (

        [Parameter(Mandatory, Position = 0)]
        [uri]
        $Uri,

        [system.string]
        $ContentType = 'application/json',

        [object]
        $Body,

        [ValidateSet('Get', 'Set', 'Put', 'Patch', 'Delete', 'Post', 'Head', 'Merge', 'Options')]
        [string]
        $Method = 'Get',

        [string]
        $Token,

        [Parameter(ParameterSetName = 'FileUpload')]
        [string]
        $File,

        [Parameter( ParameterSetName = 'FileUpload')]
        [pscustomobject]
        $FileBody
    )

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
            else {
                $Headers = @{
                    'Authorization' = $Script:__LoginToken
                }
            }
        }

        Switch ($PSCmdlet.ParameterSetName) {
            '__AllParameterSets' {
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


            'FileUpload' {
                switch ($PSVersionTable.PSVersion.Major) {
                    '5' {
                        $fileName = Split-Path $File -leaf

                        $fileBin = [System.IO.File]::ReadAllBytes($File)
                        $enc = [System.Text.Encoding]::GetEncoding("iso-8859-1")
                        $fileEnc = $enc.GetString($fileBin)
                        $boundary = [System.Guid]::NewGuid().ToString()
                        $LF = "`r`n"


                        $Body = (
                            "--$boundary",
                            "Content-Disposition: form-data; name=`"file`"; filename=`"$fileName`""
                        )
                        foreach ($prop in $filebody.psobject.properties) {
                            $Body += "$($prop.name): $($prop.value)"
                        }
                        $Body += "Content-Type: application/octetstream$LF"

                        $Body += (
                            "--$boundary",
                            "Content-Disposition: form-data; name=`"file`"; filename=`"$fileName`"",
                            "Content-Type: application/octet-stream$LF",
                            $fileEnc,
                            "--$boundary--$LF"
                        ) -join $LF

                        $params = @{
                            uri = $Uri
                            Method = $Method
                            ContentType = "multipart/form-data; boundary=`"$boundary`""
                            Body = $body
                            Headers = $Headers
                        }
                        Invoke-RestMethod @params
                    }

                    '6' {

                    }

                }
            }
        }

    }
}
