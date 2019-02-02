---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# New-TdAsset

## SYNOPSIS
Create a new asset

## SYNTAX

```
New-TdAsset [[-TemplateId] <String>] [[-Body] <PSObject>] [[-Name] <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This API creates a new asset.
To create a new asset, you will need the type of the asset you want to create (type_id), and to fill in the values of the mandatory fields of that specific asset type/template.
You can get the ID of the available types of assets/templates using the /assetmgmt/templates endpoint.
use Get-TdAssetTemplateBlank

## EXAMPLES

### EXAMPLE 1
```
New-TdAsset -TemplateId $templateId -Name 'TestComputer' -body @{Type = 'Computer'}
```

Creates a new asset named TestComputer.
It also sets the asset type to 'Computer'

## PARAMETERS

### -TemplateId
The ID of the template.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Body
This object contains key-value pairs, where the key is the field's id, and the value is the value of this field.
This model must contain every mandatory field with a value.
Note: do not add a name or type_id key as they are handled seperately in the parameters name and TemplateId, respectively.

Example:
$body = @{
    serialnumber = '123'
    type_id = 'Id Of the template that you want to use'
    name = 'Server01'
}

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The Name, or assetId of the asset that you want to create.
Example: TestComputer

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
