function Set-TdChange {
    <#
.SYNOPSIS
    see the docs
.DESCRIPTION
    see the docs
.PARAMETER ChangeId
    Id of the Change Request to be altered
.PARAMETER BodyInput
    formatted input to match the example value linked to in the NOTES
.EXAMPLE
    PS C:\> Set-TdChange
    see the docs
.NOTES
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
    begin {
        Write-PsfMessage "[$($MyInvocation.MyCommand.Name)] Function started" -Level Verbose
    }

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
    end {
        Write-PSFMessage "Function Complete" -Level Verbose
    }
}
