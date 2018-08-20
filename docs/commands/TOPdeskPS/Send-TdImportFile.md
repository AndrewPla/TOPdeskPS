---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Send-TdImportFile

## SYNOPSIS
Sends a file to your TOPdesk webdav import file

## SYNTAX

```
Send-TdImportFile [[-File] <FileInfo>] [-Credential] <PSCredential> [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
adds a file to your TOPdesk/webdav/Import folder.
This can be useful for you to upload files that are imported regularly in your environment.
Common uses could be to regularly upload your users from a csv, or you could upload asset information that is imported.

## EXAMPLES

### EXAMPLE 1
```
Send-TdImportFile -Credential (Get-Credential) -File 'C:\Users.csv'
```

Uploads the C:\Users.csv file to TOPdesk using the credential specified in -Credential.

## PARAMETERS

### -File
This is the path of the file that you want to upload to TOPdesk.

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Credential of the user with webdav permissions.
This Credential is handled seperately from normal web requests as this doesn't interact with the normal API.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
Specify whether you want this command to throw an exception if it encounters an error.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
See About_TOPdesk_files for more

## RELATED LINKS
