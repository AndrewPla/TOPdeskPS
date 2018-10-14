---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdAssetTemplate

## SYNOPSIS
Gets Asset Templates

## SYNTAX

```
Get-TdAssetTemplate [[-Name] <String>] [-Archived] [<CommonParameters>]
```

## DESCRIPTION
This API returns the list of available templates/asset types with their IDs.
You will need the ID when creating a new asset for that type or when filtering the list of assets on asset type.

## EXAMPLES

### EXAMPLE 1
```
Get-TdAssetTemplate -Name 'Work*'
```

Returns all templates with a name matching 'work*'.
In this instance it would return a 'Workstation' template.

## PARAMETERS

### -Name
Name of the AssetTemplate that you want returned.
Wildcards are supported.
Default value is '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Archived
Whether to retrieve archived asset templates. 
Leave out for all, or specify true/false for only archived, or only active templates, respectively.

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
