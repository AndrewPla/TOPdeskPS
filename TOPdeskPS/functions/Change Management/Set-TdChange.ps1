function Set-TdChange {
    <#
.SYNOPSIS
    Sort of sets a change, this is poorly supported by TOPdesk :/
.DESCRIPTION
    does most of the change setting, poorly supported by TOPdesk, read the .LINK
.PARAMETER ChangeId
    Id of the Change Request to be altered
.PARAMETER BodyInput
    formatted input to match the example value linked to in the .LINK
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> Set-TdChange -ChangeId 'C1807-627' -BodyInput 'body text'
    sets the body of specified change. this api is poorly supported by TOPdesk
.LINK
    https://developers.topdesk.com/explorer/?page=change#/Working%20as%20an%20operator/patch_operatorChanges__identifier_
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdChange',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory)]
        [system.string]
        $ChangeId,
        [Parameter(Mandatory)]
        $BodyInput
    )
    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorchanges/$ChangeId"
        $body = $BodyInput

        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Request')) {
            return
        }
        $methodParams = @{
            Uri = $uri
            Body = ($body | ConvertTo-Json)
            Method = $MethodName
        }
        $res = Invoke-TdMethod @methodParams
        $res
    }
}
