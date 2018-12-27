---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdOperatorOperatorGroup

## SYNOPSIS
Link and unlink operator groups from an operator

## SYNTAX

### Link
```
Set-TdOperatorOperatorGroup -Operator <Object> [-Link <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Unlink
```
Set-TdOperatorOperatorGroup -Operator <Object> [-Unlink <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
link and unlink operator groups from an operator

## EXAMPLES

### EXAMPLE 1
```
Get-TdOperator 'Test User' | Set-TdOperatorOperatorGroup -Link (Get-TdOperatorGroup 'Group1').id
```

Link the group1 operatorgroup to Test User

## PARAMETERS

### -Operator
Id of the operator that you want to link/unlink operator groups from

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

### -Link
ids of groups that you want to link

```yaml
Type: String[]
Parameter Sets: Link
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unlink
ids of groups that you want to unlink

```yaml
Type: String[]
Parameter Sets: Unlink
Aliases:

Required: False
Position: Named
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
