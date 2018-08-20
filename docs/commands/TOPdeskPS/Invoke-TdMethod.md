---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Invoke-TdMethod

## SYNOPSIS
internal wrapper for Invoke-RestMethod

## SYNTAX

```
Invoke-TdMethod [[-ContentType] <String>] [[-Uri] <Uri>] [[-Body] <PSObject>] [[-Method] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
A detailed description of the Invoke-TdMethod function.

## EXAMPLES

### EXAMPLE 1
```
Invoke-TdMethod
```

Just a quick description.

## PARAMETERS

### -ContentType
A description of the ContentType parameter.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Application/json
Accept pipeline input: False
Accept wildcard characters: False
```

### -Uri
A description of the Uri parameter.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
The body of the request to be sent to TOPdesk.
Accepts a PSCustomObject and converts it to JSON.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
Position: 4
Default value: Get
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Additional information about the function.

## RELATED LINKS
