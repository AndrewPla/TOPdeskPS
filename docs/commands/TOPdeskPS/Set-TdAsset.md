---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdAsset

## SYNOPSIS
Updates an asset

## SYNTAX

```
Set-TdAsset [-AssetId] <String> [-Body] <PSObject> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Updates the given asset.It may be possible that one or more assets couldn't be deleted because they have existing links from other components.
In this case those assets' ids will be listed in the 'failed' list of the response, but it doesn't affect deletion of other assets.

## EXAMPLES

### EXAMPLE 1
```
Set-TdAsset -AssetId $AssetId
```

Removes all assets with id's inside $assetId.

## PARAMETERS

### -AssetId
Id of the asset to update

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Body
This object contains key-value pairs, where the key is the modified field's id, and the value is the new value.
If a mandatory field is not given in this model, then it's value remains the same.
Example:
{
  "numberField": "string",
 "textField": "string",
"dropdownField": "string",
  "@status": "OPERATIONAL",
"@statusLocked": true,
"@etag": "string"
}
Further explanation.
numberField	string
An example value could be: 15.440

textField	string
An example value could be: Sample text

dropdownField	string
An example dropdown value is an id: AF404E17-F1E3-4AB7-BB77-F9FC5189CF6E

@status	string
Status shows if this asset is operational right now or not.
Main field to set for triggering Impact Analysis features
Enum:
\[ OPERATIONAL, IMPACTED \]

@statusLocked	boolean
Enterprise users can enable automatic propagation by setting @statusLocked to false, or stop automatic propagation and enable manual status switching by setting @statusLocked to true.

@etag	string
ETag for the given entity.
It is used for concurrent modification checking with optimistic locking.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
