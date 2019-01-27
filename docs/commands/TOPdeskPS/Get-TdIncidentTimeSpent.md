---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdIncidentTimeSpent

## SYNOPSIS
Retrieves time spent on an incident

## SYNTAX

```
Get-TdIncidentTimeSpent [[-Number] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves time spent on an incident

## EXAMPLES

### EXAMPLE 1
```
Get-TdIncident | Get-TdIncidentTimeSpent
```

Returns time spent for the provided incidents

### EXAMPLE 2
```
Get-TdIncidentTimeSpent i1811-123
```

returns time spent for i1811-123

## PARAMETERS

### -Number
The number of the incident that you want to retrieve time spent for.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: IncidentNumber

Required: False
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
