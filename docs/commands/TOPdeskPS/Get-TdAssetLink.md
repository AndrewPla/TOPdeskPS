---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdAssetLink

## SYNOPSIS
Returns linked assets

## SYNTAX

```
Get-TdAssetLink [-AssetId] <String> [<CommonParameters>]
```

## DESCRIPTION
This API returns a list of assets that are linked to a specificed asset provided as a parameter (sourceId).
The list will include the following information about the linked assets: the name, id, type and properties of the icon of the asset; the type and id of the link; id and name of the used capability.

## EXAMPLES

### EXAMPLE 1
```
Get-TdAssetLink -AssetId $assetId
```

Returns all linked assets for the $assetId.

## PARAMETERS

### -AssetId
Id of the asset to return asset links for.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id, SourceId

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
