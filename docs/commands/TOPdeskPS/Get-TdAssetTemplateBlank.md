---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdAssetTemplateBlank

## SYNOPSIS
Returns blank asset cards

## SYNTAX

```
Get-TdAssetTemplateBlank [-TemplateName] <String> [<CommonParameters>]
```

## DESCRIPTION
This API returns a blank asset card based on a specific template.
You can add the id or name of the specific template as a parameter to the endpoint (templateid / templateName).
The result will show all the fields on the card, and their properties.
You can use this endpoint to see the mandatory fields of the asset, and with that, create new assets of that type. 
.PARAMETER NameFragment
To filter assets by their name-fragment use this parameter.
It's case-insensitive.

## EXAMPLES

### EXAMPLE 1
```
Get-TdAssetTemplateBlank -TemplateName 'Network Device'
```

Returns all fields on the card for the template specified.

## PARAMETERS

### -TemplateName
Name of the templateid

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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
