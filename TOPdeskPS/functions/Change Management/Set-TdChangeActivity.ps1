function Set-TdChangeActivity {
    #TODO add activity template support
    #TODO Help params
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
        [parameter(ParameterSetName = 'template')]
        $ActivityTemplate,

        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $ChangeId,

        [string]
        $BriefDescription,

        [string]
        [ValidateSet('rfc', 'progress', 'evaluation')]
        $ChangePhase,

        [string]
        [ValidateSet('normal', 'authorization')]
        $ActivityType,

        [string]
        $PlannedStartDate,

        [string]
        $PlannedFinalDate,

        [string]
        $AssigneeId,

        [parameter(ValueFromPipelineByPropertyName)]
        $AssigneeGroupId,

        [string]
        [ValidateSet('manager', 'operator')]
        $AssigneeType,

        [string]
        $Status,

        [string]
        $Category,

        [string]
        $Subcategory,

        [string]
        $Request,

        [string]
        $Action,

        [hashtable]
        $OptionalFields1,

        [hashtable]
        $OptionalFields2
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
        if ($PsCmdlet.ParameterSetName -like 'template') {
            $body | Add-Member -MemberType NoteProperty -Name activityTemplate -Value $ActivityTemplate
        }

        switch ($PSBoundParameters.Keys) {
            BriefDescription {
                $body | Add-Member -MemberType NoteProperty -Name briefDescription -Value $BriefDescription
            }
            ChangePhase {
                $body | Add-Member -MemberType NoteProperty -Name changePhase -Value $changePhase
            }
            ActivityType {
                $body | Add-Member -MemberType NoteProperty -Name activityType -Value $activityType
            }
            PlannedStartDate {
                $body | Add-Member -MemberType NoteProperty -Name plannedStartDate -Value $plannedStartDate
            }
            plannedFinalDate {
                $body | Add-Member -MemberType NoteProperty -Name plannedFinalDate -Value $plannedFinalDate
            }
            #       AssigneeGroupId {
            #          $assignee | Add-Member -MemberType NoteProperty -Name groupId -Value $AssigneeGroupId
            #     }
            #    AssigneeType {
            #       $assignee | Add-Member -MemberType NoteProperty -Name type -Value $assigneeType
            #  }
            assigneeId {
                $assignee = @{
                    id = $AssigneeId # parameters are CaPiTaLiZeD
                }
                if ($AssigneeGroupId) {
                    $assignee['groupId'] = $AssigneeGroupId
                }
                if ($AssigneeType) {
                    $assignee['type'] = $AssigneeType
                }
                $body | Add-Member -MemberType NoteProperty -Name assignee -Value $assignee #TODO look at how this is being passed. NOTE
            }
            status {
                $body | Add-Member -MemberType NoteProperty -Name status -Value $status
            }
            category {
                $body | Add-Member -MemberType NoteProperty -Name category -Value $category
            }
            subcategory {
                $body | Add-Member -MemberType NoteProperty -Name subcategory -Value $subcategory
            }
            request {
                $body | Add-Member -MemberType NoteProperty -Name request -Value $request
            }
            action {
                $body | Add-Member -MemberType NoteProperty -Name action -Value $activityaction
            }
            optionalFields1 {
                $body | Add-Member -MemberType NoteProperty -Name optionalFields1 -Value $OptionalFields1
            }
            optionalFields2 {
                $body | Add-Member -MemberType NoteProperty -Name optionalFields2 -Value $OptionalFields2
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

