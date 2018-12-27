---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdOperatorGroup

## SYNOPSIS
Updates operator groups

## SYNTAX

### Update
```
Set-TdOperatorGroup [-Branch <Object>] [-GroupName <String>] [-Contact <Hashtable>] -OperatorGroup <String>
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Archive
```
Set-TdOperatorGroup -OperatorGroup <String> [-Archive] [-ArchiveReason <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### UnaArchive
```
Set-TdOperatorGroup -OperatorGroup <String> [-UnArchive] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Updates a provided operator group.
Requires write permission on operator groups.
Can also be used to Archive/Unarchive operator groups.

## EXAMPLES

### EXAMPLE 1
```
Get-TdOperatorGroup 'TechSupport' | Set-TdOperatorGroup -Groupname 'TechSupport New'
```

Updates the name of the operator group

### EXAMPLE 2
```
Get-TdOperatorGroup 'HR' | Set-TdOperatorGroup -Contact @{telephone = '123-456-7890'; email = 'test@testing.com'}
```

Updates the contact email and telephone.

### EXAMPLE 3
```
Get-TdOperatorGroup 'TechSupport' | Set-TdOperatorGroup -Archive -ArchiveReason (Get-TdArchiveReason 'No Longer Val*').id
```

Archives the operator group and applies the archive reason 'No longer valid'

### EXAMPLE 4
```
Get-TdOperatorGroup 'TechSupport' -Archived | Set-TdOperatorGroup -UnArchive
```

UnArchive the operator group.
Note that we had to specify -Archived on Get-TdOperatorGroup

## PARAMETERS

### -Branch
Id of the branch that is assigned to the operator group

```yaml
Type: Object
Parameter Sets: Update
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupName
Operator Group Name

```yaml
Type: String
Parameter Sets: Update
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Contact
Hashtable containing the values that you want to set.
valid properties are telephone, faxNumber, and email.

```yaml
Type: Hashtable
Parameter Sets: Update
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OperatorGroup
Id of the operator group to modify

```yaml
Type: String
Parameter Sets: (All)
Aliases: id

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Archive
Specify if you want to archive an operator group

```yaml
Type: SwitchParameter
Parameter Sets: Archive
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ArchiveReason
The archiving reason id.
Mandatory when no default reason is set.

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

### -UnArchive
Specify when you want to bring an operator group from being archived

```yaml
Type: SwitchParameter
Parameter Sets: UnaArchive
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
