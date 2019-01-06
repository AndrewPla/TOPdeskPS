---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Send-TdChangeActivityFile

## SYNOPSIS
Upload a file to a change activity.

## SYNTAX

```
Send-TdChangeActivityFile [-ChangeId] <String> [-File] <FileInfo[]> [<CommonParameters>]
```

## DESCRIPTION
Upload a file to a change activity.

## EXAMPLES

### EXAMPLE 1
```
Get-TdChangeActivity 'C1811-123' | Send-TdChangeActivityFile -File 'C:\TestFile.txt'
```

Uploads a file to a change activity

### EXAMPLE 2
```
Get-TdChangeDetail 'C1211-123' | Send-TdChangeActivityFile -file 'C:\log.txt'
```

uploads a file to C1211-123

## PARAMETERS

### -ChangeId
Id of the change activity that you want to work with.

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

### -File
File that you want to upload.

```yaml
Type: FileInfo[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
