function New-TdAssetGridFieldRow {
    <#
.SYNOPSIS
    Creates a new row on a grid field.
.DESCRIPTION
    Uses an undocumented API endpoint to create a new row in an GridView asset field.
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> New-TdAssetGridFieldRow -TypeId -Body @{number = 25; name = 'test asset row'}
    Adds a new row to a gridfield with a value for number and name.
#>
[CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdAssetGridFieldRow',
        SupportsShouldProcess = $true)]
    param
    (

    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/assetmgmt/assets"
        $body = [PSCustomObject]@{}
        $addMemberParams = @{ Membertype = 'Noteproperty'; InputObject = $body}

        Switch ($PSBoundParameters.Keys){
            Value {
                $addMemberParams['Name'] = 'value'
                $addMemberParams['Value'] = $value
                Add-Member @addMemberParams
            }
        }

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

