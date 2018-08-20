---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdIncident

## SYNOPSIS
Grabs Incidents from TOPdesk

## SYNTAX

### List (Default)
```
Get-TdIncident [-PageSize <Int32>] [-Start <Int32>] [-Completed <Boolean>] [-Closed <Boolean>]
 [-Resolved <Boolean>] [-Archived <Boolean>] [<CommonParameters>]
```

### Number
```
Get-TdIncident [-PageSize <Int32>] [-Start <Int32>] [-Number <String[]>] [<CommonParameters>]
```

## DESCRIPTION
This command returns incidents from TOPdesk.
The most you can grab per request is 100.

## EXAMPLES

### EXAMPLE 1
```
Get-TdIncident
```

Grabs a list of 10 incidents

## PARAMETERS

### -PageSize
The Amount of incidents to be returned per request.
The default value is 10 and the maximum value is 100.

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
This is the offset at which you want to start listing incidents at.
This is useful if you want to grab more than 100 incidents.

The default value is 0.

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
Type: Boolean
Parameter Sets: List
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
Type: Boolean
Parameter Sets: List
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
Type: Boolean
Parameter Sets: List
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
Type: Boolean
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Number
This is the incident number of the incident that you would like to retrieve.

```yaml
Type: String[]
Parameter Sets: Number
Aliases: IncidentNumber

Required: False
Position: Named
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
