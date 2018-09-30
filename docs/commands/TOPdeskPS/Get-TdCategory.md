---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdCategory

## SYNOPSIS
Get categories from TOPdesk

## SYNTAX

```
Get-TdCategory [[-Name] <String>] [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets either one category or a list of categories from TOPdesk.

## EXAMPLES

### EXAMPLE 1
```
Get-TdCategory
```

Gets a list of all categories

### EXAMPLE 2
```
Get-TdCategory -Name 'End User Support'
```

Gets the category with the name 'End User Support'

## PARAMETERS

### -Name
This is the name of the category that you want.
This can be useful if you want to pass a category id to a different command.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
REST login token.
This isn't needed if you want to use the token generated with Connect-TdService

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
