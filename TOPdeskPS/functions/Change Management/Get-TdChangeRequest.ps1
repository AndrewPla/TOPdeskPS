function Get-TdChangeRequest {
    <#
.SYNOPSIS
    returns list of change requests
.DESCRIPTION
    returns list of change requests
.EXAMPLE
    PS C:\> Get-TdChangeRequest -ChangeId $ChangeId
    returns list of change requests associated with specified change
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeRequest')]

    param
    (
        [Parameter(
            mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [Alias('Id')]
        $ChangeId,

        [switch]
        $InlineImages,

        [switch]
        $BrowserFriendlyUrls
    )
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -level verbose
    }

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorChanges/$Changeid/requests"

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

