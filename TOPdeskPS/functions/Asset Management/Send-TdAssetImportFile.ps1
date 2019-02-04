function Send-TdAssetImportFile {
    <#
    .SYNOPSIS
        Sends a file to containing assets to be uploaded to asset management.
    .DESCRIPTION
        In order to upload assets using this endpoint you need to first configure an import inside TOPdesk.

        As an operator, go to Settings -> Import Settings -> Asset MGMT Imports -> New Import

        Configure the import using the csv containing your asset information. Set the Scheduling of the import to be Automated

        When you upload a csv with the same name as specified in your import, TOPdesk will automatically trigger an import of the csv when you upload it using this command.

    .PARAMETER File
        The csv containing your assets
    .PARAMETER Confirm
        If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
    .PARAMETER WhatIf
        If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
    .EXAMPLE
        PS C:\> Send-TdAssetImportFile -File 'C:\AssetsToImport.csv'
        Sends C:\AssetstoImport.csv to TOPdesk asset import. This will cause an import to occur

    #>
    [cmdletbinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Send-TdAssetImportFile',
        SupportsShouldProcess = $true)]
    param(
        [Alias('InFile')]
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateScript( {
                if (-Not ($_ | Test-Path)) {
                    throw "File or folder does not exist"
                }
                if (-Not ($_ | Test-Path -PathType Leaf)) {
                    throw "The Path argument must be a file. Folder paths are not allowed."
                }
                if (-Not (Get-Item $_)) {
                    throw "Cannot find path $($_)"
                }
                return $true
            })]
        [System.IO.FileInfo]
        $File
    )
    process {

        $file = Get-Item $file
        $uri = "$(Get-TdUrl)/services/import-to-api-v1/api/sourceFiles?filename=$($File.name)"


        $params = @{
            Infile = $file
            uri = $uri
            Method = 'PUT'
            ContentType = 'application/octet-stream'
        }
        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending to Invoke-RestMethod -- $($params | out-string)")) {
            return
        }
        Invoke-TdMethod @params
    }
}
