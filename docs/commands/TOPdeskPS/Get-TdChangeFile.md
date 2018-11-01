---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdChangeFile

## SYNOPSIS
Lists files from an asset

## SYNTAX

```
Get-TdChangeFile [-ChangeId] <String> [-FileId] <String> [[-OutFile] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Lists files from an asset

## EXAMPLES

### EXAMPLE 1
```
Get-TdChangeFile -ChangeId $ChangeId -FileId $FileId -OutFile .\output.txt
```

Returns files from change $ChangeId

## PARAMETERS

### -ChangeId
Id of the change that you want files for

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

### -FileId
Id of the file you wish to downloads

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutFile
file location to save outputted file to

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
