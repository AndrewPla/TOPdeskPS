---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdChangeProcessingStatus

## SYNOPSIS
process a change through a phase

## SYNTAX

```
Set-TdChangeProcessingStatus [-ChangeId] <Object> [-From] <Object> [-Action] <Object> [[-Reason] <String>]
 [[-Comment] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
process a change through a phase

## EXAMPLES

### EXAMPLE 1
```
Get-TdChangeDetail -ChangeNumber 'C1810-005' | Get-TdChangeProcessingStatus -action 'no_go'
```

changes the status of specified change to specfied action

## PARAMETERS

### -ChangeId
ID of the Change.
See Get-TdChange

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -From
original status of change

```yaml
Type: Object
Parameter Sets: (All)
Aliases: processingStatus

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Action
Action to implement on the change

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Reason
reason for the change

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

### -Comment
additional comment

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
