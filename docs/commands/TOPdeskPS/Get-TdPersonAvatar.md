---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Get-TdPersonAvatar

## SYNOPSIS
Returns the avatar of a person

## SYNTAX

```
Get-TdPersonAvatar -PersonId <Object> [<CommonParameters>]
```

## DESCRIPTION
Returns the avatar of a person by the persons id.

## EXAMPLES

### EXAMPLE 1
```
Get-TdPerson | Get-TdPersonAvatar
```

returns all avatars

## PARAMETERS

### -PersonId
Gets the image used as an avatar by person id

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Id

Required: True
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
