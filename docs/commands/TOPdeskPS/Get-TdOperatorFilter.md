---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdOperatorFilter

## SYNOPSIS
Get list of Operator filters

## SYNTAX

```
Get-TdOperatorFilter [[-Name] <String>] [-Operator <Object>] [<CommonParameters>]
```

## DESCRIPTION
Get list of Operator filters or return the Operator filters for a provided user

## EXAMPLES

### EXAMPLE 1
```
Get-TdOperatorFilter
```

Gets list of Operator filters

### EXAMPLE 2
```
Get-TdOperator 'Johnny.cash' | Get-TdOperatorFilter
```

Returns operator filters for the operator 'johnny.cash'

### EXAMPLE 3
```
Get-TdOperatorFilter 'Test*'
```

Returns all operator filterns with a name starting with test

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

### -Operator
ID of the Operator.
See Get-TdOperator

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Id

Required: False
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
