---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdChangeDetail

## SYNOPSIS
returns details of a specified change

## SYNTAX

```
Get-TdChangeDetail [-ChangeNumber] <Object> [<CommonParameters>]
```

## DESCRIPTION
returns details of a specified change

## EXAMPLES

### EXAMPLE 1
```
Get-TdChange | Get-TdChangeDetail
```

returns details of all changes

TODO add support for change ID

## PARAMETERS

### -ChangeNumber
Change Number in format CYYMM-XXXX

```yaml
Type: Object
Parameter Sets: (All)
Aliases: number

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
