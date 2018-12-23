---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdOperatorGroup

## SYNOPSIS
Returns operator groups

## SYNTAX

### List (Default)
```
Get-TdOperatorGroup [[-Name] <String>] [-ResultSize <Int32>] [-Archived] [-Start <Int32>] [<CommonParameters>]
```

### Operator
```
Get-TdOperatorGroup [-Operator <Object>] [<CommonParameters>]
```

## DESCRIPTION
returns list of operator groups or groups for a provided operator.

## EXAMPLES

### EXAMPLE 1
```
Get-TdOperatorGroup -resultsize 1000
```

returns up to 1000 operator groups.

## PARAMETERS

### -Name
Retrieve only operator groups with name starting with this.

```yaml
Type: String
Parameter Sets: List
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Operator
Id of the operator that you want to return operator groups for.

```yaml
Type: Object
Parameter Sets: Operator
Aliases: id

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ResultSize
The number of results that you want returned.

```yaml
Type: Int32
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Archived
Specify whether you want archived operator groups included

```yaml
Type: SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start
The offset at which to start listing the operator groups at.
Must be greater or equal to 0, default is 0

```yaml
Type: Int32
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 0
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
