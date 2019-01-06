function New-TdOperator {
    <#
.SYNOPSIS
    Create an operator
.DESCRIPTION
    Create new operators. Operator must have create permission on operators

.PARAMETER SurName
Surname of the operator

.PARAMETER FirstName
    Firstname of the operator

    .PARAMETER Gender
    The gender of the operator

    .PARAMETER EmployeeNumber
        The employee number of the operator

        .PARAMETER Telephone
            The telephone number for the operator
    .PARAMETER MobileNumber
        Mobile number for the operator

    .PARAMETER NetworkLoginName
        The network login name for the operator

        .PARAMETER Email
            Email address of the operator

    .PARAMETER Branch
        The id of the branch that you want to give the operator

    .PARAMETER Location
        Location id of the operator

    .PARAMETER Department
        The department id of the operator
    .PARAMETER BudgetHolder
        The budget holder id of the operator
    .PARAMETER LoginPermission
specify whether the operator has the permission to log on

.PARAMETER LoginName
    Login name, operator requires permission “Settings > Login Settings”
Is mandatory when loginPermission is set to true.
.PARAMETER Password
    Password, operator requires permission "Settings > Login Settings".
Is mandatory when “Functional Settings > Login Settings > Operator’s Section > Password mandatory on Operator card” is set.
    .PARAMETER Tasks
        Specify the tasks that you want the operator to have.
.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
.EXAMPLE
    PS C:\> New-TdOperator -Surname 'Smith' -firstname 'John' -branch (Get-TdBranch -Name HQ).id
    Creates a new operator name John Smith in the HQ branch
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/New-TdOperator',
        SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory)]
        [ValidateLength(0, 50)]
        $SurName,

        [ValidateLength(0, 30)]
        [string]
        $FirstName,

        [ValidateSet('UNDEFINED', 'MALE', 'FEMALE')]
        [string]
        $Gender,

        [ValidateLength(0, 20)]
        [string]
        $EmployeeNumber,

        [ValidateLength(0, 25)]
        [string]
        $Telephone,

        [ValidateLength(0, 25)]
        [string]
        $MobileNumber,

        [ValidateLength(0, 100)]
        [string]
        $NetworkLoginName,

        [ValidateLength(0, 100)]
        [string]
        $Email,

        [Parameter(Mandatory)]
        [string]
        $Branch,

        [string]
        $Location,

        [string]
        $Department,

        [string]
        $BudgetHolder,

        [switch]
        $LoginPermission,

        [ValidateLength(0, 100)]
        [string]
        $LoginName,

        [securestring]
        $Password,

        [ValidateSet(
            'installer',
            'firstLineCallOperator',
            'secondLineCallOperator',
            'problemManager',
            'problemOperator',
            'changeCoordinator',
            'changeActivitiesOperator',
            'requestForChangeOperator',
            'extensiveChangeOperator',
            'simpleChangeOperator',
            'scenarioManager',
            'planningActivityManager',
            'projectCoordinator',
            'projectActiviesOperator',
            'stockManager',
            'reservationsOperator',
            'serviceOperator',
            'externalHelpDeskParty',
            'contractManager',
            'operationsOperator',
            'operationsManager',
            'knowledgeBaseManager',
            'accountManager'
        )]
        [string[]]
        $Tasks

    )


    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -Level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -Level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operators"
        $body = [PSCustomObject]@{}
        $memberParams = @{ Membertype = 'Noteproperty'; InputObject = $body}
        Switch ($PSBoundParameters.Keys) {
            SurName {
                $memberParams['Name'] = 'surName'
                $memberParams['Value'] = $surName
                Add-member @memberParams
            }
            firstName {
                $memberParams['Name'] = 'firstName'
                $memberParams['Value'] = $firstName
                Add-Member @memberParams
            }
            gender {
                $memberParams['Name'] = 'gender'
                $memberParams['Value'] = $gender
                Add-Member @memberParams
            }
            employeeNumber {
                $memberParams['Name'] = 'employeeNumber'
                $memberParams['Value'] = $employeeNumber
                Add-Member @memberParams
            }
            telephone {
                $memberParams['Name'] = 'telephone'
                $memberParams['Value'] = $telephone
                Add-Member @memberParams
            }
            mobileNumber {
                $memberParams['Name'] = 'mobileNumber'
                $memberParams['Value'] = $mobileNumber
                Add-Member @memberParams
            }
            networkLoginName {
                $memberParams['Name'] = 'networkLoginName'
                $memberParams['Value'] = $networkLoginName
                Add-Member @memberParams
            }
            email {
                $memberParams['Name'] = 'email'
                $memberParams['Value'] = $email
                Add-Member @memberParams
            }
            branch {
                $memberParams['Name'] = 'branch'
                $memberParams['Value'] = @{id = $branch}
                Add-Member @memberParams
            }
            location {
                $memberParams['Name'] = 'location'
                $memberParams['Value'] = @{id = $location}
                Add-Member @memberParams
            }
            department {
                $memberParams['Name'] = 'department'
                $memberParams['Value'] = @{id = $department}
                Add-Member @memberParams
            }

            budgetHolder {
                $memberParams['Name'] = 'budgetHolder'
                $memberParams['Value'] = @{id = $budgetHolder}
                Add-Member @memberParams
            }
            loginPermission {
                $memberParams['Name'] = 'loginPermission'
                $memberParams['Value'] = $loginPermission.tostring().tolower()
                Add-Member @memberParams
            }
            loginName {
                $memberParams['Name'] = 'loginName'
                $memberParams['Value'] = $loginName
                Add-Member @memberParams
            }
            password {
                $cred = New-Object pscredential ('user', $password)
                $memberParams['Name'] = 'password'
                $memberParams['Value'] = $cred.GetNetworkCredential().password
                Add-Member @memberParams
            }
            Tasks {
                foreach ($t in $Tasks) {
                    $body | Add-Member -MemberType NoteProperty -Name $t -Value 'true'
                }
            }
        }
        #region tasks

        #endregion tasks



        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending Body: $($Body | Out-String)")) {
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

