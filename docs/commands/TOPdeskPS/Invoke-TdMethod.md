---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Invoke-TdMethod

## SYNOPSIS
Wrapper for Invoke-RestMethod.
This command is exposed in case you encounter api calls that aren't part of this module.
All api commands call this command to perform the web request.

## SYNTAX

```
Invoke-TdMethod [-Uri] <Uri> [-ContentType <String>] [-Body <PSObject>] [-Method <String>] [-Token <String>]
 [-File <FileInfo>] [<CommonParameters>]
```

## DESCRIPTION
A detailed description of the Invoke-TdMethod function.

## EXAMPLES

### EXAMPLE 1
```
Invoke-TdMethod -Token $Token -Body $Body
```

Sends a Get request to your TOPdesk instance.

## PARAMETERS

### -Uri
A description of the Uri parameter.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContentType
A description of the ContentType parameter.

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
The body of the request to be sent to TOPdesk.
Accepts a PSCustomObject.
If you also specify a file we will convert the body into a multipart/form request.

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

### -Method
The method that you want to pass

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Get
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
Custom Api token if you want to avoid using Connect-TdService ex:'TOKEN id="Token id="Base64encodedToken

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

### -File
path to the file that you want to upload.
If you specify a body then we will construct a multipart/form request.
In Windows PowerShell this functionality isn't built in.
If no body is specified then we will just use the -infile parameter of Invoke-RestMethod

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases: InFile

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
