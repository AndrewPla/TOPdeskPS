function Get-TdIncidentFile {
    <#
.SYNOPSIS
    obtains a list of files in an incident
.DESCRIPTION
    obtains a list of files in an incident
.PARAMETER IncidentId
ID of the Incident. See Get-TdIncident
.EXAMPLE
    PS C:\> Get-TdIncidentFile -IncidentId (Get-TdIncident -Number 'I1810-NNN).id
    gets list of files in specified incident
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdIncidentFile')]

    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $IncidentId
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/incidents/id/$incidentid/attachments"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level Verbose
    }
}

