---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Send-TdAssetImportFile

## SYNOPSIS
Sends a file to containing assets to be uploaded to asset management.

## SYNTAX

```
Send-TdAssetImportFile [-File] <FileInfo> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
In order to upload assets using this endpoint you need to first configure an import inside TOPdesk.

As an operator, go to Settings -\> Import Settings -\> Asset MGMT Imports -\> New Import

Configure the import using the csv containing your asset information.
Set the Scheduling of the import to be Automated

When you upload a csv with the same name as specified in your import, TOPdesk will automatically trigger an import of the csv when you upload it using this command.

## EXAMPLES

### EXAMPLE 1
```
Send-TdAssetImportFile -File 'C:\AssetsToImport.csv'
```

Sends C:\AssetstoImport.csv to TOPdesk asset import.
This will cause an import to occur

## PARAMETERS

### -File
The csv containing your assets

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases: InFile

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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
