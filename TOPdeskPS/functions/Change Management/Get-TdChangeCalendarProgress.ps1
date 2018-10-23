function Get-TdChangeCalendarProgress {
    <#
.SYNOPSIS
    returns the progress trail of the specified calendar id
.DESCRIPTION
    returns the progress trail of the specified calendar id
.PARAMETER CalendarId
    ID of the Calendar Event. See Get-TdChangeCalendar
.EXAMPLE
    PS C:\> Get-TdChangeCalendar | Get-TdChangeCalendarProgress
    returns the progress trail of all calendar events
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeCalendarProgress')]

    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $calendarId
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/changeCalendar/$calendarId/progresstrail"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level Verbose
    }
}

