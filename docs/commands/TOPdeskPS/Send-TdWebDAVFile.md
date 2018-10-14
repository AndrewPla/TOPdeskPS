---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Send-TdWebDAVFile

## SYNOPSIS
Sends a file to your TOPdesk webdav share

## SYNTAX

```
Send-TdWebDAVFile [[-File] <FileInfo>] [-Credential] <PSCredential> [-Folder] <FileInfo> [[-Url] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
adds a file to your TOPdesk/webdav/Import folder.
This can be useful for you to upload files that are imported regularly in your environment.
Common uses could be to regularly upload your users from a csv, or you could upload asset information that is imported.

## EXAMPLES

### EXAMPLE 1
```
Send-TdWebDAVFile -Credential (Get-Credential) -File 'C:\Users.csv' -Folder upload
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

### -Folder
Name of the TOPdesk webDAV folder that you want to upload a file into
Valid Values:
accesslogs
csvexport
database_backup
import
photos
topsis
upload
web

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Url
This is the url to your TOPdesk instance.
If you used Connect-TdService -Register then you don't need to specify one.

```yaml
Type: String
Parameter Sets: (All)
Aliases: TOPdeskUrl

Required: False
Position: 4
Default value: (
            Get-PSFConfigValue -FullName TOPdeskPS.Url -NotNull -ErrorAction Continue)
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
See Help About_TOPdesk_files for more

## RELATED LINKS
