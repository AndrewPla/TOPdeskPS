function New-TdOperatorGroup {
    <#
.SYNOPSIS
    Create an operator group
.DESCRIPTION
    Create an operator group
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
    PS C:\> New-TdOperatorGroup -Branch (Get-TdBranch 'Miami').id -GroupName 'Miami Group'
    Creates a new operator group named 'Miami Group' that is attached ot the Miami branch
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdOperatorGroup',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory)]
        [string]
        $Branch,

        [Parameter(Mandatory)]
        [ValidateLength(0, 30)]
        [string]
        $GroupName,

        [Parameter()]
        [hashtable]
        $Contact
    )
    process {
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operatorgroups"
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
            Method = 'POST'
        }
        $res = Invoke-TdMethod @methodParams
        $res
    }
}

