function Get-TdIncidentAttachmentDownload {
    <#
.SYNOPSIS
    Downloads an attachment
.DESCRIPTION
    Downloads an attachment from an incident
.EXAMPLE
    PS C:\> Get-TdIncident -Number 123 | Get-tdIncidentAttachment | Get-TdIncidentAttachmentDownload
    Downloads all of the attachments from incident 123
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdIncidentAttachmentDownload')]

    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        $DownloadUrl,

        [Parameter(Mandatory)]
        [system.io.fileinfo]
        $OutputFile
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)$DownloadUrl"
        Invoke-TdMethod -Uri $uri -OutFile $OutputFile
    }
}

