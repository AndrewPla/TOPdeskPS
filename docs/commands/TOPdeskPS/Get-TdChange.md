---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdChange

## SYNOPSIS
Returns changes

## SYNTAX

```
Get-TdChange [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns changes.
TOPdesk doesn't provide this functionality so this command will query all Activities, grab all Change Ids and then lookup the change details for them.
The output of the last call is what you get

## EXAMPLES

### EXAMPLE 1
```
Get-TdChange
```

Returns all changes (or tries to, it will once a proper endpoint is made by TOPdesk)

## PARAMETERS

### -Name
Human readable name to filter results by, this cooresponds with the brief description field in TOPdesk

```yaml
Type: String
Parameter Sets: (All)
Aliases: BriefDescription

Required: False
Position: 1
Default value: *
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
