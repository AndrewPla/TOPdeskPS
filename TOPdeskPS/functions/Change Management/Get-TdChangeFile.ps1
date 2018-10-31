function Get-TdChangeFile {
    <#
    .SYNOPSIS
        Lists files from an asset
    .DESCRIPTION
        Lists files from an asset
     .PARAMETER ChangeID
        Id of the change that you want files for
    .PARAMETER FileId
        Id of the file you wish to downloads
    .EXAMPLE
        PS C:\> Get-TdAssetFile -ChangeId $ChangeId -FileId $FileId
        Returns files from asset $ChangeId
        #>
    [cmdletbinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdChangeFile')]
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('Id')]
        [system.string]
        $ChangeId,

        [Parameter(Mandatory = $true)]
        [system.string]
        $FileId

    )
    $uri = (Get-TdUrl) + "/tas/api/operatorChanges/$ChangeId/attachments/$FileId"
    Invoke-TdMethod -Uri $uri| out-file
}
