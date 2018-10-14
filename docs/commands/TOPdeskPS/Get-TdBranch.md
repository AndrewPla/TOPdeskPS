---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdBranch

## SYNOPSIS
Gets Branches

## SYNTAX

```
Get-TdBranch [-Archived] [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets Branches

## EXAMPLES

### EXAMPLE 1
```
Get-TdBranch
```

Gets Branch

## PARAMETERS

### -Archived
Whether to retrieve archived incidents

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

### -Name
Name of the branch that you want returned.Wildcards are supported.
Default value is '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
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
