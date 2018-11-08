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
Set-TdIncident [-IncidentNumber] <String> [[-BriefDescription] <String>] [[-Request] <String>]
 [[-Action] <String>] [-ActionInvisibleForCaller] [[-EntryType] <String>] [[-CallType] <String>]
 [[-Category] <String>] [[-Subcategory] <String>] [[-ExternalNumber] <String>] [[-CallerLookup] <String>]
 [[-CallerBranchId] <String>] [[-CallerDynamicName] <String>] [[-CallerPhoneNumber] <String>]
 [[-CallerMobileNumber] <String>] [[-CallerEmail] <String>] [[-CallerDepartmentId] <String>]
 [[-CallerLocationId] <String>] [[-CallerBudgetHolderId] <String>] [[-ObjectId] <String>]
 [[-LocationId] <String>] [[-BranchId] <String>] [[-ImpactId] <String>] [[-UrgencyId] <String>]
 [[-PriorityId] <String>] [[-DurationId] <String>] [[-TargetDate] <String>] [-OnHold] [[-OperatorId] <String>]
 [[-OperatorGroupId] <String>] [[-SupplierId] <String>] [[-ProcessingStatusId] <String>] [-Responded]
 [[-ResponseDate] <String>] [-Completed] [[-CompletedDate] <String>] [-Closed] [[-ClosedDate] <String>]
 [[-ClosureCodeId] <String>] [[-costs] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
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
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Action
A description of the Action parameter.

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

### -ActionInvisibleForCaller
{{Fill ActionInvisibleForCaller Description}}

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

### -EntryType
{{Fill EntryType Description}}

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

### -CallType
{{Fill CallType Description}}

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

### -Category
The name of the category for the incident.
Can be set by operators.
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
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExternalNumber
{{Fill ExternalNumber Description}}

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

### -CallerLookup
\[PSFValidatePattern('\w+(\[-+.\]\w+)*@\w+(\[-.\]\w+)*\.\w+(\[-.\]\w+)*', ErrorMessage = '{0} is not a valid email address.')\]

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerBranchId
TODO change this to accept email or ID

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerDynamicName
{{Fill CallerDynamicName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CallerPhoneNumber
{{Fill CallerPhoneNumber Description}}

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

### -CallerMobileNumber
{{Fill CallerMobileNumber Description}}

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

### -CallerEmail
This is the email of the incident's caller.
TOPdesk will fill the caller's details into the incident automatically.

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

### -CallerDepartmentId
{{Fill CallerDepartmentId Description}}

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

### -CallerLocationId
{{Fill CallerLocationId Description}}

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

### -CallerBudgetHolderId
{{Fill CallerBudgetHolderId Description}}

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

### -ObjectId
{{Fill ObjectId Description}}

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

### -LocationId
{{Fill LocationId Description}}

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

### -BranchId
{{Fill BranchId Description}}

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

### -ImpactId
{{Fill ImpactId Description}}

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

### -UrgencyId
{{Fill UrgencyId Description}}

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

### -PriorityId
{{Fill PriorityId Description}}

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

### -DurationId
{{Fill DurationId Description}}

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

### -TargetDate
{{Fill TargetDate Description}}

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

### -OnHold
{{Fill OnHold Description}}

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
{{Fill OperatorId Description}}

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

### -OperatorGroupId
{{Fill OperatorGroupId Description}}

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

### -SupplierId
{{Fill SupplierId Description}}

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

### -ProcessingStatusId
{{Fill ProcessingStatusId Description}}

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

### -Responded
{{Fill Responded Description}}

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
{{Fill ResponseDate Description}}

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

### -Completed
{{Fill Completed Description}}

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
{{Fill CompletedDate Description}}

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

### -Closed
{{Fill Closed Description}}

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

### -ClosedDate
{{Fill ClosedDate Description}}

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

### -ClosureCodeId
{{Fill ClosureCodeId Description}}

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

### -costs
{{Fill costs Description}}

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
