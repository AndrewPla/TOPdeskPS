---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Send-TdIncidentFile

## SYNOPSIS
Upload a file to an incident identified

## SYNTAX

```
Send-TdIncidentFile [-Number] <String> [-File] <FileInfo[]> [-InvisibleForCaller] [[-Description] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Upload a file to an incident.
You can make the file invisible to the caller and you can also add a description.

## EXAMPLES

### EXAMPLE 1
```
Send-TdIncidentFile -File 'C:\TestFile.txt' -Number 'I1911-123' -InvisibleforCaller
```

Uploads a file to an incident.
and makes it invisible for caller.

### EXAMPLE 2
```
Send-TdIncidentFile -File 'C:\ScanResult.txt' -Number 'I1911-123' -Description "Copy of the scan results from the target machine"
```

Uploads a file to an incident with a description.

## PARAMETERS

### -Number
The number of the incident that you want to upload a file to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

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

### -InvisibleForCaller
Whether you want to make this invisible to caller or not.
The default is no.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Provide a description for the file.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
