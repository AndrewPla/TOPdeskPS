---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdIncident

## SYNOPSIS
Gets incidents

## SYNTAX

### List (Default)
```
Get-TdIncident [-ResultSize <Int32>] [-Start <Int32>] [-Completed] [-Closed] [-Resolved] [-Archived]
 [<CommonParameters>]
```

### Number
```
Get-TdIncident [[-Number] <String[]>] [-ResultSize <Int32>] [-Start <Int32>] [-Completed] [-Closed] [-Resolved]
 [-Archived] [<CommonParameters>]
```

## DESCRIPTION
This command returns incidents from TOPdesk.
The most you can grab per request is 100.

## EXAMPLES

### EXAMPLE 1
```
Get-TdIncident
```

returns incidents

### EXAMPLE 2
```
Get-Tdincident | Format-List *
```

return incidents and all of their properties

### EXAMPLE 3
```
Get-TdIncident -Closed
```

Returns incidents and includes closed incidents.

### EXAMPLE 4
```
Get-TdIncident -ResultSize 2000
```

Returns 2000 incidents.

## PARAMETERS

### -Number
This is the incident number of the incident that you would like to retrieve.

```yaml
Type: String[]
Parameter Sets: Number
Aliases: IncidentNumber

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ResultSize
The amount of incidents to be returned.
Due to API limitations we're only able to return 100 incidents per api call.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start
This is the offset at which you want to start listing incidents.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Completed
Retrieve only incidents that are completed / not completed.
Set this parameter to $false to only retrieve not completed incidents, and set it to $true to only receive completed incidents.

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

### -Closed
Retrieve only incidents that are closed /not closed.

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

### -Resolved
Retrieve only incidents that are resolved depending on the setting "Call is resolved when" (Module Settings -\> Call Management -\> General)

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

### -Archived
Whether to retrieve archived incidents.

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
