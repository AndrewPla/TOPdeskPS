---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdIncidentAction

## SYNOPSIS
Gets actions from an incident

## SYNTAX

```
Get-TdIncidentAction [-Number] <String> [[-PageSize] <Int32>] [[-Start] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Returns all actions for an incident.

## EXAMPLES

### EXAMPLE 1
```
Get-TdIncidentAction -Number 'i123-1234'
```

Grabs all actions from incident with number 'i123-1234

## PARAMETERS

### -Number
This is the incident number.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PageSize
The amount of actions to be returned per request.
The default value is 10 and the maximum value is 100.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start
This is the offset at which you want to start listing actions.
This is useful if you want to grab more than 100.
The default value is 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
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
