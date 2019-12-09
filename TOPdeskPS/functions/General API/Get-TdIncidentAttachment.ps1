function Get-TdIncidentAttachment {
    <#
.SYNOPSIS
    returns incident attachments
.DESCRIPTION
    Returns attachments for provided incident ids
.EXAMPLE
    PS C:\> Get-TdIncident | Get-TdIncidentAttachment
    Returns attachment information for the provided incidents
#>
[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdIncidentAttachment')]

    param
    (
    [Parameter(ValueFromPipelinebyPropertyName)]
    [Alias('Id')]
    $IncidentId
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/incidents/id/$IncidentId/attachments"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
}

