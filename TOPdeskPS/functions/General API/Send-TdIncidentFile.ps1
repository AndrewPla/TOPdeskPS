function Send-TdIncidentFile {
    <#
    .SYNOPSIS
        Upload a file to an incident identified
    .DESCRIPTION
        Upload a file to an incident. You can make the file invisible to the caller and you can also add a description.
    .PARAMETER Number
        The number of the incident that you want to upload a file to.
    .PARAMETER File
        File that you want to upload.
    .PARAMETER InvisibleForCaller
        Whether you want to make this invisible to caller or not. The default is no.
    .PARAMETER Description
        Provide a description for the file.
    .EXAMPLE
        PS> Send-TdIncidentFile -File 'C:\TestFile.txt' -Number 'I1911-123' -InvisibleforCaller
        Uploads a file to an incident. and makes it invisible for caller.
    .EXAMPLE
        PS> Send-TdIncidentFile -File 'C:\ScanResult.txt' -Number 'I1911-123' -Description "Copy of the scan results from the target machine"
        Uploads a file to an incident with a description.
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Send-TdIncidentFile')]
    param (

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $Number,

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
        $File,

        [Switch]
        $InvisibleForCaller,

        [string]
        $Description
    )

    process {
        $Body = [PSCustomObject]@{}

        foreach ($f in $File) {
            $Body | Add-Member -Name 'invisibleForCaller' -Value ($InvisibleForCaller.tostring().tolower()) -MemberType NoteProperty


            if ($Description) {
                $Body | Add-Member -Name 'description' -Value $Description -MemberType NoteProperty
            }

            $uri = "$(Get-TdUrl)/tas/api/incidents/number/$($Number.tolower())/attachments"

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
