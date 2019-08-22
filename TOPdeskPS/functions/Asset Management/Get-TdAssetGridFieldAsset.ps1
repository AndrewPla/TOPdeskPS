function Get-TdAssetGridFieldAsset {
    <#
.SYNOPSIS
    retrieves a line from a grid field
.DESCRIPTION
    retrieves a line from a grid field.
.PARAMETER HostAssetId
    Id of the asset that you want to get the gridfield for. See Get-TdAsset
.PARAMETER AssetId
    Id of the gridfield to return. See Get-TdAssetDetail. You will want to look at $assetDetails.data.'@gridwidgetfield_12345'. This property contains the values for each row in the widget.
.EXAMPLE
    PS > $asset = Get-TdAsset -NameFragment TestAsset123 | Get-TdAssetDetails
    PS > $widget = $assetDetails.Data.'@gridwidgetfield_UNID' # use tab to select the proper id
    PS > $widget | foreach-object {Get-TdAssetGridFieldAsset -AssetId $_ -HostAssetId $asset.Id}
    Returns the values for all rows in the gridfieldwidget for TestAsset123
.LINK
https://developers.topdesk.com/explorer/?page=assets#/Assets/update
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetGridFieldAsset')]

    param
    (
        [Parameter(Mandatory)]
        [string]
        $HostAssetId,

        [Parameter(Mandatory)]
        [Alias('RowId')]
        [string]
        $AssetId
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/assetmgmt/assets/gridFieldAsset/?assetId=$AssetId&hostAssetId=$HostAssetId"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
}

