---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdOperatorGroupMember

## SYNOPSIS
get the operators of an operator group

## SYNTAX

```
Get-TdOperatorGroupMember [-OperatorGroup] <String> [<CommonParameters>]
```

## DESCRIPTION
returns the members of an operator group

## EXAMPLES

### EXAMPLE 1
```
Get-TdOperatorGroup TechSupport | Get-TdOperatorGroupMember
```

Return members of the TechSupport operator group

## PARAMETERS

### -OperatorGroup
Id of the operator group that you want members for

```yaml
Type: String
Parameter Sets: (All)
Aliases: id

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
