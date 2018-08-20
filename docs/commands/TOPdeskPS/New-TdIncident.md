---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# New-TdIncident

## SYNOPSIS
Creates a new incident

## SYNTAX

```
New-TdIncident [[-Action] <String>] [[-BriefDescription] <String>] [-CallerEmail] <String> [[-Status] <String>]
 [[-Request] <String>] [[-Category] <String>] [[-Subcategory] <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This command creates a new incident in TOPdesk

## EXAMPLES

### EXAMPLE 1
```
New-TdIncident -CallerEmail 'user@Company.net' -Action 'Initial Action' -BriefDescription 'Example Incident' -Request 'Printer Assistance'
```

This creates a basic incident for the Caller 'user@Company.net'

## PARAMETERS

### -Action
Initial action.
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
Example:
\<img src="data:image/png;base64,iVBORw0KGgoAAA..."\>

Line breaks can be added via \<br\> tags and are automatically added after a closing \<p\> or \<div\>.
Can be set by operators and persons.

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
Position: 2
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

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Status of the incident.
Available values:
FirstLine
SecondLine
Partial

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: FirstLine
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
Position: 5
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
Position: 6
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
