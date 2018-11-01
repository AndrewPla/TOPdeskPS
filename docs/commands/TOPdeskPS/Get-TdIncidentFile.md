---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdIncidentFile

## SYNOPSIS
obtains a list of files in an incident

## SYNTAX

```
Get-TdIncidentFile [-IncidentId] <String> [<CommonParameters>]
```

## DESCRIPTION
obtains a list of files in an incident

## EXAMPLES

### EXAMPLE 1
```
Get-TdIncidentFile -IncidentId (Get-TdIncident -Number 'I1810-NNN).id
```

gets list of files in specified incident

## PARAMETERS

### -IncidentId
ID of the Incident.
See Get-TdIncident

```yaml
Type: String
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
