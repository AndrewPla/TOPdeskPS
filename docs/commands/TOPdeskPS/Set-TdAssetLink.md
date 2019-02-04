---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdAssetLink

## SYNOPSIS
Links asset to target asset

## SYNTAX

```
Set-TdAssetLink [-AssetId] <String> [-TargetAssetId] <String> [-Type] <String> [[-CapabilityId] <String>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This API creates a link between two assets.
These links are often referred to as 'relationships'.
When creating a link, you need to specify the two assets you want to link (AssetId, TargetAssetId), and the desired relationship between them.
To get the available types of relationship between the two assets, use Get-TdAssetLinkPossibleRelation

## EXAMPLES

### EXAMPLE 1
```
Set-TdAssetLink -AssetId $AssetId -TargetAssetId $TargetId
```

Links $assetId to $targetId using

## PARAMETERS

### -AssetId
The id of the asset to be the source of the link.
For a child relation, this will be the parent, for a parent relation, this will be the child.
For capabilities, this asset will provide the capability.

```yaml
Type: String
Parameter Sets: (All)
Aliases: id, SourceId

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetAssetId
The id of the asset to be the target of the link.
For a child relation, this will be the child, for a parent relation, this will be the parent.
For capabilities, this asset will use the capability.

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

### -Type
Defines the direction of the relation.
'child' means the 'target' is the child of the 'source'.
'child' is the default value.
Ignored if a CapabilityId is present.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: Child
Accept pipeline input: False
Accept wildcard characters: False
```

### -CapabilityId
The id of the capability that is offered through the link.
Don't specify it for parent-child relation

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
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
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

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
