---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdPerson

## SYNOPSIS
Modify properties on a person

## SYNTAX

```
Set-TdPerson [-PersonId] <String> [[-Surname] <String>] [[-BranchId] <String>] [[-FirstName] <String>]
 [[-FirstInitials] <String>] [[-Prefixes] <String>] [[-Gender] <String>] [[-EmployeeNumber] <String>]
 [[-NetworkLoginName] <String>] [[-LocationId] <String>] [[-DepartmentId] <String>]
 [[-DepartmentFree] <String>] [[-TasLoginName] <String>] [[-Password] <SecureString>] [[-PhoneNumber] <String>]
 [[-MobileNumber] <String>] [[-Fax] <String>] [[-Email] <String>] [[-JobTitle] <String>] [-ShowBudgetholder]
 [-ShowDepartment] [-ShowBranch] [-ShowSubsidiaries] [-AuthorizeAll] [-AuthorizeDepartment]
 [-AuthorizeBudgetHolder] [-AuthorizeBranch] [-AuthorizeSubsidiaryBranches] [-IsManager]
 [[-ManagerId] <String>] [[-BudgetholderID] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Creates new persons in TOPdesk.
Logged in operator must have:
Write permissions on persons; Branch filters apply
Login data write permissions to set login name and password

## EXAMPLES

### EXAMPLE 1
```
Set-TdPerson -LastName 'Doe' -BranchId (Get-TdBranch -Name 'Los Angeles').id
```

Updates the Lastname and Branch

### EXAMPLE 2
```
New-TdPerson -LastName 'Doe' -FirstName 'John' -NetworkLoginName 'john.doe@company.com' -BranchId (Get-TdBranch -Name 'Los Angeles').id
```

This creates a user with serveral properties and uses Get-TdBranch to get the branch id.

## PARAMETERS

### -PersonId
The Id of the person you are interacting with.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Surname
Surname of the person

```yaml
Type: String
Parameter Sets: (All)
Aliases: LastName

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BranchId
Id of the person's branch.
This is mandatory.
See examples for mobileNumber

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstName
Firstname of the person

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstInitials
Firstinitials of the person

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Prefixes
Prefixes of the person

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Gender
Gender of the user.
default value is 'UNDEFINED'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: UNDEFINED
Accept pipeline input: False
Accept wildcard characters: False
```

### -EmployeeNumber
EmployeeNumber of the user

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NetworkLoginName
NetworkLoginName for the user

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LocationId
LocationId of the person

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DepartmentId
The Id of the person's department

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DepartmentFree
Department text-field (has to be used when "Modules Settings \> Supporting Files \> Department(person) \> Plain text field" is set)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TasLoginName
Login name, operator requires permission "Settings \> Login Settings"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password, operator requires permission "Settings \> Login Settings".
Is mandatory when "Functional Settings \> Login Settings \> Self Service Portal \> Password mandatory on Person card" is set.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PhoneNumber
PhoneNumber of the person

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MobileNumber
MobileNumber of the person

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Fax
Fax of the person

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
Email address of the user.

```yaml
Type: String
Parameter Sets: (All)
Aliases: EmailAddress

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -JobTitle
Job title of the person

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowBudgetholder
Person can see requests with the same budget holder

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowDepartment
Person can see requests with the same department

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowBranch
Person can see requests with the same branch

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowSubsidiaries
Person can see requests with subsidiary branches (showBranches has to be true as well)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthorizeAll
Person Person can authorize requests with the same department, budget holder, branch or subsidiary branch (only works when the person is a manager)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthorizeDepartment
Person can authorize requests from the same department (only works when the person is a manager)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthorizeBudgetHolder
Person can authorize requests with the same budget holder (only works when the person is a manager)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthorizeBranch
Person can authorize requests from the same branch (only works when the person is a manager)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthorizeSubsidiaryBranches
Person can authorize requests from the subsidiary branches (only works when the person is a manager and authorizeBranch is true)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsManager
Specify if the person is a manager

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ManagerId
Id of the person's manager.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BudgetholderID
The Id of the person's budgetholder

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
