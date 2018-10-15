---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdAssetFieldValue

## SYNOPSIS
Returns Asset field values

## SYNTAX

```
Get-TdAssetFieldValue [-FieldId] <String> [<CommonParameters>]
```

## DESCRIPTION
Lists asset fields

## EXAMPLES

### EXAMPLE 1
```
Get-TdAssetField | Get-TdAssetFieldValue
```

Returns asset fieldvalues for all Asset fields.

## PARAMETERS

### -FieldId
Id of the field that you want the value for.
See Get-TdAssetField

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
