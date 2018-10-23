function New-TdChangeProgress {
    #TODO this is a duplicate of New-TdChangeAction ... neither of these work
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
.EXAMPLE
    PS C:\> New-TdChangeProgress -ChangeId $ChangeId -MemoText 'this is a memo'
    addes a new memo to the specified change
#>
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
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -Level Verbose
    }

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
    end {
        Write-PSFMessage "Function Complete" -Level Verbose
    }
}

