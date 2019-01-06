---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdChangeProgress

## SYNOPSIS
Returns progress trail of specified change

## SYNTAX

```
Get-TdChangeProgress [-ChangeId] <Object> [-InlineImages] [-BrowserFriendlyUrls] [<CommonParameters>]
```

## DESCRIPTION
returns progress trail of specified change

## EXAMPLES

### EXAMPLE 1
```
Get-TdChangeProgress -ChangeId (Get-TdChange -Name 'example).id
```

returns progress trail of specified change

### EXAMPLE 2
```
Get-TdChange -Name 'My Sample Change' | Get-TdChangeProgress
```

Returns progress trail of 'My Sample Change'

## PARAMETERS

### -ChangeId
ID of the Change See Get-TdChange

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
if enabled InlineImages will be in the output

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
if enabled Browser Friendly Urls will be in output

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
