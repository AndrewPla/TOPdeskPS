function Send-TdTaskNotification {
    <#
    .SYNOPSIS
        Create custom task notifications
    .DESCRIPTION
        Uses the TOPdesk Task Notification api to display task notifications. This can display toast notifications through both Chrome and Firefox.
    .PARAMETER Title
        The title of the custom notification. It will be displayed as the first line of the notification.
    .PARAMETER Body
        The body of the custom notification. It will be displayed as the second line of the notification.
    .PARAMETER Url
        A link that will be opened if the receiver of the notification clicks on the notification. It must start with '/tas/secure/’
    .PARAMETER OperatorId
        List of operator UUIDs to specify which operators this task notification will be sent to. Both ‘operatorGroupIds’ and 'operatorIds can’t be empty at the same time. Non-existing operators will be silently ignored.
    .PARAMETER OperatorGroupId
        List of operator group UUIDs to specify which operators this task notification will be sent to. Both ‘operatorGroupIds’ and ‘operatorIds’ can’t be empty at the same time. Non-existing operator groups will be silently ignored.
    .EXAMPLE
        PS C:\> Send-TdTaskNotification -Title 'Example notification' -Body 'Your assistance is needed' -OperatorIds $Operator
        Sends a notificiation to $Operator
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Send-TdTaskNotification')]
    param (
        [system.string]
        [Parameter(Mandatory)]
        $Title,

        [system.string]
        $Body,

        [ValidateScript( {
                if ($_ -notlike '/tas/secure/*') {
                    throw 'Url must start with /tas/secure/'
                }
                $true
            })]
        [system.string]
        $Url,

        [Parameter(ParameterSetName = 'Operator', Mandatory)]
        [string[]]
        $OperatorId,

        [Parameter(ParameterSetName = 'OperatorGroup', Mandatory)]
        [string[]]
        $OperatorGroupId
    )
    [array]$OperatorId = $OperatorId
    [array]$OperatorGroupId = $OperatorGroupId

    $uri = (Get-TdUrl) + '/tas/api/tasknotifications/custom'
    Write-PSFMessage "TaskNotification URL - $uri"
    $internalBody = [PSCustomObject]@{
        title = $Title
    }
    if ($Body) {$internalBody |Add-Member -Name 'body' -Value $Body -MemberType noteproperty}
    if ($url) {$internalBody | Add-Member -Name 'url' -Value $url -MemberType noteproperty}
    if ($OperatorId) {$internalBody | Add-Member -Name 'operatorIds' -Value $operatorId -MemberType noteproperty}
    if ($OperatorGroupId) {$internalBody | Add-Member -Name 'operatorGroupIds' -Value $operatorGroupId -MemberType noteproperty}
    $Params = @{
        'Uri'    = $Uri
        'Body'   = $internalBody
        'Method' = 'Post'
    }
    Invoke-TdMethod @Params
}