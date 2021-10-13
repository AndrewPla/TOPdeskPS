function Get-TdChangeCalendar {
    <#
.SYNOPSIS
    returns list of changes and activities in specified date range
.DESCRIPTION
    returns list of changes and activities in specified date range. For activities to appear in this endpoint the option “Display in Calendar” under “Planning” on the activity card has to be set. Start and end date are mandatory.
.PARAMETER Start
    start of range to return changes. Default value = 90 days
.PARAMETER End
    end of range to return changes. Default value = 90 days
.PARAMETER CardType
    Type of card to filter results by. Accepted options 'change_simple', 'change_extensive', 'undefined', 'activity_authorization', 'activity_normal'
.PARAMETER Branch
    Branch to filter results by
.PARAMETER Category
    Category of cards to obtain
.PARAMETER Subcategory
    Subcategory of cards to obtain
.PARAMETER Status
    Status of cards to obtain
.PARAMETER Type
    Type of cards to obtain
.PARAMETER CurrentState
    CurrentState that cards to be obtained are in
.EXAMPLE
    PS C:\> Get-TdChangeCalendar
    Returns results with default date values (90 days back and 90 days forward)
.EXAMPLE
    PS C:\> Get-TdChangeCalendar -Branch 'Side Branch'
    Returns all results for 'Side Branch' branch
.EXAMPLE
    PS C:\> Get-TdChangeCalendar -CurrentState 'done'
    Returns all 'done' change cards
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeCalendar')]

    param
    (

        [datetime]
        $Start = ((get-date).AddDays(-90)),

        [datetime]
        $End = ((get-date).AddDays('90')),

        [ValidateSet('change_simple', 'change_extensive', 'undefined', 'activity_authorization', 'activity_normal')]
        [string[]]
        $CardType,

        [string[]]
        $Branch,

        [string[]]
        $Category,
        
        [string[]]
        $Subcategory,

        [string[]]
        $Status,

        [string[]]
        $Type,

        [ValidateSet('planned', 'in_progress', 'done')]
        [string[]]
        $CurrentState


    )
    begin {
        Write-PsfMessage "Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $methodParams = @{
            Uri = "$(Get-TdUrl)/tas/api/changeCalendar?start=$(get-date $start -UFormat '+%Y-%m-%dT%H:%M:%SZ')&end=$(get-date $end -UFormat '+%Y-%m-%dT%H:%M:%SZ')"
        }

        if ($PSBoundParameters.Keys -contains 'CardType') {
            foreach ($g in $cardType) {
                $methodParams['Uri'] = "$($methodParams.uri)&cardType=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'branch') {
            foreach ($g in $branch) {
                $methodParams['Uri'] = "$($methodParams.uri)&branch=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'category') {
            foreach ($g in $category) {
                $methodParams['Uri'] = "$($methodParams.uri)&category=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'subcategory') {
            foreach ($g in $subcategory) {
                $methodParams['Uri'] = "$($methodParams.uri)&subcategory=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'status') {
            foreach ($g in $status) {
                $methodParams['Uri'] = "$($methodParams.uri)&status=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'type') {
            foreach ($g in $type) {
                $methodParams['Uri'] = "$($methodParams.uri)&type=$g"
            }
        }

        if ($PSBoundParameters.Keys -contains 'currentState') {
            foreach ($g in $currentState) {
                $methodParams['Uri'] = "$($methodParams.uri)&currentState=$g"
            }
        }

        $res = Invoke-TdMethod @methodParams
        ($res).results
    }
    end {
        Write-PSFMessage "Function Complete" -level Verbose
    }
}

