---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Add-TdAssetAssignment

## SYNOPSIS
Adds an assignment to an asset

## SYNTAX

```
Add-TdAssetAssignment -AssetId <String> -LinkType <String> [-LinkToId <String>] [-BranchId <String>]
 [-Body <PSObject>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Updates the given asset.It may be possible that one or more assets couldn't be deleted because they have existing links from other components.
In this case those assets' ids will be listed in the 'failed' list of the response, but it doesn't affect deletion of other assets.

## EXAMPLES

### EXAMPLE 1
```
Add-TdAssetAssignment -AssetId $AssetId
```

Removes all assets with id's inside $assetId.

## PARAMETERS

### -AssetId
ID of asset which is the subject of the assignment

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -LinkType
Some of the other ID parameters must be also provided based on the current linkType.
Available values: branch, location, person, personGroup

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinkToId
ID of the assigned entity.
If it's a location, parent branch ID must be also provided.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BranchId
Id of the branch you want to assign.
If location is linked, this ID must be also provided as the parent branch ID of the location.
Run Get-TdBranch for more

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
This is the body of the request.
Use this to create your own bodies if the parameters aren't providing you with what you need.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
