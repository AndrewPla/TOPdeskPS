---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdBranchFilter

## SYNOPSIS
Returns branch filters

## SYNTAX

```
Get-TdBranchFilter [-Name <Object>] -Operator <Object> [<CommonParameters>]
```

## DESCRIPTION
Returns branch filters for a provided operator, or returns a list of all branch filters.

## EXAMPLES

### EXAMPLE 1
```
Get-TdBranchFilter
```

Gets list of branch filters

### EXAMPLE 2
```
Get-TdOperator -name 'Andrew Pla' | Get-TdOperatorBranchFilter
```

Returns branch filters for the provided operator

## PARAMETERS

### -Name
Filter on the name.
Wildcards supported.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Operator
Id of the operator that you want branch filters for

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
