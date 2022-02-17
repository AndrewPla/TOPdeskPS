function Invoke-TdMethod {
    <#
	.SYNOPSIS
		Wrapper for Invoke-RestMethod. This command is exposed in case you encounter api calls that aren't part of this module. All api commands call this command to perform the web request.

	.DESCRIPTION
		A detailed description of the Invoke-TdMethod function.

	.PARAMETER ContentType
		default for contenttype is application/json . You may need to use a different contenttype for uploading files.

	.PARAMETER Uri
		the uri that you are targeting

	.PARAMETER Body
		The body of the request to be sent to TOPdesk. Accepts a PSCustomObject. If you also specify a file we will convert the body into a multipart/form request.

	.PARAMETER Method
		The method that you want to pass

	.PARAMETER Token
        Custom Api token if you want to avoid using Connect-TdService ex:'TOKEN id="Token id="Base64encodedToken

    .PARAMETER File
    path to the file that you want to upload. If you specify a body then we will construct a multipart/form request.
    In Windows PowerShell this functionality isn't built in.
    If no body is specified then we will just use the -infile parameter of Invoke-RestMethod

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

        [string]
        $ContentType = 'application/json' ,

        [pscustomobject]
        $Body,

        [ValidateSet('Get', 'Set', 'Put', 'Patch', 'Delete', 'Post', 'Head', 'Merge', 'Options')]
        [string]
        $Method = 'Get',

        [string]
        $Token,

        [Parameter(ParameterSetName = 'File')]
        [Alias('InFile')]
        [ValidateScript( {
                if (-Not ($_ | Test-Path)) {
                    throw "File or folder does not exist"
                }
                if (-Not ($_ | Test-Path -PathType Leaf)) {
                    throw "The Path argument must be a file. Folder paths are not allowed."
                }
                if (-Not (Get-Item $_)) {
                    throw "Cannot find path $($_)"
                }
                return $true
            })]
        [system.io.fileinfo]
        $File
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

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
                }
                if ($ContentType) {
                    $params.contenttype = $contenttype
                }
                Write-PSFMessage -Level InternalComment -Message "Params to be bassed to IRM: $($params.Keys -join ",")"
                Invoke-RestMethod @Params
            }


            'File' {
                switch ($PSVersionTable.PSVersion.Major) {
                    { $_ -le 5 } {
                        #TOPdesk always want a multipart request for files from what I've seen.

                        # Use fiddler to troubleshoot this.
                        # We are going to generate webrequest

                        Add-Type -AssemblyName System.web

                        $boundary = [System.Guid]::NewGuid().ToString()

                        # determine content type
                        $mimeType = [System.Web.MimeMapping]::GetMimeMapping($File)

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


                    { $_ -ge 6 } {
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

