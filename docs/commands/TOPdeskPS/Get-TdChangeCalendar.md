---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdChangeCalendar

## SYNOPSIS
returns list of changes and activities in specified date range

## SYNTAX

```
Get-TdChangeCalendar [[-Start] <DateTime>] [[-End] <DateTime>] [[-CardType] <String[]>] [[-Branch] <String[]>]
 [[-Category] <String[]>] [[-Status] <String[]>] [[-Type] <String[]>] [[-CurrentState] <String[]>]
 [<CommonParameters>]
```

## DESCRIPTION
returns list of changes and activities in specified date range.
For activities to appear in this endpoint the option "Display in Calendar" under "Planning" on the activity card has to be set.
Start and end date are mandatory.

## EXAMPLES

### EXAMPLE 1
```
Get-TdChangeCalendar
```

Returns results with default date values (90 days back and 90 days forward)

### EXAMPLE 2
```
Get-TdChangeCalendar -Branch 'Side Branch'
```

Returns all results for 'Side Branch' branch

### EXAMPLE 3
```
Get-TdChangeCalendar -CurrentState 'done'
```

Returns all 'done' change cards

## PARAMETERS

### -Start
start of range to return changes.
Default value = 90 days

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: ((get-date).AddDays(-90))
Accept pipeline input: False
Accept wildcard characters: False
```

### -End
end of range to return changes.
Default value = 90 days

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: ((get-date).AddDays('90'))
Accept pipeline input: False
Accept wildcard characters: False
```

### -CardType
Type of card to filter results by.
Accepted options 'change_simple', 'change_extensive', 'undefined', 'activity_authorization', 'activity_normal'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Branch
Branch to filter results by

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
Category of cards to obtain

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Status of cards to obtain

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
Type of cards to obtain

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CurrentState
CurrentState that cards to be obtained are in

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
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
