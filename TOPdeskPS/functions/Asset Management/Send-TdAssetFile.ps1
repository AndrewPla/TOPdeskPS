function Send-TdAssetFile {
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
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Send-TdAssetFile')]
    param (

        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $AssetId,

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

        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/uploads/?assetId=$AssetId"
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
            Uri         = $Uri
            Body        = $bodyLines
            Method      = 'Post'
            ContentType = "multipart/form-data; boundary=$boundary"
        }
        Invoke-TdMethod @params
    }
    end {}
}