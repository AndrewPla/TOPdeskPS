function Get-TdChangeProgress {
    <#
.SYNOPSIS
    Returns progress trail of specified change
.DESCRIPTION
    returns progress trail of specified change
.EXAMPLE
    PS C:\> Get-TdChangeProgress -ChangeId $changeId
    returns progress trail of specified change
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
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

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
    end {
        Write-PSFMessage "Function Complete" -level Verbose
    }
}

