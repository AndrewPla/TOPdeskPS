---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdLocation

## SYNOPSIS
returns list of locations

## SYNTAX

```
Get-TdLocation [[-Name] <String>] [-Archived] [<CommonParameters>]
```

## DESCRIPTION
returns list of locations

## EXAMPLES

### EXAMPLE 1
```
Get-TdLocation
```

returns list of locations

### EXAMPLE 2
```
Get-TdLocation location2
```

Returns location2

## PARAMETERS

### -Name
only return locations matching the pattern.
Wildcards accepts

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

### -Archived
Whether to return archived locations or not.

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
