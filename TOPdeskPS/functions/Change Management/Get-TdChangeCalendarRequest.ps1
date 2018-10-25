function Get-TdChangeCalendarRequest {
    <#
.SYNOPSIS
    Lists the requests for specified calendar event
.DESCRIPTION
    lists the requests for specified calendar event
.EXAMPLE
    PS C:\> Get-TdChangeCalendar | Get-TdChangeCalendarRequest
    lists all change requests 
#>
[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeCalendarRequest')]

    param
    (

    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
        }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/changeCalendar/$calendarId/requests"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
    end {
        Write-PSFMessage "Function Complete" -level Verbose
    }
}

