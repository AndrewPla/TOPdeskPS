---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdServiceWindow

## SYNOPSIS
Gets all service windows

## SYNTAX

```
Get-TdServiceWindow [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets all service windows

## EXAMPLES

### EXAMPLE 1
```
Get-TdServiceWindow
```

Gets list of all service windows

### EXAMPLE 2
```
Get-TdServiceWindow Window1
```

Returns the window1 service windows

## PARAMETERS

### -Name
Name of the service window that you want returned.
Wildcards are supported.
Default value is '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
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
