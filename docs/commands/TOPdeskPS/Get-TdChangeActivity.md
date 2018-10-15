---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdChangeActivity

## SYNOPSIS
Gets change activities

## SYNTAX

```
Get-TdChangeActivity [-Change <String[]>] [-Archived] [<CommonParameters>]
```

## DESCRIPTION
This command returns change activitites.
This returns changes available to the account used with Connect-TdService.

## EXAMPLES

### EXAMPLE 1
```
Get-TdChangeActivity -Change 'C1801-123'
```

Grabs change activitites for C1801-123

## PARAMETERS

### -Change
Id or number of the parent change
This is a repeatable filter parameter

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Archived
Whether to only retrieve archived changes or not.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
