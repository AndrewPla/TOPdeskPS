---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdChangeRequest

## SYNOPSIS
returns list of change requests

## SYNTAX

```
Get-TdChangeRequest [-ChangeId] <Object> [-InlineImages] [-BrowserFriendlyUrls] [<CommonParameters>]
```

## DESCRIPTION
returns list of change requests

## EXAMPLES

### EXAMPLE 1
```
Get-TdChangeRequest -ChangeId $ChangeId
```

returns list of change requests associated with specified change

## PARAMETERS

### -ChangeId
{{Fill ChangeId Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -InlineImages
{{Fill InlineImages Description}}

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

### -BrowserFriendlyUrls
{{Fill BrowserFriendlyUrls Description}}

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

## RELATED LINKS
