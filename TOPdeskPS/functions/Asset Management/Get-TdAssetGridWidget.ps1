function Get-TdAssetGridWidget {
    <#
.SYNOPSIS
    Returns grid widgets
.DESCRIPTION
    returns grid widgets
.EXAMPLE
    PS C:\> Get-TdAssetGridWidget
    returns all grid widgets
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdAssetGridWidget')]

    param
    (

    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/assetmgmt/fields/gridWidgetFields"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }
}

