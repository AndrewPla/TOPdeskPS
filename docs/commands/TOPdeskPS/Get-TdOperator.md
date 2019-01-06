---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdOperator

## SYNOPSIS
returns list of operators

## SYNTAX

```
Get-TdOperator [[-TOPdeskLoginName] <String>] [-ResultSize <Int32>] [-Start <Int32>] [-Email <String>]
 [-Archived] [-LastName <String>] [-FirstName <String>] [<CommonParameters>]
```

## DESCRIPTION
returns list of operators

## EXAMPLES

### EXAMPLE 1
```
Get-TdOperator
```

returns list of operators

### EXAMPLE 2
```
Get-TdOperator -Name 'John Support'
```

returns operator with name John Support (uses the dynamicName field)

## PARAMETERS

### -TOPdeskLoginName
Retrieve only operators with TOPdesk login name starting with this.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResultSize
The amount of incidents to be returned.
Requests greater than 100 require multiple api calls

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

### -Email
Retrieve only operators with email starting with this.

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

### -Archived
Whether to return archived operators

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

### -LastName
Retrieve only operators with last name starting with this.

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

### -FirstName
Retrieve only operators with first name starting with this.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
