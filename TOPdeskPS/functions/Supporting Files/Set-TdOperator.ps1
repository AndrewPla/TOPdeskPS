function Set-TdOperator {
    <#
.SYNOPSIS
    Update operator
.DESCRIPTION
    Update an operator by id
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

.PARAMETER TasksToAdd
    All of the tasks that you want to grant the operator

    .PARAMETER TasksToRemove
    All of the tasks that you wish to revoke from the operator

.EXAMPLE
    PS C:\> Set-TdOperator -id $operator.id -password (read-host -assecurestring)
    Update the password for the operator stored in the $operator variable
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdOperator')]

    param
    (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName
        )]
        [Alias('id')]
        $Operator,

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
        $TasksToAdd,

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
        $TasksToRemove
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator"
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
            TaskstoAdd {
                foreach ($t in $TaskstoAdd) {
                    $body | Add-Member -MemberType NoteProperty -Name $t -Value 'true'
                }
            }
            TaskstoRemove {
                foreach ($t in $TaskstoRemove) {
                    $body | Add-Member -MemberType NoteProperty -Name $t -Value 'false'
                }
            }
        }

        if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending Body: $($Body | Out-String)")) {
            return
        }
        $methodParams = @{
            Uri = $uri
            Body = ($body | ConvertTo-Json)
            Method = 'PATCH'
        }
        $res = Invoke-TdMethod @methodParams
        $res


    }

}
