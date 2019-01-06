function Set-TdPerson {
    <#
    .SYNOPSIS
        Modify properties on a person
    .DESCRIPTION
        Creates new persons in TOPdesk. Logged in operator must have:
        Write permissions on persons; Branch filters apply
        Login data write permissions to set login name and password
    .PARAMETER PersonId
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
        PS C:\> Set-TdPerson -LastName 'Doe' -BranchId (Get-TdBranch -Name 'Los Angeles').id
        Updates the Lastname and Branch
    .EXAMPLE
        PS C:\> New-TdPerson -LastName 'Doe' -FirstName 'John' -NetworkLoginName 'john.doe@company.com' -BranchId (Get-TdBranch -Name 'Los Angeles').id
        This creates a user with serveral properties and uses Get-TdBranch to get the branch id.
        #>
    [CmdletBinding(DefaultParameterSetName = 'BranchName',
        SupportsShouldProcess = $true,
        HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Set-TdPerson')]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('Id')]
        [string]$PersonId,

        [Alias('LastName')]
        [string]$Surname,

        [string]$BranchId,
        [string]$FirstName,
        [string]$FirstInitials,
        [string]$Prefixes,
        [string]$Gender = 'UNDEFINED',
        [string]$EmployeeNumber,
        [string]$NetworkLoginName,
        [string]$LocationId,
        [string]$DepartmentId,
        [string]$DepartmentFree,
        [string]$TasLoginName,
        [securestring]$Password,
        [string]$PhoneNumber,
        [string]$MobileNumber,
        [string]$Fax,

        [alias('EmailAddress')]
        [string]$Email,

        [string]$JobTitle,
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
        [string]$ManagerId,
        [string]$BudgetholderID

    )

    process {

        $uri = (Get-TdUrl) + "/tas/api/persons/id/$Id"
        Write-PSFMessage "uri -$uri" -Level InternalComment


        $body = [PSCustomObject]@{}
        switch ($PSBoundParameters.Keys) {
            Surname {
                $Body | Add-Member -MemberType NoteProperty -Name 'surName' -Value $Surname
            }
            FirstName {
                $Body | Add-Member -MemberType NoteProperty -Name 'firstName' -Value $FirstName
            }
            FirstInitials {
                $Body | Add-Member -MemberType NoteProperty -Name 'firstInitials' -Value $FirstInitials
            }
            Prefixes {
                $Body | Add-Member -MemberType NoteProperty -Name prefixes -Value $Prefixes
            }
            Gender {
                $Body | Add-Member -MemberType NoteProperty -Name 'gender' -Value $Gender
            }
            EmployeeNumber {
                $Body | Add-Member -MemberType NoteProperty -Name 'employeeNumber' -Value $EmployeeNumber
            }
            NetworkLoginName {
                $Body | Add-Member -MemberType NoteProperty -Name 'networkLoginName' -Value $NetworkLoginName
            }
            DepartmentFree {
                $Body | Add-Member -MemberType NoteProperty -Name 'departmentFree' -Value $DepartmentFree
            }
            TasLoginName {
                $Body | Add-Member -MemberType NoteProperty -Name 'tasLoginName' -Value $TasLoginName
            }
            Password {
                $cred = New-Object pscredential ('user', $Password)
                $Body | Add-Member -MemberType NoteProperty -Name 'password' -Value $cred.getnetworkcredential().password
            }
            PhoneNumber {
                $Body | Add-Member -MemberType NoteProperty -Name 'phoneNumber' -Value $PhoneNumber
            }
            MobileNumber {
                $Body | Add-Member -MemberType NoteProperty -Name 'mobileNumber' -Value $MobileNumber
            }
            Fax {
                $Body | Add-Member -MemberType NoteProperty -Name 'fax' -Value $Fax
            }
            Email {
                $Body | Add-Member -MemberType NoteProperty -Name 'email' -Value $Email
            }
            JobTitle {
                $Body | Add-Member -MemberType NoteProperty -Name 'jobTitle' -Value $JobTitle
            }
            showBudgetholder {
                $Body | Add-Member -MemberType NoteProperty -Name 'showBudgetholder' -Value $showBudgetholder.ToString().ToLower()
            }
            showDepartment {
                $Body | Add-Member -MemberType NoteProperty -Name 'showDepartment' -Value $showDepartment.ToString().ToLower()
            }
            showSubsidiaries {
                $Body | Add-Member -MemberType NoteProperty -Name 'showSubsidiaries' -Value $showSubsidiaries.ToString().ToLower()
            }
            authorizeAll {
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeAll' -Value $authorizeAll.ToString().ToLower()
            }
            authorizeDepartment {
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeDepartment' -Value $authorizeDepartment.ToString().ToLower()
            }
            authorizeBudgetholder {
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeBudgetholder' -Value $authorizeBudgetholder.ToString().ToLower()
            }
            authorizeBranch {
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeBranch' -Value $authorizeBranch.ToString().ToLower()
            }
            authorizeSubsidiaryBranches {
                $Body | Add-Member -MemberType NoteProperty -Name 'authorizeSubsidiaryBranches' -Value $authorizeSubsidiaryBranches.ToString().ToLower()
            }
            isManager {
                $Body | Add-Member -MemberType NoteProperty -Name 'isManager' -Value $isManager.ToString().ToLower()
            }

            BranchId {
                $branchIdObject = @{
                    id = $BranchId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'branch' -Value $branchIdObject
            }

            managerId {
                $managerIdObject = @{
                    id = $managerId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'manager' -Value $managerIdObject
            }
            budgetHolderId {
                $budgetHolderIdObject = @{
                    id = $budgetHolderId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'budgetHolder' -Value $budgetHolderIdObject
            }

            locationId {
                $locationIdObject = @{
                    id = $locationId
                }
                $Body | Add-Member -MemberType NoteProperty -Name 'locationId' -Value $locationIdObject
            }

            departmentId {
                $departmentIdObject = @{
                    id = $departmentId
                }
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


}
