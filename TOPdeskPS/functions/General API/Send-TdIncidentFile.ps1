function Send-TdIncidentFile {
    <#
    .SYNOPSIS
        Upload a file to an incident identified
    .DESCRIPTION
        Upload a file to an incident identified
    .PARAMETER Number
        The number of the incident that you want to upload a file to.
    .PARAMETER File
        Path and name to the file that you want to upload to the incident.
    .EXAMPLE
        PS C:\> <example usage>
        Explanation of what the example does
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Send-TdIncidentFile')]
    param (

        [Alias('IncidentNumber')]
        [Parameter(Mandatory)]
        [string]
        $Number,

        [Alias('InFile')]
        [Parameter(Mandatory, ValueFromPipeline, ValuefromPipelineByPropertyName)]
        [ValidateScript( {
                if (-Not ($_ | Test-Path)) {
                    throw "File or folder does not exist"
                }
                if (-Not ($_ | Test-Path -PathType Leaf)) {
                    throw "The Path argument must be a file. Folder paths are not allowed."
                }
                return $true
            })]
        [System.IO.FileInfo]
        $File
    )
    begin {
        if (-not $ContentType) {
            Add-Type -AssemblyName System.Web

            $mimeType = [System.Web.MimeMapping]::GetMimeMapping($File)
            if ($mimeType) {
                $ContentType = $mimeType
            }
            else {
                $ContentType = "application/octet-stream"
            }
        }

    }
    process {
        $uri = (Get-TdUrl) + "/tas/api/incidents/number/$Number/attachments"
        Write-PSFMessage "Uri - $uri" -Level debug
        $fileName = Split-Path $File -leaf
        $boundary = [guid]::NewGuid().ToString()
        $fileBin = [System.IO.File]::ReadAllBytes($File)
        $enc = [System.Text.Encoding]::GetEncoding("iso-8859-1")
        $fileEnc = $enc.GetString($fileBin)

        $bodyLines = @(

            "--$boundary",

            "Content-Disposition: form-data; name=`"file`"; filename=`"$filename`"",

            "Content-Type: application/octet-stream$LF",

            $fileEnc,

            "--$boundary",

            "Content-Disposition: form-data; name=`"importConfig`"; filename=`"portatour.importcfg`"",

            "Content-Type: application/octet-stream$LF",

            $importConfigFileEnc,

            "--$boundary--$LF"

        ) -join $LF
        $Headers = @{
            'Authorization' = $Script:LoginToken
        }
        $params = @{
            Uri         = $Uri
            Body        = $bodyLines
            Method      = 'Post'
            Headers     = $headers
            ContentType = "multipart/form-data; boundary=$boundary"
        }
        Invoke-restmethod @params
        #Invoke-TdMethod @params
    }
    end {}
    <#
    Write-PSFMessage "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param' -Level InternalComment
    $uri = (Get-TdUrl) + "/tas/api/incidents/number/$Number/attachments"
    if (-not $Script:__LoginToken) {
        throw 'no connection to topdesk, try running Connect-TdService'
    }
    $headers = @{
        'Authorization' = $Script:__LoginToken
    }
    $body = @{
        File = $File
    }
    $params = @{
        'uri'       = $uri
        Method      = 'post'
        Infile      = $File
        ContentType = 'multipart/form-data'
        Headers     = $headers
    }
    Invoke-restmethod @params
    #>
}