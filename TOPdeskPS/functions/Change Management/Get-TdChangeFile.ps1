﻿function Get-TdChangeFile {
    <#
    .SYNOPSIS
        Lists files from an asset
    .DESCRIPTION
        Lists files from an asset
     .PARAMETER ChangeID
        Id of the change that you want files for
    .PARAMETER FileId
        Id of the file you wish to downloads
    .PARAMETER OutFile
        file location to save outputted file to
    .EXAMPLE
        PS C:\> Get-TdChangeFile -ChangeId $ChangeId -FileId $FileId -OutFile .\output.txt
        Returns files from change $ChangeId
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
        $FileId,

        $OutFile

    )
    $params = @{
        uri = "$(Get-TdUrl)/tas/api/operatorChanges/$ChangeId/attachments/$FileId"
    }
    if ( $OutFile ) { $params['OutFile'] = $OutFile }
    Invoke-TdMethod @params
}