function Get-TdChangeCalendarDetail {
    <#
.SYNOPSIS
    returns detailed information about the change
.DESCRIPTION
    returns detailed infromation about the change
.Parameter CalendarId
    Id of the calendar event
.EXAMPLE
    PS C:\> Get-TdChangeCalendarDetail -ChangeId $changeId
    returns detailed information about the change
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeCalendarDetail')]

    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $CalendarId
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/changeCalendar/$CalendarId"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }

}

