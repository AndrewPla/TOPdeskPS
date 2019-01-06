---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdOperatorAvatar

## SYNOPSIS
Returns avatar of operator

## SYNTAX

```
Get-TdOperatorAvatar [-OperatorId] <Object> [<CommonParameters>]
```

## DESCRIPTION
Returns avatar of operator based on the operatorid

## EXAMPLES

### EXAMPLE 1
```
Get-TdOperatorAvatar -OperatorId (Get-TdOperator -TOPdeskLoginName 'User@company.com').id
```

Returns the Avatar for 'User@company.com'

## PARAMETERS

### -OperatorId
ID of the operator.
See Get-TdOperator

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
