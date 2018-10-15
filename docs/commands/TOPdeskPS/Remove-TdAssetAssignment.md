---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Remove-TdAssetAssignment

## SYNOPSIS
Remove an assignment from an asset.

## SYNTAX

```
Remove-TdAssetAssignment [-LinkId] <Object> [-AssetId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This API removes an assigned branch, location, person or person group from an asset.
To unassign something, you need to provide the linkId, which you can retrieve with Get-TdAssetAssignment.

## EXAMPLES

### EXAMPLE 1
```
Remove-TdAssetAssignment -AssetId $assetId -LinkId $linkId
```

Removes the asset assignemt link $linkId for $assetId

## PARAMETERS

### -LinkId
The Id of the relation.
You can get this by using Get-TdAssetLink

```yaml
Type: Object
Parameter Sets: (All)
Aliases: locations

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AssetId
Id of the asset to update

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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
