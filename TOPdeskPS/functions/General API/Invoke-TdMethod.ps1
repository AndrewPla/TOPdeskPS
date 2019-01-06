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

    .PARAMETER File
    path to the file that you want to upload.

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

        [pscustomobject]
        $Body,

        [ValidateSet('Get', 'Set', 'Put', 'Patch', 'Delete', 'Post', 'Head', 'Merge', 'Options')]
        [string]
        $Method = 'Get',

        [string]
        $Token,

        [Parameter(ParameterSetName = 'File')]
        [system.io.fileinfo]
        $File
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


            'File' {

                switch ($PSVersionTable.PSVersion.Major) {
                    5 {
                        # Use fiddler to troubleshoot this.
                        # We are going to generate webrequest


                        Add-Type -AssemblyName System.web

                        $boundary = [System.Guid]::NewGuid().ToString()

                        # determine content type
                        $mimeType = [System.Web.MimeMapping]::GetMimeMapping($InFile)

                        if ($mimeType) {
                            $ContentType = $mimeType
                        }
                        else {
                            $ContentType = "application/octet-stream"
                        }



                        $fileBin = [System.IO.File]::ReadAllBytes($File)
                        $enc = [System.Text.Encoding]::GetEncoding("iso-8859-1")
                        $fileEnc = $enc.GetString($fileBin)

                        $LF = "`r`n"
                        $fileName = Split-Path $File -leaf

                        # composed contains all lines of our web request
                        $composedBody = @()

                        # Loop through all members of the body and add their values to the request.
                        $bodyMembers = $body.psobject.Members | where-object membertype -like 'noteproperty'
                        foreach ($b in $bodyMembers ) {
                            $composedBody += "--$boundary"
                            $composedBody += "Content-Type: text/plain; charset=utf-8"
                            $composedBody += "Content-Disposition: form-data; name=$($b.name)$LF"
                            $composedBody += "$($b.value)"
                        }


                        # now we add the actual content of the of file
                        $composedBody += (
                            "--$boundary",
                            "Content-Disposition: form-data; name=`"file`"; filename=`"$fileName`"",
                            "Content-Type: $ContentType$LF",
                            $fileEnc,
                            "--$boundary--$LF"
                        ) -join $LF


                        $composedBody = $composedBody -join $LF
                        $params = @{
                            uri = $Uri
                            Method = $Method
                            ContentType = "multipart/form-data; boundary=`"$boundary`""
                            Body = $composedBody
                            Headers = $Headers
                        }
                        Invoke-RestMethod @params

                    }


                    6 {
                        $form = @{
                            file = Get-Item $file
                        }

                        $bodyMembers = $body.psobject.Members | where-object membertype -like 'noteproperty'
                        foreach ($b in $bodyMembers) {
                            $form.add( "$($b.name)", "$($b.Value)")
                        }
                        $params = @{
                            Uri = $uri
                            Method = $Method
                            Form = $Form
                            Headers = $Headers
                        }
                        Invoke-RestMethod @params
                    }

                }
            }
        }

    }
}
