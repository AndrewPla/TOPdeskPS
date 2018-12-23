function Set-TdOperatorGroup {
    <#
.SYNOPSIS
    Updates operator groups
.DESCRIPTION
    Updates a provided operator group. Requires write permission on operator groups. Can also be used to Archive/Unarchive operator groups.
.PARAMETER OperatorGroup
    Id of the operator group to modify
.PARAMETER Branch
    Id of the branch that is assigned to the operator group
.PARAMETER GroupName
    Operator Group Name
.PARAMETER Contact
    Hashtable containing the values that you want to set. valid properties are telephone, faxNumber, and email.
.PARAMETER ArchiveReason
    The archiving reason id. Mandatory when no default reason is set.
.PARAMETER Archive
    Specify if you want to archive an operator group
.PARAMETER UnArchive
    Specify when you want to bring an operator group from being archived
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> Get-TdOperatorGroup 'TechSupport' | Set-TdOperatorGroup -Groupname 'TechSupport New'
    Updates the name of the operator group
.EXAMPLE
    PS> Get-TdOperatorGroup 'HR' | Set-TdOperatorGroup -Contact @{telephone = '123-456-7890'; email = 'test@testing.com'}
    Updates the contact email and telephone.
.EXAMPLE
    PS> Get-TdOperatorGroup 'TechSupport' | Set-TdOperatorGroup -Archive -ArchiveReason (Get-TdArchiveReason 'No Longer Val*').id
    Archives the operator group and applies the archive reason 'No longer valid'
.EXAMPLE
    PS> Get-TdOperatorGroup 'TechSupport' -Archived | Set-TdOperatorGroup -UnArchive
    UnArchive the operator group. Note that we had to specify -Archived on Get-TdOperatorGroup
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdOperatorGroup',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(ParameterSetName = 'Update')]
        $Branch,

        [Parameter(ParameterSetName = 'Update')]
        [ValidateLength(0, 30)]
        [string]
        $GroupName,

        [Parameter(ParameterSetName = 'Update')]
        [hashtable]
        $Contact,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [string]
        $OperatorGroup,

        [Parameter(ParameterSetName = 'Archive')]
        [switch]
        $Archive,

        [Parameter(ParameterSetName = 'Archive')]
        [string]
        $ArchiveReason,

        [Parameter(ParameterSetName = 'UnaArchive')]
        [switch]
        $UnArchive
    )
    process {
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment
        Write-PSFMessage "ParameterSetName: $($PSCmdlet.ParameterSetName)" -Level InternalComment

        $body = [PSCustomObject]@{}
        $addMemberParams = @{ Membertype = 'Noteproperty'; InputObject = $body}

        switch ($PSCmdlet.ParameterSetName) {
            Update {
                $uri = "$(Get-TdUrl)/tas/api/operatorgroups/id/$OperatorGroup"
                switch ($PSBoundParameters.Keys) {
                    GroupName {
                        $addMemberParams['Name'] = 'groupName'
                        $addMemberParams['Value'] = $GroupName
                        Add-Member @addMemberParams
                    }

                    Branch {
                        $addMemberParams['Name'] = 'branch'
                        $addMemberParams['Value'] = @{id = $Branch}
                        Add-Member @addMemberParams
                    }

                    Contact {
                        $addMemberParams['Name'] = 'contact'
                        $addMemberParams['Value'] = $Contact
                        Add-Member @addMemberParams
                    }

                }

                if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Request')) {
                    return
                }
                $methodParams = @{
                    Uri = $uri
                    Body = ($body | ConvertTo-Json)
                    Method = 'PUT'
                }
                $res = Invoke-TdMethod @methodParams
                $res

            }

            Archive {
                $uri = "$(Get-TdUrl)/tas/api/operatorgroups/id/$OperatorGroup/archive"
                if ($ArchiveReason) {
                    $addMemberParams['Name'] = 'id'
                    $addMemberParams['Value'] = $ArchiveReason
                    Add-member @addMemberParams
                }
                if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending Archive Request')) {
                    return
                }
                $methodParams = @{
                    Uri = $uri
                    Body = ($body | ConvertTo-Json)
                    Method = 'PUT'
                }
                $res = Invoke-TdMethod @methodParams
                $res
            }

            UnaArchive {
                $uri = "$(Get-TdUrl)/tas/api/operatorgroups/id/$OperatorGroup/unarchive"

                if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action 'Sending UnArchive Request')) {
                    return
                }
                $methodParams = @{
                    Uri = $uri
                    Method = 'PUT'
                }
                $res = Invoke-TdMethod @methodParams
                $res
            }
        }

    }
}

