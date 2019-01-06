---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdChangeCalendarProgress

## SYNOPSIS
returns the progress trail of the specified calendar id

## SYNTAX

```
Get-TdChangeCalendarProgress [-calendarId] <Object> [<CommonParameters>]
```

## DESCRIPTION
returns the progress trail of the specified calendar id

## EXAMPLES

### EXAMPLE 1
```
Get-TdChangeCalendar | Get-TdChangeCalendarProgress
```

returns the progress trail of all calendar events

## PARAMETERS

### -calendarId
ID of the Calendar Event.
See Get-TdChangeCalendar

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
