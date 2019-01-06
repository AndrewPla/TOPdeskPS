function Send-TdChangeFile {
    <#
    .SYNOPSIS
        Upload a file to a change.
    .DESCRIPTION
        Upload a file to an Change. You can make the file invisible to the caller and you can also add a description.
    .PARAMETER ChangeId
        Id of the change that you want to work with.
    .PARAMETER File
        File that you want to upload.

    .EXAMPLE
        PS> Get-TdChangeDetail 'C1811-123' | Send-TdChangeFile -File 'C:\TestFile.txt'
        Uploads a file to a change

    .EXAMPLE
        PS> Get-TdChangeDetail 'C1211-123' | Send-TdChangeFile -file 'C:\log.txt'
        uploads a file to C1211-123
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Send-TdChangeFile')]
    param (

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [string]
        $ChangeId,

        [Parameter(Mandatory, ValueFromPipeline, ValuefromPipelineByPropertyName)]
        [ValidateScript( {
                if (-Not ($_ | Test-Path)) {
                    throw "File or folder does not exist"
                }
                if (-Not ($_ | Test-Path -PathType Leaf)) {
                    throw "The file argument must be a file. Folder paths are not allowed."
                }
                return $true
            })]
        [System.IO.FileInfo[]]
        $File
    )

    process {
        foreach ($f in $File) {

            $uri = "$(Get-TdUrl)/tas/api/operatorChanges/$ChangeId/attachments"

            $params = @{
                Uri = $Uri
                File = "$($f.fullname)"
                Method = 'Post'
            }
            Invoke-TdMethod @params
        }
    }
}
