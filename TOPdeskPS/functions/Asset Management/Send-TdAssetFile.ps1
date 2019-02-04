function Send-TdAssetFile {
    <#
    .SYNOPSIS
        Upload a file to an asset
    .DESCRIPTION
        Upload a file to an asset
    .PARAMETER Number
        The number of the incident that you want to upload a file to.
    .PARAMETER File
        Path and name to the file that you want to upload to the incident.
    .PARAMETER AssetID
        Id of the asset that you want to send a file to. See Get-TdAsset
    .EXAMPLE
        PS C:\> Get-TdAsset -NameFragment 'test-computer' | Send-TdAssetFile -File "C:\log.txt"
        Sends a File to the asset named test-computer.
    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Send-TdAssetFile')]
    param (

        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $AssetId,

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
    begin {
    }
    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/assetmgmt/uploads/?assetId=$AssetId"
        Write-PSFMessage "Uri - $uri" -Level debug

        $File = Get-Item $file

        $params = @{
            Uri = $Uri
            Method = 'Post'
            File = $File
        }
        Invoke-TdMethod @params
    }

}
