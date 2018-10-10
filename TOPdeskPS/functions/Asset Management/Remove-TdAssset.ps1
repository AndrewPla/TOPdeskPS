function Remove-TdAsset {
    <#
	.SYNOPSIS
		Deletes the given asset

	.DESCRIPTION
		Deletes the given assets.It may be possible that one or more assets couldn’t be deleted because they have existing links from other components. In this case those assets’ ids will be listed in the ‘failed’ list of the response, but it doesn’t affect deletion of other assets.

	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

	.EXAMPLE
		PS C:\> Remove-TdAsset -AssetId $AssetId
		Removes all assets with id's inside $assetId.
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Remove-TdAsset',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [string[]]
        $AssetId
    )

    begin {

    }
    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assets/delete"

        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $AssetId.ToString() -Action 'Removing asset.')) {
            return
        }
        $body = [PSCustomObject]@{
            unids = $AssetId
        }
        $params = @{
            'Uri'    = $uri
            'Body'   = $body
            'Method' = 'Post'
        }
        Write-PSFMessage -Message "Body - $body" -Level InternalComment
        Invoke-TdMethod @params
    }
    end {

    }
}