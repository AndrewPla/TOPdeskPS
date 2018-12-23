---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdOperator

## SYNOPSIS
Update operator

## SYNTAX

### Modify
```
Set-TdOperator -Operator <Object> [-SurName <Object>] [-FirstName <String>] [-Gender <String>]
 [-EmployeeNumber <String>] [-Telephone <String>] [-MobileNumber <String>] [-NetworkLoginName <String>]
 [-Email <String>] [-Branch <String>] [-Location <String>] [-Department <String>] [-BudgetHolder <String>]
 [-LoginPermission] [-LoginName <String>] [-Password <SecureString>] [-TasksToAdd <String[]>]
 [-TasksToRemove <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Archive
```
Set-TdOperator -Operator <Object> [-ArchiveReason <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Unarchive
```
Set-TdOperator -Operator <Object> [-Unarchive] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Update an operator by id

## EXAMPLES

### EXAMPLE 1
```
Set-TdOperator -id $operator.id -password (read-host -assecurestring)
```

Update the password for the operator stored in the $operator variable

## PARAMETERS

### -Operator
Id of the operator that you want to edit

```yaml
Type: Object
Parameter Sets: (All)
Aliases: id

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SurName
Surname of the operator

```yaml
Type: Object
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstName
Firstname of the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Gender
The gender of the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EmployeeNumber
The employee number of the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Telephone
The telephone number for the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MobileNumber
Mobile number for the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NetworkLoginName
The network login name for the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
Email address of the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Branch
The id of the branch that you want to give the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Location
Location id of the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Department
The department id of the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BudgetHolder
The budget holder id of the operator

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LoginPermission
specify whether the operator has the permission to log on

```yaml
Type: SwitchParameter
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LoginName
Login name, operator requires permission "Settings \> Login Settings"
Is mandatory when loginPermission is set to true.

```yaml
Type: String
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password, operator requires permission "Settings \> Login Settings".
Is mandatory when "Functional Settings \> Login Settings \> Operator's Section \> Password mandatory on Operator card" is set.

```yaml
Type: SecureString
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TasksToAdd
All of the tasks that you want to grant the operator

```yaml
Type: String[]
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TasksToRemove
All of the tasks that you wish to revoke from the operator

```yaml
Type: String[]
Parameter Sets: Modify
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ArchiveReason
specify an archiving reason ID to archive the operator.

```yaml
Type: String
Parameter Sets: Archive
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unarchive
Specify if you want to unarchive an operator.

```yaml
Type: SwitchParameter
Parameter Sets: Unarchive
Aliases:

Required: False
Position: Named
Default value: False
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
