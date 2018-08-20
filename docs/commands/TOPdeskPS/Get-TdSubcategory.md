---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdSubcategory

## SYNOPSIS
Get subcategories from TOPdesk

## SYNTAX

```
Get-TdSubcategory [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets either one subcategory or a list of subcategories from TOPdesk.

## EXAMPLES

### EXAMPLE 1
```
Get-TdSubcategory
```

Gets a list of all subcategories

### EXAMPLE 2
```
Get-TdSubcategory -Name 'Applications'
```

Gets the Subcategory with the name 'Applications'

## PARAMETERS

### -Name
This is the name of the subcategory that you want.
This can be useful if you want to pass a subcategory id to a different command.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
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
