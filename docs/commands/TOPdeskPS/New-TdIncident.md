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
New-TdIncident [[-Action] <String>] [-ActionInvisibleForCaller] [[-EntryTypeId] <String>]
 [[-CallTypeId] <String>] [[-ObjectName] <String>] [[-LocationId] <String>] [[-ExternalNumber] <String>]
 [[-Subcategory] <String>] [[-MainIncidentId] <String>] [[-BriefDescription] <String>]
 [-CallerLookupEmail] <String> [[-CallerLookupId] <String>] [[-Status] <String>] [[-Request] <String>]
 [[-CallerBranchId] <String>] [[-Category] <String>] [[-ImpactId] <String>] [[-UrgencyId] <String>]
 [[-PriorityId] <String>] [[-DurationId] <String>] [[-TargetDate] <String>] [[-SlaId] <String>] [-OnHold]
 [[-OperatorId] <String>] [[-OperatorGroupId] <String>] [[-SupplierId] <String>]
 [[-ProcessingStatusId] <String>] [-Responded] [[-ResponseDate] <String>] [-Completed]
 [[-CompletedDate] <String>] [[-Closed] <String>] [[-ClosedDate] <String>] [[-ClosureCodeId] <String>]
 [[-Costs] <String>] [[-CallerPhoneNumber] <String>] [[-CallerMobileNumber] <String>] [[-CallerEmail] <String>]
 [[-CallerDepartmentId] <String>] [[-CallerLocationId] <String>] [[-CallerBudgetHolderId] <String>]
 [[-CallerPersonExtraFieldAId] <String>] [[-CallerPersonExtraFieldBId] <String>] [-MajorCall]
 [[-MajorCallObjectId] <String>] [-PublishToSsd] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This command creates a new incident in TOPdesk

## EXAMPLES

### EXAMPLE 1
```
New-TdIncident -CallerLookupEmail 'user@Company.net' -Action 'Initial Action' -BriefDescription 'Example Incident' -Request 'Printer Assistance'
```

This creates a basic incident for the Caller 'user@Company.net'

### EXAMPLE 2
```
New-TdIncident -CallerLookupEmail 'user@company.net' -Request 'Incident Request' -OperatorGroupId (Get-TdOperatorGroup 'TechSupport').id
```

Creates a new incident and and assigns it to the Techsupport operator group

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

### -ActionInvisibleForCaller
Whether the initial action is invisible for persons.
Can only be set by operators.
Default value is false

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

### -EntryTypeId
Entry type by id.
Can only be set by operators.

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

### -CallTypeId
Call type by id.
Can be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
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

### -ObjectName
Object by name.
Can be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.

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

### -LocationId
Location by id.
Can be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.

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

### -ExternalNumber
External number.
Can only be set by operators.
For partials, if not provided, will be automatically copied from the main incident.

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
Subcategory by name.
Can be set by operators.
For partials, if not provided, will be automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.
It is an error to provide both an id and a name.
If a subcategory is provided without a category, the corresponding category will be filled in automatically, unless there are multiple matching categories, in which case the request will fail.

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

### -MainIncidentId
Main incident id, required for creating a partial incident.
This must be an open, unarchived second line incident and visible to the operator.
It is an error to provide a main incident for non-partial incidents.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
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
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerLookupEmail
This is the email of the incident's caller.
TOPdesk will fill the caller's details into the incident automatically.

Lookup value for filling in a registered caller's contact details.
Can only be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
The caller is filled in automatically for persons.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerLookupId
Id of the caller.

```yaml
Type: String
Parameter Sets: (All)
Aliases: CallerId

Required: False
Position: 11
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
Position: 12
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
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerBranchId
The caller branch by id.
can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
Category by name.
Can be set by operators.
For partials, if not provided, will be automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.
It is an error to provide both an id and a name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ImpactId
Impact by id.
Can only be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UrgencyId
Urgency by id.
Can only be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PriorityId
Priority by id.
Can only be set by operators.
Cannot be provided for partials as its automatically copied from the main incident.
Will be automatically filled in if you provide impact and/or urgency leading to a unique priority according to your priority matrix, and the same request doesn't provide a priority.
For incidents with a linked SLA, if the priority provided cannot be found in the Service Level Priority List, the duration field of the incident will be emptied.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DurationId
Duration by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetDate
Target date.
Can only be set by operators.
Example: "targetDate" : "2015-11-15T14:00:00.000+0200"
The given time offset will be used.
Without a given offset Zulu/UTC time will be assumed.
E.g.
2015-10-28T10:30:00.000 is equivalent to 2015-10-28T10:30:00.000+0000

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SlaId
SLA by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OnHold
Specify whether the incident is on hold.
On hold date will be filled accordingly.
can only be set by operators.

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

### -OperatorId
Operator by id.
Can only be set by operators.
For partials, if not provided, will be automatically copied from the main incident.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 22
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OperatorGroupId
Operator group by id.
Can be set by operators.
For partials, if not provided, will be automatically copied from the main incident.
Can be set by persons only when the appropriate setting for the new call form is checked.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SupplierId
Supplier by id.
Can only be set by operators

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 24
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProcessingStatusId
ProcessingStatus by id.
Can only be set by operators

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
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

### -ResponseDate
Response date.
SLM-licence is needed.
Can only be set by operators.
Will automatically be set to current date if left out and "responded : true" is set.
Example: "responseDate" : "2015-11-15T14:00:00.000+0200"
The given time offset will be used.
Without a given offset Zulu/UTC time will be assumed.
E.g.
2015-10-28T10:30:00.000 is equivalent to 2015-10-28T10:30:00.000+0000

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 26
Default value: None
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

### -CompletedDate
Whether the incident is completed.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 27
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Closed
Whether the incident is closed.
Can only be set by operators.
For partials, will be ignored.
The value of completed will be used instead.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 28
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClosedDate
Closed date.
Can only be set by operators.
For partials, will be ignored.
The value of completedDate will be used instead.
Example: "closedDate" : "2018-11-15T14:00:00.000+0200"
The given time offset will be used.
Without a given offset Zulu/UTC time will be assumed.
E.g.
2018-10-28T10:30:00.000 is equivalent to 2018-10-28T10:30:00.000+0000

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 29
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClosureCodeId
Closure code by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 30
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Costs
Costs.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 31
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerPhoneNumber
Phone number of the caller.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 32
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerMobileNumber
Mobile phone number of the caller.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 33
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerEmail
Email of the caller.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 34
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerDepartmentId
Department of the caller by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 35
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerLocationId
Location of the caller by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 36
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerBudgetHolderId
Budget holder of the caller by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 37
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerPersonExtraFieldAId
Person extra a of the caller by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 38
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerPersonExtraFieldBId
Person extra b of the caller by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 39
Default value: None
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

### -MajorCallObjectId
Major call by id.
Can only be set by operators.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 40
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PublishToSsd
Whether the incident should be published in the Self Service Desk; only major incidents can be published.
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
