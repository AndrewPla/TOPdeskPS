function Set-TdOperatorGroup {
    <#
.SYNOPSIS
    Updates operator groups
.DESCRIPTION
    Updates a provided operator group. Requires write permission on operator groups.
.PARAMETER OperatorGroup
    Id of the operator group to modify
.PARAMETER Branch
    Id of the branch that is assigned to the operator group
.PARAMETER GroupName
    Operator Group Name
.PARAMETER Contact
    Hashtable containing the values that you want to set. valid properties are telephone, faxNumber, and email.
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
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdOperatorGroup',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter()]
        $Branch,

        [Parameter()]
        [ValidateLength(0, 30)]
        [string]
        $GroupName,

        [Parameter()]
        [hashtable]
        $Contact,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('id')]
        [string]
        $OperatorGroup
    )
    process {
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorgroups/id/$OperatorGroup"
        $body = [PSCustomObject]@{}
        $addMemberParams = @{ Membertype = 'Noteproperty'; InputObject = $body}

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
}

