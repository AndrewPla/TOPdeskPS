---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdAssetAssignment

## SYNOPSIS
Gets assignments for an asset

## SYNTAX

```
Get-TdAssetAssignment [-AssetId] <String> [<CommonParameters>]
```

## DESCRIPTION
This API returns a list of assigned location, branches, persons and person groups of a specific asset.

## EXAMPLES

### EXAMPLE 1
```
Get-TdAssetAssignment -AssetId $AssetId
```

Returns assignments for $AssetId

## PARAMETERS

### -AssetId
Id of the asset to return asset links for.

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
