---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdIncidentTimeSpent

## SYNOPSIS
Register time spent on an incident

## SYNTAX

```
Set-TdIncidentTimeSpent [[-Number] <String>] [-TimeSpent] <Int32> [-EntryDate <String>] [[-Notes] <String>]
 [-ReasonId <String>] [-OperatorId <String>] [-OperatorGroupId <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Update the timespent on an incident.
Can also add a note/reason and you can register time for another operator.

## EXAMPLES

### EXAMPLE 1
```
Set-TdIncidentTimeSpent 'i1911-123' -TimeSpent 30 -Notes 'Installed Printer'
```

registers 30 minutes on i1911-123

## PARAMETERS

### -Number
The number of the incident that you want to update the timespent on.

```yaml
Type: String
Parameter Sets: (All)
Aliases: IncidentNumber

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TimeSpent
Time spent in minutes.
Can be negative as long as the total registered time on the incident does not go below 0.
Can not be 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -EntryDate
Date for when the time spent should be registered.
If not set, will be set to the current time.
"2015-11-15T14:00:00.000+0200"
The given time offset will be used.
Without a given offset Zulu/UTC time will be assumed.
E.g.
2015-10-28T10:30:00.000 is equivalent to 2015-10-28T10:30:00.000+0000

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

### -Notes
Notes for the entry of registered time spent

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReasonId
The reason for the time spent by id.

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

### -OperatorId
Operator by id.
If not set, currently logged in operator will be used.

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

### -OperatorGroupId
Operator group by id.
Must match with the specified operator.
If no operator specified, operator group will also be set as the operator.

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

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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
