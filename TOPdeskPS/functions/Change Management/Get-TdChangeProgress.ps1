function Get-TdChangeProgress {
    <#
.SYNOPSIS
    Returns progress trail of specified change
.DESCRIPTION
    returns progress trail of specified change
.PARAMETER ChangeId
    ID of the Change See Get-TdChange
.PARAMETER InlineImages
    if enabled InlineImages will be in the output
.PARAMETER BrowserFriendlyUrls
    if enabled Browser Friendly Urls will be in output
.EXAMPLE
    PS C:\> Get-TdChangeProgress -ChangeId (Get-TdChange -Name 'example).id
    returns progress trail of specified change
.EXAMPLE
    PS C:\> Get-TdChange -Name 'My Sample Change' | Get-TdChangeProgress
    Returns progress trail of 'My Sample Change'

#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeProgress')]

    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $ChangeId,

        [switch]
        $InlineImages = $false,

        [switch]
        $BrowserFriendlyUrls = $false
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorChanges/$ChangeId/progresstrail"

        #TODO fix this logic these are both 'query' and not 'path' for the param type
        if ($InlineImages) {
            $uri = "$uri&inlineimages=true"
        }
        if ($BrowserFriendlyUrls) {
            $uri = "$uri&browserFriendlyUrls=true"
        }
        $res = Invoke-TdMethod -Uri $uri
        $res
    }

}

