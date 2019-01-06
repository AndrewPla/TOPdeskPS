---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdLocationDetail

## SYNOPSIS
Gets location details

## SYNTAX

```
Get-TdLocationDetail [-Location] <Object> [<CommonParameters>]
```

## DESCRIPTION
Returns details of location by id

## EXAMPLES

### EXAMPLE 1
```
Get-TdLocation | Get-TdLocationDetail
```

returns details for all locations

### EXAMPLE 2
```
Get-TdLocation 'Mars' | Get-TdLocationDetail
```

Returns details for the mars location

## PARAMETERS

### -Location
Id of the location that you want returned.
See Get-TdLocation

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
