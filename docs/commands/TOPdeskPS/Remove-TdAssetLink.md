---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Remove-TdAssetLink

## SYNOPSIS
Remove link between 2 assets.

## SYNTAX

```
Remove-TdAssetLink [-LinkId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Remove link between 2 assets.

## EXAMPLES

### EXAMPLE 1
```
Get-TdAssetLink -AssetId $assetId | Remove-TdAssetLink
```

Removes the asset links for $assetId

## PARAMETERS

### -LinkId
The Id of the relation.
You can get this by using Get-TdAssetLink

```yaml
Type: String
Parameter Sets: (All)
Aliases: relationId

Required: True
Position: 1
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
