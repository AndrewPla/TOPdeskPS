---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdOperator

## SYNOPSIS
Get TOPdesk operators

## SYNTAX

```
Get-TdOperator [-TOPdeskLoginName <String>] [-PageSize <Int32>] [-Start <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Gets operators from TOPdesk.
You can specify filters to only return one.

## EXAMPLES

### EXAMPLE 1
```
Get-TdOperator
```

Returns a list of TOPdesk operators, up to 100.

### EXAMPLE 2
```
Get-TdOperator -TOPdeskLoginName 'user@company.net'
```

Returns the operator information for the operator with a login name of 'user@company.net' This field may not necessarily be an email address.
This depends on how your TOPdesk instance is setup.

## PARAMETERS

### -TOPdeskLoginName
The TOPdesk login name of the operator that you want.

```yaml
Type: String
Parameter Sets: (All)
Aliases: LoginName

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageSize
The amount of operators to be returned per request.
Default is 100.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start
The offset at which to start listing the operators at.
Useful if you have more than 100 operators.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Additional information about the function.

## RELATED LINKS
