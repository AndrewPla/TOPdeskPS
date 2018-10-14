function Set-TdPerson {
    <#
    .SYNOPSIS
        Modify properties on a person
    .DESCRIPTION
        Creates new persons in TOPdesk. Logged in operator must have:
        Write permissions on persons; Branch filters apply
        Login data write permissions to set login name and password
    .PARAMETER Id
        The Id of the person you are interacting with.
    .PARAMETER Surname
        Surname of the person
    .PARAMETER BranchId
        Id of the person's branch. This is mandatory. See examples for mobileNumber
    .PARAMETER FirstName
        Firstname of the person
    .PARAMETER FirstInitials
        Firstinitials of the person
    .PARAMETER Prefixes
        Prefixes of the person
    .PARAMETER Gender
        Gender of the user. default value is 'UNDEFINED'
    .PARAMETER EmployeeNumber
        EmployeeNumber of the user
    .PARAMETER NetworkLoginName
        NetworkLoginName for the user
    .PARAMETER LocationId
        LocationId of the person
    .PARAMETER DepertmentId
        DepartmentId of the person
    .PARAMETER DepartmentFree
            Department text-field (has to be used when “Modules Settings > Supporting Files > Department(person) > Plain text field” is set)
    .PARAMETER TasLoginName
        Login name, operator requires permission “Settings > Login Settings”
    .PARAMETER Password
        Password, operator requires permission "Settings > Login Settings". Is mandatory when “Functional Settings > Login Settings > Self Service Portal > Password mandatory on Person card” is set.
    .PARAMETER PhoneNumber
        PhoneNumber of the person
    .PARAMETER MobileNumber
        MobileNumber of the person
    .PARAMETER Fax
        Fax of the person
    .PARAMETER Email
        Email address of the user.
    .PARAMETER JobTitle
        Job title of the person
    .PARAMETER showBudgetholder
        Person can see requests with the same budget holder
    .PARAMETER showDepartment
        Person can see requests with the same department
    .PARAMETER ShowBranch
        Person can see requests with the same branch
    .PARAMETER showSubsidiaries
        Person can see requests with subsidiary branches (showBranches has to be true as well)
    .PARAMETER AuthorizeAll
    Person Person can authorize requests with the same department, budget holder, branch or subsidiary branch (only works when the person is a manager)
    .PARAMETER AuthorizeDepartment
    Person can authorize requests from the same department (only works when the person is a manager)
   .PARAMETER AuthorizeBudgetHolder
   Person can authorize requests with the same budget holder (only works when the person is a manager)
   .PARAMETER AuthorizeBranch
        Person can authorize requests from the same branch (only works when the person is a manager)
    .PARAMETER authorizeSubsidiaryBranches
        Person can authorize requests from the subsidiary branches (only works when the person is a manager and authorizeBranch is true)
   .PARAMETER IsManager
        Specify if the person is a manager
    .PARAMETER ManagerId
        Id of the person's manager.
    .PARAMETER BudgetHolderId
        The Id of the person's budgetholder
    .PARAMETER DepartmentId
        The Id of the person's department
    .PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

    .EXAMPLE
        PS C:\> New-TdPerson -LastName 'Doe' -BranchId (Get-TdBranch -Name 'Los Angeles').id
        This is the minimum required to create a person: BranchId and a lastname.
    .EXAMPLE
        PS C:\> New-TdPerson -LastName 'Doe' -FirstName 'John' -NetworkLoginName 'john.doe@company.com' -BranchId (Get-TdBranch -Name 'Los Angeles').id
        This creates a user with serveral properties and uses Get-TdBranch to get the branch id.
        #>
    [CmdletBinding(DefaultParameterSetName = 'BranchName',
        SupportsShouldProcess = $true,
        HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdPerson')]
    param (
        [Parameter(Mandatory)]
        [Alias('PersonId')]
        [system.string]$Id,

        [Alias('LastName')]
        [system.string]$Surname,

        [system.string]$BranchId,
        [system.string]$FirstName,
        [system.string]$FirstInitials,
        [System.string]$Prefixes,
        [system.string]$Gender = 'UNDEFINED',
        [system.string]$EmployeeNumber,
        [system.string]$NetworkLoginName,
        [system.string]$LocationId,
        [system.string]$DepartmentId,
        [system.string]$DepartmentFree,
        [system.string]$TasLoginName,
        [securestring]$Password,
        [system.string]$PhoneNumber,
        [system.string]$MobileNumber,
        [system.string]$Fax,

        [alias('EmailAddress')]
        [system.string]$Email,

        [system.string]$JobTitle,
        [switch]$ShowBudgetholder,
        [switch]$ShowDepartment,
        [switch]$ShowBranch,
        [switch]$ShowSubsidiaries,
        [switch]$AuthorizeAll,
        [switch]$AuthorizeDepartment,
        [switch]$AuthorizeBudgetHolder,
        [switch]$AuthorizeBranch,
        [switch]$AuthorizeSubsidiaryBranches,
        [switch]$IsManager,
        [System.String]$ManagerId,
        [system.string]$BudgetholderID

    )

    begin {
    }

    process {
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] ParameterSetName: $($PsCmdlet.ParameterSetName)"
        Write-PSFMessage -Level InternalComment -Message "[$($MyInvocation.MyCommand.Name)] PSBoundParameters: $($PSBoundParameters | Out-String)"

        $uri = (Get-TdUrl) + "/tas/api/persons/id/$Id"
        Write-PSFMessage "uri -$uri" -Level InternalComment

        Write-PSFMessage "Going through all parameters and generating body" -Level debug
        $body = [PSCustomObject]@{}
        switch ($PSBoundParameters.Keys) {
            Surname {
                Write-PSFMessage -Level InternalComment -Message "Adding Surname to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'surName' -Value $Surname
            }
            FirstName {
                Write-PSFMessage -Level InternalComment -Message "Adding FirstName to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'firstName' -Value $FirstName
            }
            FirstInitials {
                Write-PSFMessage -Level InternalComment -Message "Adding FirstInitials to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'firstInitials' -Value $FirstInitials
            }
            Prefixes {
                Write-PSFMessage -Level InternalComment -Message "Adding Prefixes to Body"
                $Body | Add-Member -MemberType NoteProperty -Name prefixes -Value $Prefixes
            }
            Gender {
                Write-PSFMessage -Level InternalComment -Message "Adding Gender to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'gender' -Value $Gender
            }
            EmployeeNumber {
                Write-PSFMessage -Level InternalComment -Message "Adding EmployeeNumber to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'employeeNumber' -Value $EmployeeNumber
            }
            NetworkLoginName {
                Write-PSFMessage -Level InternalComment -Message "Adding NetworkLoginName to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'networkLoginName' -Value $NetworkLoginName
            }
            DepartmentFree {
                Write-PSFMessage -Level InternalComment -Message "Adding DepartmentFree to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'departmentFree' -Value $DepartmentFree
            }
            TasLoginName {
                Write-PSFMessage -Level InternalComment -Message "Adding TasLoginName to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'tasLoginName' -Value $TasLoginName
            }
            Password {
                Write-PSFMessage -Level InternalComment -Message "Adding Password to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'password' -Value $Password
            }
            PhoneNumber {
                Write-PSFMessage -Level InternalComment -Message "Adding PhoneNumber to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'phoneNumber' -Value $PhoneNumber
            }
            MobileNumber {
                Write-PSFMessage -Level InternalComment -Message "Adding MobileNumber to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'mobileNumber' -Value $MobileNumber
            }
            Fax {
                Write-PSFMessage -Level InternalComment -Message "Adding Fax to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'fax' -Value $Fax
            }
            Email {
                Write-PSFMessage -Level InternalComment -Message "Adding Email to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'email' -Value $Email
            }
            JobTitle {
                Write-PSFMessage -Level InternalComment -Message "Adding JobTitle to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'jobTitle' -Value $JobTitle
            }
            showBudgetholder {
                Write-PSFMessage -Level InternalComment -Message "Adding showBudgetholder to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'showBudgetholder' -Value $showBudgetholder.ToString().ToLower()
            }
            showDepartment {
                Write-PSFMessage -Level InternalComment -Message "Adding showDepartment to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'showDepartment' -Value $showDepartment.ToString().ToLower()
            }
            showSubsidiaries {
                Write-PSFMessage -Level InternalComment -Message "Adding showSubsidiaries to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'showSubsidiaries' -Value $showSubsidiaries.ToString().ToLower()
            }
            authorizeAll {
                Write-PSFMessage -Level InternalComment -Message "Adding authorizeAll to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeAll' -Value $authorizeAll.ToString().ToLower()
            }
            authorizeDepartment {
                Write-PSFMessage -Level InternalComment -Message "Adding authorizeDepartment to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeDepartment' -Value $authorizeDepartment.ToString().ToLower()
            }
            authorizeBudgetholder {
                Write-PSFMessage -Level InternalComment -Message "Adding authorizeBudgetholder to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeBudgetholder' -Value $authorizeBudgetholder.ToString().ToLower()
            }
            authorizeBranch {
                Write-PSFMessage -Level InternalComment -Message "Adding authorizeBranch to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeBranch' -Value $authorizeBranch.ToString().ToLower()
            }
            authorizeSubsidiaryBranches {
                Write-PSFMessage -Level InternalComment -Message "Adding authorizeSubsidiaryBranches to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeSubsidiaryBranches' -Value $authorizeSubsidiaryBranches.ToString().ToLower()
            }
            isManager {
                Write-PSFMessage -Level InternalComment -Message "Adding isManager to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'isManager' -Value $isManager.ToString().ToLower()
            }

            BranchId {
                $branchIdObject = @{
                    id = $BranchId
                }
                Write-PSFMessage -Level InternalComment -Message "Adding branchId to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'branch' -Value $branchIdObject
            }

            managerId {
                $managerIdObject = @{
                    id = $managerId
                }
                Write-PSFMessage -Level InternalComment -Message "Adding budgetHolderId to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'manager' -Value $managerIdObject
            }
            budgetHolderId {
                $budgetHolderIdObject = @{
                    id = $budgetHolderId
                }
                Write-PSFMessage -Level InternalComment -Message "Adding budgetHolderId to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'budgetHolder' -Value $budgetHolderIdObject
            }

            locationId {
                $locationIdObject = @{
                    id = $locationId
                }
                Write-PSFMessage -Level InternalComment -Message "Adding locationId to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'locationId' -Value $locationIdObject
            }

            departmentId {
                $departmentIdObject = @{
                    id = $departmentId
                }
                Write-PSFMessage -Level InternalComment -Message "Adding departmentId to Body"
                $Body | Add-Member -MemberType NoteProperty -Name 'departmentId' -Value $departmentIdObject
            }
        }

       	$Params = @{
            Uri = $uri
            Body = $Body
            Method = 'put'
        }
        if ($PSCmdlet.ShouldProcess("The changes" , "Changing person $id")) {
            Invoke-TdMethod @Params
        }

    }

    end {
    }
}
