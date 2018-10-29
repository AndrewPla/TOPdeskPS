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
{{Fill CardType Description}}

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
{{Fill Branch Description}}

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
{{Fill Category Description}}

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
{{Fill Status Description}}

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
{{Fill Type Description}}

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
{{Fill CurrentState Description}}

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
