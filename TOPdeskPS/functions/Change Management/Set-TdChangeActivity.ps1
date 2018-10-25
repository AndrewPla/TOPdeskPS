function Set-TdChangeActivity {
    #TODO add activity template support
    #TODO Help params
    <#
.SYNOPSIS
    creates a new change activity
.DESCRIPTION
    creates a new change activity
.PARAMETER  ActivityTemplate
    ID or AT-XXXX number for activity template
.PARAMETER ChangeId
    Id of the change see Get-TdChange
.PARAMETER BriefDescription
    a brief description
.PARAMETER ChangePhase
    accepted values 'rfc' 'progress' 'evaluation'
.PARAMETER ActivityType
    accepted values 'normal' 'authorization'
.PARAMETER PlannedStartDate
    Format: 2018-04-23T10:09:00+0000
.PARAMETER PlannedFinalDate
    Format: 2018-04-23T10:09:00+0000
.PARAMETER AssigneeId
    ID of the operator to be assigned to the change
.PARAMETER AssigneeGroupId
    ID of the group to be assigned to the change
.PARAMETER AssigneeType
    accepted values 'manager' 'operator'
.PARAMETER Status
    user defined status of activity. accepts name or id
.PARAMETER Category
    user defined category of activity. accepts name or id
.PARAMETER Subcategory
    user defined subcategory of activity. accepts name or id
.PARAMETER Request
    description of activity
.PARAMETER Action
    action to be added to the activity
.PARAMETER OptionalFields1
.PARAMETER OptionalFields2
.NOTES
https://developers.topdesk.com/explorer/?page=change&version=1.2.0#/Working%20as%20an%20operator/post_operatorChangeActivities
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
                    id = $AssigneeId # parameters are CaPiTaLiZeD 0_0
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

