function Set-TdAsset {
    <#
	.SYNOPSIS
		Updates an asset
	.DESCRIPTION
		Updates the given asset.It may be possible that one or more assets couldn’t be deleted because they have existing links from other components. In this case those assets’ ids will be listed in the ‘failed’ list of the response, but it doesn’t affect deletion of other assets.
    .PARAMETER AssetId
        Id of the asset to update
    .PARAMETER Body
        This object contains key-value pairs, where the key is the modified field’s id, and the value is the new value.
        If a mandatory field is not given in this model, then it’s value remains the same.
        Example:
        {
          "numberField": "string",
         "textField": "string",
        "dropdownField": "string",
          "@status": "OPERATIONAL",
        "@statusLocked": true,
        "@etag": "string"
        }
        Further explanation.
        numberField	string
        An example value could be: 15.440

        textField	string
        An example value could be: Sample text

        dropdownField	string
        An example dropdown value is an id: AF404E17-F1E3-4AB7-BB77-F9FC5189CF6E

        @status	string
        Status shows if this asset is operational right now or not. Main field to set for triggering Impact Analysis features
        Enum:
        [ OPERATIONAL, IMPACTED ]

        @statusLocked	boolean
        Enterprise users can enable automatic propagation by setting @statusLocked to false, or stop automatic propagation and enable manual status switching by setting @statusLocked to true.

        @etag	string
        ETag for the given entity. It is used for concurrent modification checking with optimistic locking.
	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
	.EXAMPLE
		PS C:\> Set-TdAsset -AssetId $AssetId
        Removes all assets with id's inside $assetId.
    .NOTES see for more: https://developers.topdesk.com/explorer/?page=assets&version=1.5.1#/Assets/update
#>

    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Set-TdAsset',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $AssetId,

        [Parameter(Mandatory)]
        [pscustomobject]$Body

        #TODO add parameters for status, statuslocked, and etag as shortcuts to quickly spin up a body for the request.
    )

    begin {

    }
    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/assets/$AssetId"

        Write-PSFMessage "$($Body | ConvertTo-Json | Out-String)" -Level debug
        $params = @{
            'Uri'    = $uri
            'Body'   = $Body
            'Method' = 'Post'
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Updating asset.')) {
            return
        }
        Invoke-TdMethod @params
    }
    end {

    }
}