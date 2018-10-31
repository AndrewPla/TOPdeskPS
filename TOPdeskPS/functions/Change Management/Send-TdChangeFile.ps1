function Send-TdChangeFile {
    <#
    .SYNOPSIS
        Upload a file to an change identified
    .DESCRIPTION
        Upload a file to an change identified
    .PARAMETER Number
        The number of the change that you want to upload a file to.
    .PARAMETER File
        Path and name to the file that you want to upload to the change.
    .PARAMETER ChangeID
        Id of the change that you want to send a file to. See Get-TdChange
    .EXAMPLE
        PS C:\> <example usage>
        Explanation of what the example does
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Send-TdChangeFile')]
    param (

        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $ChangeId,

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
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/operatorChanges/$ChangeId/attachments"
        Write-PSFMessage "Uri - $uri" -Level debug

        #TODO throw this into an internal function and clean this up a bit.
        $fileName = Split-Path $File -leaf
        $boundary = [guid]::NewGuid().ToString()
        $fileBin = [System.IO.File]::ReadAllBytes($File)
        $LF = "`r`n"
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
        Write-PSFMessage $bodyLines -Level debug
        $params = @{
            Uri = $Uri
            Body = $bodyLines
            Method = 'Post'
            ContentType = "multipart/form-data; boundary=$boundary"
        }
        Invoke-TdMethod @params
    }
    end {}
}
