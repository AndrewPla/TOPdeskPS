function Set-TdOperatorOperatorGroup {
    <#
.SYNOPSIS
    Link and unlink operator groups from an operator
.DESCRIPTION
    link and unlink operator groups from an operator
.PARAMETER OperatorId
    Id of the operator that you want to link/unlink operator groups from
.PARAMETER LinkId
    ids of groups that you want to link
.PARAMETER UnlinkId
    ids of groups that you want to unlink.
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> Get-TdOperator 'Test User' | Set-TdOperatorOperatorGroup -LinkId (Get-TdOperatorGroup 'Group1').id
    Link the group1 operatorgroup to Test User
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdOperatorOperatorGroup',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        $OperatorId,

        [Parameter(ParameterSetName = 'Link')]
        [string[]]
        $LinkId,

        [Parameter(ParameterSetName = 'Unlink')]
        [string[]]
        $UnlinkId
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operators/id/$OperatorId/operatorgroups"
        $body = [PSCustomObject]@{}
        switch ($PSBoundParameters.keys) {
            LinkId {
                $body = [PSCustomObject]@{}
                $memberParams = @{ Membertype = 'Noteproperty'; InputObject = $body}

                foreach ($l in $LinkId) {
                    $memberParams['Name'] = 'id'
                    $memberParams['Value'] = $l
                    Add-Member @memberParams
                }
                $methodParams = @{
                    Uri = $uri
                    Body = ($body | ConvertTo-Json)
                    Method = 'POST'
                }
                if (($body | ConvertTo-Json).count -eq 1) {
                    $methodParams['body'] = "[$($body | Convertto-json)]"
                }

                if (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending Request:$($body | ConvertTo-Json)") {
                    $res = Invoke-TdMethod @methodParams
                    $res
                }

            }
            UnlinkId {
                $body = [PSCustomObject]@{}
                $memberParams = @{ Membertype = 'Noteproperty'; InputObject = $body}
                foreach ($l in $UnLinkId) {
                    $memberParams['Name'] = 'id'
                    $memberParams['Value'] = $l
                    Add-Member @memberParams
                }
                $methodParams = @{
                    Uri = $uri
                    Body = ($body | ConvertTo-Json)
                    Method = 'DELETE'
                }
                if (($body | convertto-json).count -eq 1) {
                    $methodParams['body'] = "[$($body | Convertto-json)]"
                }

                if (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending Request:$($body | ConvertTo-Json)") {
                    $res = Invoke-TdMethod @methodParams
                    $res
                }
            }
        }
    }
}

