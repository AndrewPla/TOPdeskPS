function Set-TdChangeActivity {
    #TODO add activity template support
    <#
.SYNOPSIS
    creates a new change activity
.DESCRIPTION
    creates a new change activity
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> Set-TdChangeActivity -changeId $changeId -briefDescription 'My Description' -changePhase 'progress' -status 'planned'
    creates a new change with specified fields
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdChangeActivity',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $ChangeId,

        [Parameter(mandatory = $true)]
        $BriefDescription,

        [Parameter(Mandatory)]
        [ValidateSet('rfc', 'progress', 'evaluation')]
        $changePhase,

        [string]
        $status,

        [string]
        $activityType
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -Level Verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorChangeActivities"
        $body = [PSCustomObject]@{
            changeId = $changeId
        }
        switch ($PSBoundParameters.Keys) {
            briefDescription {
                $body | Add-Member -MemberType NoteProperty -Name briefDescription -Value $BriefDescription
            }
            changePhase {
                $body | Add-Member -MemberType NoteProperty -Name changePhase -Value $changePhase
            }
            status {
                $body | Add-Member -MemberType NoteProperty -Name status -Value $status
            }
            activityType {
                $body | Add-Member -MemberType NoteProperty -Name activityType -Value $activityType
            }
        }

        Write-PSFMessage "Body: `n $($body | ConvertTo-Json)" -level verbose

        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Request')) {
            return
        }
        $methodParams = @{
            Uri = $uri
            Body = ($body | ConvertTo-Json)
            Method = 'Post'
        }
        $res = Invoke-TdMethod @methodParams
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -Level Verbose
    }
}

