---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdOperatorOperatorFilter

## SYNOPSIS
Link and unlink Operator filters from an operator

## SYNTAX

### Link
```
Set-TdOperatorOperatorFilter -Operator <Object> [-Link <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Unlink
```
Set-TdOperatorOperatorFilter -Operator <Object> [-Unlink <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Link and unlink Operator filters from an operator

## EXAMPLES

### EXAMPLE 1
```
Get-TdOperator -name 'John Smith' | Set-TdOperatorOperatorFilter -link (Get-TdOperatorFilter -name 'OperatorFilter1').id
```

Links John Smith to the OperatorFilter1 Operator filter

## PARAMETERS

### -Operator
Id of the operator that you want to link/unlink filters from

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
Ids of the filters that you want to link to the operator

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
Ids of the filters that you want to unlink from the operator

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
