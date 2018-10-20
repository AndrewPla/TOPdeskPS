---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdSupplierContact

## SYNOPSIS
Gets list of supplier  contacts

## SYNTAX

```
Get-TdSupplierContact [[-SupplierId] <Object>] [[-PageSize] <Int32>] [[-Start] <Int32>] [-Archived]
 [<CommonParameters>]
```

## DESCRIPTION
Returns list of supplier contacts

## EXAMPLES

### EXAMPLE 1
```
Get-TdSuppliercontact
```

Returns list of supplier contacts

### EXAMPLE 2
```
Get-TdSupplier | Get-TdSupplierContact
```

Returns list of

## PARAMETERS

### -SupplierId
{{Fill SupplierId Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Id

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PageSize
The amount of suppliers to be returned per request.
Must be between 1 and 10000, default is 1000.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start
This is the offset at which you want to start listing suppliers at.
The default value is 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Archived
Whether to retrieve archived incidents.

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
