---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdDepartment

## SYNOPSIS
returns list of departments

## SYNTAX

```
Get-TdDepartment [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
returns list of departments

## EXAMPLES

### EXAMPLE 1
```
Get-TdDepartment
```

returns list of departments

### EXAMPLE 2
```
Get-TdDepartment 'IT'
```

Returns the IT department

## PARAMETERS

### -Name
Filter based on the name.
Wildcards accepted.

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
