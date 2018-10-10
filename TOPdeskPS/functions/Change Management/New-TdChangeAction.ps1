function New-TdChangeAction {
    <#
    .SYNOPSIS
        Creates a new action for a change
    .DESCRIPTION
        Create a simple change action for a change. Rich text is not supported.
    .PARAMETER ChangeId
        The UNID of the change.
    .PARAMETER MemoText
    The text of this progress trail entry, if it is of type 'memo’. May not contain only whitespace characters (Spaces, New Lines, Tabs) and may not be empty. Rich text is not supported when using this object to create a new progress trail entry.
    	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

    .EXAMPLE
        PS C:\> <example usage>
        Explanation of what the example does
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/New-TdChangeAction',
        SupportsShouldProcess = $true)]
    param (
        [system.string]
        $ChangeId,
        [system.string]
        $MemoText
    )

    begin {
        Write-PSFMessage -Level InternalComment -Message "Bound parameters: $($PSBoundParameters.Keys -join ", ")" -Tag 'debug', 'start', 'param'
        $url = (Get-TdUrl) + "/tas/api/operatorChanges/$ChangeId/progresstrail"

    }

    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"

        #TODO look into this more

        $Body = [PSCustomObject]@{
            memoText = $MemoText
            # API currently only supports memos os this is hardcoded.
            type     = 'memo'
        }
        $body
        $Params = @{
            'Uri'    = $url
            'Body'   = $Body
            'Method' = 'Post'
        }
        Invoke-TdMethod @Params
    }

}