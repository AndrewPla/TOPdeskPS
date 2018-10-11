function Remove-TdAssetFile {
    <#
    .SYNOPSIS
        Removes file from an asset
    .DESCRIPTION
        Removes file from an asset
    .PARAMETER UploadId
        Id of the blob that you want to remove. Use Get-TdAssetFile toreceive the id
    .EXAMPLE
        PS C:\> Get-TdAssetFile -AssetId $AssetId | Remove-TdAssetFile
        Gets all asset files from $AssetId and then removes them.
        #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/TOPdeskPS/Remove-TdAssetFile',
        SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $UploadId
    )
    process {
        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/uploads/$UploadId"
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $UploadId -Action 'Removing asset file.')) {
            return
        }
        Invoke-TdMethod -Uri $uri -Method Delete
    }
}