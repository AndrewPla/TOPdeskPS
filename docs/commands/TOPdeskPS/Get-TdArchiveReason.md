---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdArchiveReason

## SYNOPSIS
Gets archive reasons

## SYNTAX

```
Get-TdArchiveReason [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Can get all archive reasons, or specify which one you want by a Name lookup.

## EXAMPLES

### EXAMPLE 1
```
Get-TDArchiveReason -Name 'No longer employed'
```

Gets the archive reason with the name 'no longer employed'

## PARAMETERS

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
