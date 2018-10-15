---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# New-TdChangeAction

## SYNOPSIS
Creates a new action for a change

## SYNTAX

```
New-TdChangeAction [[-ChangeId] <String>] [[-MemoText] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Create a simple change action for a change.
Rich text is not supported.

## EXAMPLES

### EXAMPLE 1
```
<example usage>
```

Explanation of what the example does

## PARAMETERS

### -ChangeId
The UNID of the change.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MemoText
The text of this progress trail entry, if it is of type 'memo'.
May not contain only whitespace characters (Spaces, New Lines, Tabs) and may not be empty.
Rich text is not supported when using this object to create a new progress trail entry.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
