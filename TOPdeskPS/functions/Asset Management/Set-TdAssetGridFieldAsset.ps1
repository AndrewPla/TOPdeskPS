function Set-TdAssetGridFieldAsset {
    <#
.SYNOPSIS
    updates a gridfield for an existing asset
.DESCRIPTION
    updates the gridfield for an existing asset.
.PARAMETER HostAssetId
    Id of the asset that you want to get the gridfield for. See Get-TdAsset
.PARAMETER AssetId
    Id of the row to be edited.
.PARAMETER Body
        This object contains key-value pairs, where the key is the modified field’s id, and the value is the new value.
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS > $assetDetails = Get-TdAsset -NameFragment TestAsset123 | Get-TdAssetDetails
    PS > $widget = $assetDetails.Data.'@gridwidgetfield_UNID' | Select -first 1
    PS > Set-TdAssetGridFieldAsset -AssetId $widget -HostAssetId $asset.id -body $body
    updates the first row of the gridview on $asset
.LINK
https://developers.topdesk.com/explorer/?page=assets#/Assets/update
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdAssetGridFieldAsset',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory)]
        [string]
        $HostAssetId,

        [Parameter(Mandatory)]
        [string]
        $AssetId,

        [Parameter(Mandatory)]
        [pscustomobject]
        $Body
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/assetmgmt/assets/gridFieldAsset/?assetId=$AssetId&hostAssetId=$HostAssetId"

        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Request')) {
            return
        }
        $methodParams = @{
            Uri = $uri
            Body = ($body | ConvertTo-Json)
            Method = 'POST'
        }
        Invoke-TdMethod @methodParams
    }
}

