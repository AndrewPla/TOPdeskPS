function Set-TdOperator {
    <#
.SYNOPSIS
    Update operators
.DESCRIPTION
    Update an operator by id. You can update the various properties of an operator. You can also archive an operator if you provide an archive. Same thing goes for Unarchiving a user. Due to api limitiations Archive/Unarchive requests may not be combined with updates to other properties of a user. They must be sent in seperate requests.

.PARAMETER Operator
Id of the operator that you want to edit

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

.PARAMETER ArchiveReason
        Id of the archive reason that will be used to archive the operator. See Get-TdArchiveReason
.PARAMETER Unarchive
        Specify if you want to unarchive an operator.

.PARAMETER Confirm
    If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

.PARAMETER WhatIf
    If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

.EXAMPLE
    PS> Get-TdOperator -TOPdeskLoginName 'first.last' | Set-TdOperator -Surname 'UpdatedSurname'

    Updates the surname of the first.last operator.

.EXAMPLE
    PS> Set-TdOperator -id $operator.id -password (read-host -assecurestring) -Login

    Update the password for the operator stored in the $operator variable

.EXAMPLE
    PS> Get-TdOperator -TOPdeskLoginName 'first.last' | Set-TdOperator -ArchiveReason (Get-TdArchiveReason 'no longer employed').id -LoginPermission:$false

.EXAMPLE
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdOperator',
        SupportsShouldProcess = $true)]

    param
    (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName
        )]
        [Alias('id')]
        $Operator,

        [Parameter(ParameterSetName = 'Modify')]
        [ValidateLength(0, 50)]
        $SurName,

        [Parameter(ParameterSetName = 'Modify')]
        [ValidateLength(0, 30)]
        [string]
        $FirstName,

        [Parameter(ParameterSetName = 'Modify')]
        [ValidateSet('UNDEFINED', 'MALE', 'FEMALE')]
        [string]
        $Gender,

        [Parameter(ParameterSetName = 'Modify')]
        [ValidateLength(0, 20)]
        [string]
        $EmployeeNumber,

        [Parameter(ParameterSetName = 'Modify')]
        [ValidateLength(0, 25)]
        [string]
        $Telephone,

        [Parameter(ParameterSetName = 'Modify')]
        [ValidateLength(0, 25)]
        [string]
        $MobileNumber,

        [Parameter(ParameterSetName = 'Modify')]
        [ValidateLength(0, 100)]
        [string]
        $NetworkLoginName,

        [Parameter(ParameterSetName = 'Modify')]
        [ValidateLength(0, 100)]
        [string]
        $Email,

        [Parameter(ParameterSetName = 'Modify')]
        [string]
        $Branch,

        [Parameter(ParameterSetName = 'Modify')]
        [string]
        $Location,

        [Parameter(ParameterSetName = 'Modify')]
        [string]
        $Department,

        [Parameter(ParameterSetName = 'Modify')]
        [string]
        $BudgetHolder,

        [Parameter(ParameterSetName = 'Modify')]
        [switch]
        $LoginPermission,

        [Parameter(ParameterSetName = 'Modify')]
        [ValidateLength(0, 100)]
        [string]
        $LoginName,

        [Parameter(ParameterSetName = 'Modify')]
        [securestring]
        $Password,

        [Parameter(ParameterSetName = 'Modify')]
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

        [Parameter(ParameterSetName = 'Modify')]
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
        $TasksToRemove,

        [Parameter(ParameterSetName = 'Archive')]
        [string]
        $ArchiveReason,

        [Parameter(ParameterSetName = 'Unarchive')]
        [switch]
        $Unarchive
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level InternalComment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level InternalComment

        $body = [PSCustomObject]@{}
        $memberParams = @{ Membertype = 'Noteproperty'; InputObject = $body}

        Switch ($PsCmdlet.ParameterSetName) {

            Archive {
                $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/archive"

                $memberParams['name'] = 'id'
                $memberParams['value'] = $ArchiveReason
                Add-member @memberParams
                $methodParams = @{
                    Uri = $uri
                    Body = ($body | ConvertTo-Json)
                    Method = 'PATCH'
                }
                if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending Body: $($Body | Out-String)")) {
                    return
                }
                $res = Invoke-TdMethod @methodParams
                $res
            }

            Unarchive {
                $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator/unarchive"
                $methodParams = @{
                    Uri = $uri
                    Body = ($body | ConvertTo-Json)
                    Method = 'PATCH'
                }
                if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending Body: $($Body | Out-String)")) {
                    return
                }
                $res = Invoke-TdMethod @methodParams
                $res
            }

            Modify {
                $uri = "$(Get-TdUrl)/tas/api/operators/id/$Operator"
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

                $methodParams = @{
                    Uri = $uri
                    Body = ($body | ConvertTo-Json)
                    Method = 'PATCH'
                }
                if (-not (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $uri -Action "Sending Body: $($Body | Out-String)")) {
                    return
                }
                $res = Invoke-TdMethod @methodParams
                $res

            }
        }
    }

}
