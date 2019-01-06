function New-TdChangeProgress {
    <#
.SYNOPSIS
    creates a new action for specified change
.DESCRIPTION
    creates a new action for specified change
.PARAMETER ChangeId
    ID of the Change
.PARAMETER MemoText
    text to be added to memo field
.PARAMETER Type
    The type of this progress trail entry.
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> New-TdChangeProgress -ChangeId $ChangeId -MemoText 'this is a memo'
    addes a new memo to the specified change
#>
    #TODO this is a duplicate of New-TdChangeAction ... neither of these work

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdChangeProgress',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $ChangeId,

        [Parameter(Mandatory = $true)]
        [string]
        $MemoText,

        [ValidateSet('memo', 'attachment', 'link')]
        [string]
        $Type = 'memo'

    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorChanges/$ChangeId/progresstrail"
        $body = [PSCustomObject]@{}
        $body | Add-Member -MemberType NoteProperty -Name 'memoText' -Value $MemoText
        $body | Add-Member -MemberType NoteProperty -Name 'type' -Value $Type

        Write-PSFMessage "Body: `n$($body | ConvertTo-Json)" -level Verbose


        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Request')) {
            return
        }

        $methodParams = @{
            'Uri' = $uri
            'Body' = ($body | ConvertTo-Json)
            'Method' = 'Post'
        }
        $res = Invoke-TdMethod @methodParams
        $res
    }
}

