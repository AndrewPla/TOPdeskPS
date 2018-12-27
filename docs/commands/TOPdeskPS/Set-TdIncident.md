---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# Set-TdIncident

## SYNOPSIS
Updates an incident

## SYNTAX

```
Set-TdIncident [-Number] <String> [-Action <String>] [-ActionInvisibleForCaller] [-BriefDescription <String>]
 [-Request <String>] [-Category <String>] [-Subcategory <String>] [-CallerEmail <String>] [-EntryType <String>]
 [-ExternalNumber <String>] [-CallerBranch <String>] [-Impact <String>] [-Urgency <String>]
 [-Priority <String>] [-ObjectId <String>] [-LocationId <String>] [-CallType <String>] [-Operator <String>]
 [-OperatorGroup <String>] [-Supplier <String>] [-ProcessingStatus <String>] [-Responded] [-Completed]
 [-Closed] [-ClosureCode <String>] [-Costs <Single>] [-Duration <String>] [-TargetDate <DateTime>] [-OnHold]
 [-MajorCall] [-MajorCallObject <String>] [-PublishToSsd] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This command updates various properties of an incident.

## EXAMPLES

### EXAMPLE 1
```
Set-TdIncident -IncidentNumber 'I1805-221' -Action 'Example Action'
```

Updates incident I1805-221 with the action 'Example Action'

## PARAMETERS

### -Number
Number of the TOPdesk incident that you want to modify.

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

### -Action
Add an action.
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ActionInvisibleForCaller
Whether the added action is invisible for persons.
Can only be set by operators.

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
Position: Named
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
Position: Named
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
Position: Named
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
Position: Named
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EntryType
Entry type by id.
Can only be set by operators.

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

### -ExternalNumber
External number.
Can only be set by operators.

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

### -CallerBranch
The caller branch by id.
Can only be set by operators.

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

### -Impact
Impact by id.
Can only be set by operators.
For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

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

### -Urgency
Urgency by id.
Can only be set by operators.
For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

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

### -Priority
Priority by id.
Can only be set by operators.
For partial incidents, this field is determined by the main incident and will give an error if provided in the request.
Will be automatically filled in if you provide impact and/or urgency leading to a unique priority according to your priority matrix, and the same request doesn't provide a priority.
For incidents with a linked SLA, if the priority provided cannot be found in the Service Level Priority List, the duration field of the incident will be emptied.

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

### -ObjectId
Object by id.
Can only be set by operators.
For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

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

### -LocationId
Location by id.
Can only be set by operators.
For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

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

### -CallType
Call type by id.
Can only be set by operators.
For partial incidents, this field is determined by the main incident and will give an error if provided in the request.

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

### -Operator
Operator by id.
Can only be set by operators.

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

### -OperatorGroup
Operator group by id.
Can only be set by operators.

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

### -Supplier
Supplier by id.
Can only be set by operators.
Cannot be filled in if the incident has a supplier service linked.

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

### -ProcessingStatus
Processing status by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Status

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Responded
Whether the incident is responded.
SLM-licence is needed.
Can only be set by operators.
When the setting "Status determines responded" is on, this will be filled automatically (manual setting is prohibited).

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

### -Completed
Whether the incident is completed.
Can only be set by operators.

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

### -Closed
Whether the incident is closed.
Can only be set by operators and persons.

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

### -ClosureCode
Closure code by id.
Can only be set by operators.

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

### -Costs
Costs
Can only be set by operators.

```yaml
Type: Single
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Duration
Duration by id.
Can only be set by operators.
Cannot be filled in if the incident has a supplier service linked.

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

### -TargetDate
Target date.
This includes the timezone information from the provided object.
Can only be set by operators.
Cannot be filled in if the incident has a supplier service linked.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OnHold
sets the ticket to onhold.
Can only be set by operators.

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

### -MajorCall
Whether the incident is a major call.
Can only be set by operators.

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

### -MajorCallObject
Major call by id.
Can only be set by operators.

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

### -PublishToSsd
Whether the incident should be published in the Self Service Desk, only major incidents can be published.
Can only be set by operators.

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
