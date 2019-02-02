---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdAsset

## SYNOPSIS
Returns TOPdesk assets

## SYNTAX

### List (Default)
```
Get-TdAsset [-Archived] [-Field <String[]>] [<CommonParameters>]
```

### Standard Query
```
Get-TdAsset [-NameFragment <String>] [-Archived] [-ShowAssignments] [-TemplateName <String>]
 [-Field <String[]>] [<CommonParameters>]
```

### Template Query
```
Get-TdAsset [-Archived] -TemplateId <Object> [-Field <String[]>] [<CommonParameters>]
```

## DESCRIPTION
This API returns a list of assets.
By default the following fields are included: id, name (text), etag and state (archived).
 You can use various parameters to filter this list or to retrieve other fields from the assets.
In Asset Management, paging is missing deliberately.
 To return all assets for a given template please use the TemplateId parameter.
You can also specify the fields that you would like returned when performing a template query.

## EXAMPLES

### EXAMPLE 1
```
Get-TdAsset
```

Get all topdesk assets

## PARAMETERS

### -NameFragment
To filter assets by their name-fragment use this parameter.
It's case-insensitive.

```yaml
Type: String
Parameter Sets: Standard Query
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Archived
Whether to show archived assets.
if performing a standard query it will return all, if performing a Tempalte query it will only return active assets.

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

### -ShowAssignments
When it's given it returns more meta information, including all person and location related assignments.
See '/assignments' endpoint documentation for more details about the response format.

```yaml
Type: SwitchParameter
Parameter Sets: Standard Query
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -TemplateName
To filter assets by a specific template's name (case sensitive).

```yaml
Type: String
Parameter Sets: Standard Query
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TemplateId
Id of the template specifying the type of assets to return.
see Get-Tdtemplate to retrieve the id.

```yaml
Type: Object
Parameter Sets: Template Query
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Field
Which asset fields to include in the response.
If not specified, only the id and name will be included.
Fields should be referenced by their field id, not their display name.
See Get-tdAssetField

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Name
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
