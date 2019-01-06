---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# New-TdOperatorGroup

## SYNOPSIS
Create an operator group

## SYNTAX

```
New-TdOperatorGroup [-Branch] <String> [-GroupName] <String> [[-Contact] <Hashtable>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Create an operator group

## EXAMPLES

### EXAMPLE 1
```
New-TdOperatorGroup -Branch (Get-TdBranch 'Miami').id -GroupName 'Miami Group'
```

Creates a new operator group named 'Miami Group' that is attached ot the Miami branch

## PARAMETERS

### -Branch
Id of the branch that is assigned to the operator group

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupName
Operator Group Name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Contact
Hashtable containing the values that you want to set.
valid properties are telephone, faxNumber, and email.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
