---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdPermissionGroup

## SYNOPSIS
returns list of permission groups

## SYNTAX

```
Get-TdPermissionGroup [[-Name] <String>] [-Operator <String>] [<CommonParameters>]
```

## DESCRIPTION
returns list of permission groups

## EXAMPLES

### EXAMPLE 1
```
Get-TdPermissionGroup
```

returns list of permission groups

### EXAMPLE 2
```
Get-TdOperator -TOPdeskloginName 'Juanita Smith' | Get-TdPermissionGroup
```

returns permission groups for Juanita Smith

## PARAMETERS

### -Name
Name of the operator group that you want returned.
Wildcards are supported.
Default value is '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases: GroupName

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Operator
Id of the operator that you want to return the permission groups for

```yaml
Type: String
Parameter Sets: (All)
Aliases: id

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
