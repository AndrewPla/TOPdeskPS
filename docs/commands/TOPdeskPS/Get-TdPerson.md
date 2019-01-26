---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdPerson

## SYNOPSIS
Gets persons

## SYNTAX

```
Get-TdPerson [[-FirstName] <String>] [[-Email] <String>] [[-LastName] <String>] [[-NetworkLoginName] <String>]
 [[-SspLoginName] <String>] [[-MobileNumber] <String>] [-Archived] [[-PageSize] <Int32>] [[-Start] <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
Gets persons

## EXAMPLES

### EXAMPLE 1
```
Get-TdPerson -FirstName 'Bob' -Archived
```

Returns all persons with the firstname starting with Bob.
This will also search archived files.

### EXAMPLE 2
```
Get-TdPerson -Email 'User@company.com' | Format-List *
```

Returns the person whose email is 'user@company.com' and displays all details of the result.

## PARAMETERS

### -FirstName
Retrieve only persons with first name starting with this

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

### -Email
Retrieve only persons with email starting with this

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LastName
Retrieve only persons with last name starting with this

```yaml
Type: String
Parameter Sets: (All)
Aliases: Surname

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NetworkLoginName
Retrieve only users with network login nmae starting with this.
Parameter is ignored for SSP users.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SspLoginName
Retrieve only persons with Self Service Portal name starting with this.
Parameter is ignored for SSP users.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MobileNumber
Retrieve only persons with mobile number ending with this.
Spaces and dashes are ignored.
For example: 6-12345678 will match both +316 12345678 and 06 1234 5678

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
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

### -PageSize
The amount of incidents to be returned per request.
The default value is 10 and the maximum value is 100.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start
This is the offset at which you want to start listing incidents.
This is useful if you want to grab more than 100 incidents.
The default value is 0.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
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
