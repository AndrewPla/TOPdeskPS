function Set-TdChangeProcessingStatus {
    <#
.SYNOPSIS
    process a change through a phase
.DESCRIPTION
    process a change through a phase
.PARAMETER ChangeId
ID of the Change. See Get-TdChange
.PARAMETER From
    original status of change
.PARAMETER Action
    Action to implement on the change
.PARAMETER Reason
    reason for the change
.PARAMETER Comment
    additional comment
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> Get-TdChangeDetail -ChangeNumber 'C1810-005' | Get-TdChangeProcessingStatus -action 'no_go'
    changes the status of specified change to specfied action
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdChangeProcessingStatus',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $ChangeId,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateSet(
            'prfc', 'rfc', 'simple_notStarted', 'simple_InProgress', 'simple_done', 'extensive_done', 'extensive_evaluated'
        )]
        [Alias('processingStatus')]
        $From,


        [Parameter(Mandatory)]
        [ValidateSet('submit', 'approve', 'reject', 'no_go', 'start', 'implement', 'close')]
        $Action,

        [string]
        $Reason,

        [string]
        $Comment


    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -Level Verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorChanges/$changeId/processingStatusTransitions"
        $body = [PSCustomObject]@{
            from = $From
            action = $action
        }
        switch ($PSBoundParameters.Keys) {
            reason {
                $body | Add-Member -MemberType NoteProperty -Name reason -Value $Reason
            }
            comment {
                $body | Add-Member -MemberType NoteProperty -Name comment -Value $Comment
            }
        }

        $methodParams = @{
            Uri = $uri
            Body = ($body | ConvertTo-Json)
            Method = 'Post'
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $methodparams.uri -Action 'Sending Request')) {
            return
        }

        $res = Invoke-TdMethod @methodParams
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -Level Verbose
    }
}

