function Get-TdChange {
    <#
.SYNOPSIS
    Returns changes
.DESCRIPTION
    Returns changes. TOPdesk doesn't provide this functionality so this command will query all Activities, grab all Change Ids and then lookup the change details for them. The output of the last call is what you get
.EXAMPLE
    PS C:\> Get-TdChange
    Returns all changes
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChange')]

    param
    (

    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $activityuri = "$(Get-TdUrl)/tas/api/operatorChangeActivities"
        $activities = (Invoke-TdMethod -Uri $activityuri).results
        $changeIds = $activities.change.id | Sort-Object -unique
        foreach ($id in $changeIds) {
            Write-PSFMessage ""
            Invoke-TdMethod "$(Get-TdUrl)/tas/api/operatorChanges/$id"
        }
    }
    end {
        Write-PSFMessage "Function Complete" -level Verbose
    }
}

