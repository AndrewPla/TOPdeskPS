function Get-TdAssetGridFieldValue {

    <#
.SYNOPSIS
    Returns grid field values
.DESCRIPTION
    Returns grid field values for a provided grid field widget
.PARAMETER AssetId
    The id of the asset to return gridfield values for.
.PARAMETER FieldId
    This is the id of the widget. You can obtain this by retrieving a blank version of the template using Get-TdAssetTemplateBlank and then going accessing the
    $template.metadata.template.tabs.columns.widgets | Where widgettype -like gridwidget
    From here you can use the fieldId which should begin with '@gridwidgetfield_'
    See the example for more
.EXAMPLE
    PS > $asset = Get-TdAsset -NameFragment TestAsset123
    PS > $template = Get-TdAssetTemplate Network | Get-TdAssetTemplateBlank
    PS > $widget = $template.metadata.template.tabs.columns.widgets |
        Where widgettype -like gridwidget

    PS > Get-TdAssetGridFieldValue -AssetId $asset.id -FieldId $widget.fieldId

    Grabs the relevant asset
    Gets a blank template for the desired asset template
    Grabs the widget with a title of Notes
    Returns the gridfield values for the asset and the fields for the Notes widget.

.LINK
https://developers.topdesk.com/explorer/?page=assets#/Assets/getGridFieldValues
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetGridFieldValue')]

    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [string]
        $AssetId,

        [Parameter(Mandatory)]
        [string]
        $FieldId
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/assetmgmt/assets/getGridFieldValues/?assetId=$AssetId&fieldId=$FieldId"
        Invoke-TdMethod -Uri $uri
    }

}

