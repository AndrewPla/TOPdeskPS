---
external help file: TOPdeskPS-help.xml
Module Name: TOPdeskPS
online version:
schema: 2.0.0
---

# New-TdChange

## SYNOPSIS
Create a new Request for Change

## SYNTAX

```
New-TdChange [-RequesterId] <String> [-BriefDescription] <String> [[-ChangeType] <String>]
 [[-Request] <String>] [[-Action] <String>] [[-TemplateId] <String>] [[-ExternalNumber] <String>]
 [[-Category] <String>] [[-SubCategory] <String>] [[-Benefit] <String>] [[-Impact] <String>]
 [[-Priority] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Create new change request.
Can also use a change template to help fill out the change.
Also triggers Events and Actions.
Note!
Actions that require user interaction like "Confirm before sending" or "Editable before sending" will not be executed.

## EXAMPLES

### EXAMPLE 1
```
<example usage>
```

Explanation of what the example does

## PARAMETERS

### -RequesterId
Id of the requester of the change.
This is a person id.
See Get-TdPerson

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BriefDescription
Brief description of a created change.
example: Smartphone broken

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChangeType
Specify the type of change.
Options: Simple, Extensive

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
The request of the change
example: Dean reported that his smartphone is broken.
We need to order new ones.

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

### -Action
The action of the change.
example: I ordered 5 new smartphones.

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

### -TemplateId
Id of the template that you want.
if both TemplateId and TemplateNumber are set, then only the id weill be taken into account.

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

### -ExternalNumber
External number of the change.
example: 12345

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

### -Category
UUID or name of the category.
example: Software

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

### -SubCategory
UUID or name of the subcategory.
It must match with the provided category or the category of the template

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

### -Benefit
UUID or name of the benefit.
example: Cost Savings

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

### -Impact
UUID or name of the impact.
example: Branch

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

### -Priority
UUID or name of the priority.
example: Low

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
