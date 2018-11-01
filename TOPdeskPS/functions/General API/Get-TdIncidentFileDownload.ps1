function Get-TdIncidentFileDownload {
    <#
    .SYNOPSIS
        downloads files from an incident
    .DESCRIPTION
        downloads files from an incident
     .PARAMETER IncidentID
        Id of the incident that you want files for
    .PARAMETER FileId
        Id of the file you wish to downloads
    .PARAMETER OutFile
        file location to save outputted file to
    .EXAMPLE
        PS C:\> Get-TdIncidentFileDownload -IncidentId $IncidentId -FileId $FileId
        Returns files from incident $IncidentId
        #>
    [cmdletbinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdIncidentFileDownload')]
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $IncidentId,

        [Parameter(Mandatory = $true)]
        [system.string]
        $FileId,

        $OutFile

    )
    $params = @{
        uri = "$(Get-TdUrl)/tas/api/incidents/id/$IncidentId/attachments/$FileId/download"
    }
    if ( $OutFile ) { $params['OutFile'] = $OutFile }
    Invoke-TdMethod @params
}
