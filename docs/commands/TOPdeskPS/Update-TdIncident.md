---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Update-TdIncident

## SYNOPSIS
Updates an incident

## SYNTAX

```
Update-TdIncident [-IncidentNumber] <String> [[-Action] <String>] [[-BriefDescription] <String>]
 [[-Request] <String>] [[-Category] <String>] [[-Subcategory] <String>] [[-CallerEmail] <String>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This command updates various properties of an incident.

## EXAMPLES

### EXAMPLE 1
```
Update-TdIncident -IncidentNumber 'I1805-221' -Action 'Example Action'
```

Updates incident I1805-221 with the action 'Example Action'

## PARAMETERS

### -IncidentNumber
Number of the TOPdesk incident that you want to update.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Number

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Action
A description of the Action parameter.

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

### -BriefDescription
Brief description for the incident.
This can be set by operators.
For partials, if not provided, will be automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Request
The initial request for the incident.
You will likely want to use a here-string to construct the request of the incident.

Line breaks can be added via \<br\> tags and are automatically added after a closing \<p\> or
The following html tags can be used to format the text:

\<i\>
\<em\>
\<b\>
\<strong\>
\<u\>
\<a\>
\<img\> BASE64-encoding has to be used.
Only pictures up to the size of 450x450 pixels are supported.
Allowed picture-formats:
gif, png, bmp, pcx, iff, ras, pnm, psd, jpg

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

### -Category
The name of the category for the incident.
Can be set by operators.
If not provided to partial incidents, the category will be automatically copied from the main incident.

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

### -Subcategory
The name of the category for the incident.
Can be set by operators.
If a subcategory is provided without a category, the corresponding category will be filledi n automatically, unless there are multiple matching categories, in which case the request will fail.
If not provided to partial incidents, the category will be automatically copied from the main incident.

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

### -CallerEmail
This is the email of the incident's caller.
TOPdesk will fill the caller's details into the incident automatically.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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
