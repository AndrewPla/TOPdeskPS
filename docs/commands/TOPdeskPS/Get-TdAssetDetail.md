---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdAssetDetail

## SYNOPSIS
Returns additional information about assets

## SYNTAX

```
Get-TdAssetDetail [-AssetId] <String> [<CommonParameters>]
```

## DESCRIPTION
Get more information about Assets retrieved with Get-TdAsset

## EXAMPLES

### EXAMPLE 1
```
Get-TdAsset | Get-TdAssetDetail
```

Returns details for assets returned with Get-TdAsset

## PARAMETERS

### -AssetId
Id of the asset that you want more details about

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
See https://developers.topdesk.com/explorer/?page=assets#/Assets/getAssets for more information.

## RELATED LINKS
