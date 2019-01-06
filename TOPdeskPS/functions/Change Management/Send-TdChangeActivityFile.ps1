function Send-TdChangeActivityFile {
    <#
    .SYNOPSIS
        Upload a file to a change activity.
    .DESCRIPTION
        Upload a file to a change activity.
    .PARAMETER ChangeId
        Id of the change activity that you want to work with.
    .PARAMETER File
        File that you want to upload.

    .EXAMPLE
        PS> Get-TdChangeActivity 'C1811-123' | Send-TdChangeActivityFile -File 'C:\TestFile.txt'
        Uploads a file to a change activity

    .EXAMPLE
        PS> Get-TdChangeDetail 'C1211-123' | Send-TdChangeActivityFile -file 'C:\log.txt'
        uploads a file to C1211-123
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Send-TdChangeActivityFile')]
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
                    throw "The Path argument must be a file. Folder paths are not allowed."
                }
                return $true
            })]
        [System.IO.FileInfo[]]
        $File
    )

    process {
        $Body = [PSCustomObject]@{}
        foreach ($f in $File) {

            $uri = "$(Get-TdUrl)/tas/api/operatorChangeActivities/$ChangeId/attachments"


            $params = @{
                Body = $Body
                Uri = $Uri
                File = "$($f.fullname)"
                Method = 'Post'
            }
            Invoke-TdMethod @params
        }
    }
}
