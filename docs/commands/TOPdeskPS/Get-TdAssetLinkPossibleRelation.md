---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdAssetLinkPossibleRelation

## SYNOPSIS
Returns possible relations between source and target asset.

## SYNTAX

```
Get-TdAssetLinkPossibleRelation [-AssetId] <String> [-TargetAssetId] <String> [<CommonParameters>]
```

## DESCRIPTION
This API returns the available relationship types (child, parent and available capability ids) for two assets (sourceId, targetId).
 If the specified two assets are already linked in every possible way, then the result will be empty.
 This endpoint is the most beneficial if you use it before creating a new link between two assets.

## EXAMPLES

### EXAMPLE 1
```
Get-TdAssetLinkPossibleRelations -AssetId $assetId -TargetAssetId $targetId
```

Returns all possible relationships between the two assets.

## PARAMETERS

### -AssetId
The ID of the source Asset

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id, sourceId

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TargetAssetId
The ID of the target Asset

```yaml
Type: String
Parameter Sets: (All)
Aliases: targetId

Required: True
Position: 2
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
