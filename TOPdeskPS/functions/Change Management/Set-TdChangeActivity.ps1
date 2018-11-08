function Set-TdChangeActivity {
    <#
.SYNOPSIS
    modifies an existing activity within a change
.DESCRIPTION
    Updates a change activity with the provided op, path, and value.
    Also triggers Events and Actions. Note! Actions that require user interaction like “Confirm before sending”
or “Editable before sending” will not be executed.

When status determines processing status is enabled the /processingStatus field is ignored.


.PARAMETER InputObject
    This is an object containing the Path, op, and value.
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS> $object = [pscustomobject]@()
    PS> $object += @{ op = 'add'; path = '/progressTrail'; value = 'a message from PS!'}
    PS> $object += @{ op = 'replace'; path = '/briefDescription'; value = 'A New Description'}
    PS> Set-TdChangeActivity -ActivityId $activityid -InputObject $object

    InputObject must be an array, each action to be taken on the Activity is an object inside the InputObject

    .LINK
        https://developers.topdesk.com/explorer/?page=change#/Working%20as%20an%20operator/patch_operatorChangeActivities__identifier_
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
        $ActivityId,

        [Parameter(
            mandatory = $true,
            ValueFromPipeline
        )]
        $InputObject

        # [Parameter(mandatory = $true)]
        # [ValidateSet('add','remove','replace','move','copy','test')]
        # $op,

        # [Parameter(mandatory = $true)]
        # [ValidateScript{
        #     $keys = @(“briefDescription”
        #     “requests”
        #     “progressTrail”
        #     “processingStatus”
        #     “activityType”
        #     “category”
        #     “subcategory”
        #     “status”
        #     “operator”
        #     “assignee”
        #     “assigneetype”
        #     “assigneeid”
        #     “assigneegroupId”
        #     “plannedStartDate”
        #     “plannedFinalDate”
        #     "optionalFields*")
        # }]
        # $path,

        # $value,

        # $from,

    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -Level Verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorChangeActivities/$ActivityId"

        Write-PSFMessage -Level Verbose 'constructing Body.'
        $body = [pscustomobject]@(
        )

        foreach ($obj in $InputObject) {
            $body += @{
                op = $obj.op
                path = $obj.path
                value = $obj.value
            }
        }

        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Request')) {
            return
        }
        $methodParams = @{
            Uri = $uri
            Body = (ConvertTo-Json -InputObject $body)
            Method = 'Patch'
            ContentType = 'application/json-patch+json'
        }
        $res = Invoke-TdMethod @methodParams
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -Level Verbose
    }
}

